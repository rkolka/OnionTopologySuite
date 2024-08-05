using System;
using System.Numerics;
using Manifold;

using Coord2 = Manifold.Point<double>;

public partial class Script
{

    //-- chosen to make curve at right-angle corners roughly circular
    private const float CIRCLE_LEN_FACTOR = (3.0f / 8.0f);

    private static readonly float default_min_segment_length = 0.0f;
    private static readonly int num_of_bezier_segments = 16;
    private static readonly float[,] interpolation_params = ComputeIterpolationParameters(num_of_bezier_segments);

    private static readonly float default_alpha = -1;
    private static float default_skew = 0;



    /// <summary>
    /// Creates a geometry of linearized Cubic Bezier Curves
    /// defined by the segments of the inputand a parameter
    /// controlling how curved the result should be, with a skew factor
    /// affecting the curve shape at each vertex.
    /// </summary>
    /// <param name="geom">The geometry defining the curve</param>
    /// <param name="alpha">The curvedness parameter (0 is linear, 1 is round, >1 is increasingly curved)</param>
    /// <param name="skew">The skew parameter (0 is none, positive skews towards longer side, negative towards shorter</param>
    /// <returns>The linearized curved geometry</returns>

    public static Geom GeomBezierControls(Geom geom) => GeomBezierControls(geom, default_alpha, default_skew);
    public static Geom GeomBezierControlsAlpha(Geom geom, double alpha) => GeomBezierControls(geom, (float)alpha, default_skew);
    public static Geom GeomBezierControlsAlphaSkew(Geom geom, double alpha, double skew) => GeomBezierControls(geom, (float)alpha, (float)skew);

    public static Geom GeomBezier(Geom geom) => CubicBezier(geom, GeomBezierControls(geom, default_alpha, default_skew));
    public static Geom GeomBezierAlpha(Geom geom, double alpha) => CubicBezier(geom, GeomBezierControls(geom, (float)alpha, default_skew));
    public static Geom GeomBezierAlphaSkew(Geom geom, double alpha, double skew) => CubicBezier(geom, GeomBezierControls(geom, (float)alpha, (float)skew));

    public static Geom GeomBezierWithControls(Geom geom, Geom controls) {

        if (CheckControls(geom, controls) == "OK")
        {
            return CubicBezier(geom, controls);
        }
        else
        {
            return geom;
        }
    }



    /// <summary>
    /// Builds a new geom from ´geom´ where coord at `index´ is replaced with `newCoord`
    /// </summary>
    /// <param name="geom">a geom</param>
    /// <param name="index">an integer</param>
    /// <param name="newCoord">a float64x2</param>
    /// <returns>New geom with one coordinate changed, or geom if index out of range.</returns>
    private static Geom CubicBezier(Geom geom, Geom controls)
    {

        if (geom == null || geom.Type == "point")
        {
            return null;
        }

        Manifold.GeomBuilder builder = Manifold.Application.CreateGeomBuilder();

        string type = geom.Type;

        switch (type)
        {
            case "line":
                builder.StartGeomLine();
                break;
            case "area":
                builder.StartGeomArea();
                break;
            default:
                return null;
        }



        return builder.EndGeom();

    }


    public static Manifold.Geom GeomBezierControls(Manifold.Geom geom, float alpha, float skew)
    {
        if (geom == null || geom.Type == "point")
        {
            return null;
        }

        Manifold.GeomBuilder builder = Manifold.Application.CreateGeomBuilder();

        string type = geom.Type;
        switch (type)
        {
            case "line":
                builder.StartGeomLine();
                break;
            case "area":
                builder.StartGeomArea();
                break;
            default:
                return geom;
        }


        // for every coord (and its prec and succ coord, make a line)
        // for first and last one, there must be another way
        // also depending if isRing
        for (int branch = 0; branch < geom.Branches.Count; ++branch)
        { 
            Manifold.Geom.CoordSet coords = geom.Branches[branch].Coords;
            if (coords.Count >= 3)
            {
                Vector2 first = v2(coords[0]);
                Vector2 last = v2(coords[coords.Count - 1]);
                bool is_ring = (first == last);
                // first and last are always special but different ways whether is_ring on not
                if (is_ring)
                {
                    AddBranch(builder, ControlLine(coords[coords.Count - 2], coords[0], coords[1], alpha, skew, false));
                } 
                else
                {
                    //find the reflected == true 
                    AddBranch(builder, ControlLine(coords[2], coords[1], coords[0], alpha, skew, true));
                }

                // middle ones are "standard"
                for (int i = 1; i < coords.Count - 2; ++i)
                {
                    AddBranch(builder, ControlLine(coords[i + 1], coords[i], coords[i - 1], alpha, skew, false));
                    AddBranch(builder, ControlLine(coords[i - 1], coords[i], coords[i + 1], alpha, skew, false));
                }

                // first and last are always special but different ways whether is_ring on not
                if (is_ring)
                {
                    AddBranch(builder, ControlLine(coords[1], coords[coords.Count - 1], coords[coords.Count - 2], alpha, skew, false));
                }
                else
                {
                    AddBranch(builder, ControlLine(coords[coords.Count - 3], coords[coords.Count - 2], coords[coords.Count - 1], alpha, skew, true));
                }

            }
        }

        return builder.EndGeom();

    }



    /// <summary>
    /// Creates a geometry of linearized Cubic Bezier Curves
    /// defined by the segments of the input
    /// and a list (or lists) of control points.
    /// </summary>
    /// <remarks>
    /// Typically the control point geometry
    /// is a <see cref="LineString"/> or <see cref="MultiLineString"/>
    /// containing an element for each line or ring in the input geometry.
    /// The list of control points for each linear element must contain two
    /// vertices for each segment (and thus <code>2 * npts - 2</code>).
    /// </remarks>
    /// <param name="geom">The geometry defining the curve</param>
    /// <param name="controlPoints">A geometry containing the control point elements.</param>
    /// <returns>The linearized curved geometry</returns>

    
    public static string CheckControls(Geom geom, Geom controls)
    {
        return string.Format("Wrong number of control points for {0} - expected {1} or {2}, found {3}", geom.Type, geom.Coords.Count, geom.Coords.Count + 1, controls.Coords.Count);
    }

    /// <summary>
    /// Given segment endpoints and controlpoints 
    /// </summary>
    /// <param name="p0"></param>
    /// <param name="p1"></param>
    /// <param name="ctrl0"></param>
    /// <param name="crtl1"></param>
    /// <returns></returns>
    private static Coord2[] AddCurve(
        Coord2 p0,
        Coord2 p1,
        Coord2 ctrl0,
        Coord2 crtl1
         )
    {

        Coord2[] segment_curve_buffer;

        double len = Distance(p0, p1);
        if (len < default_min_segment_length)
        {
            // segment too short - copy input coordinate
            segment_curve_buffer = new Coord2[1];
            segment_curve_buffer[0] = p1;
        }
        else
        {
            segment_curve_buffer = CubicBezierSegment(p0, p1, ctrl0, crtl1, interpolation_params);
    
        }

        return segment_curve_buffer;
    }

    /// <summary>
    /// Finds controlpoint for p1 coming from p0 and going to p2
    /// 
    /// Given the middle point p1 with neighbouring points p0 and p2 
    /// and 
    /// </summary>
    /// <param name="p0"></param>
    /// <param name="p1"></param>
    /// <param name="p2"></param>
    /// <param name="alpha"></param>
    /// <param name="skew"></param>
    /// <param name="reflected"></param>
    /// <returns></returns>
    public static Coord2[] ControlLine(Coord2 p0, Coord2 p1, Coord2 p2, float alpha, float skew, bool reflected)
    {
        Vector2 v_0 = v2(p0);
        Vector2 v_1 = v2(p1);
        Vector2 v_2 = v2(p2);

        // vectors from middle point to previous and to next point
        // their lengths
        Vector2 v_10 = ab2(v_1, v_0);
        Vector2 v_12 = ab2(v_1, v_2);
        float len_10 = v_10.Length();
        float len_12 = v_12.Length();
        float lenBase = Math.Min(len_10, len_12);

        // unitvectors and the "tangent" unitvector
        Vector2 v_10hat = hat2(v_10);
        Vector2 v_12hat = hat2(v_12);
        Vector2 tangent = hat2(-v_10hat + v_12hat);

        //-- make acute corners sharper by shortening tangent vectors
        float intAngAbs = AngleBetweenAbs2(v_10, v_12);
        float sharpnessFactor = intAngAbs >= TAU_OVER_4 ? 1 : intAngAbs / TAU_OVER_4;

        // 
        float len = alpha * CIRCLE_LEN_FACTOR * sharpnessFactor * lenBase;

        // 
        float stretch0 = 1f;
        float stretch1 = 1f;
        if (skew != 0)
        {
            float stretch = Math.Abs(len_10 - len_12) / Math.Max(len_10, len_12);
            int skewIndex = len_10 > len_12 ? 0 : 1;
            if (skew < 0) skewIndex = 1 - skewIndex;
            if (skewIndex == 0)
            {
                stretch0 += Math.Abs(skew) * stretch;
            }
            else
            {
                stretch1 += Math.Abs(skew) * stretch;
            }
        }
        
        // find the control vector
        var ctl = tangent * stretch1 * len;

        // find the reflected point
        // used for first/last points not having prev/next 
        if (reflected)
        {
            
            ctl = Vector2.Reflect(ctl, perp2(v_12hat));
            return new Coord2[] { c2(v_2), c2(v_2 - ctl) };
        }
        else
        {
            return new Coord2[] { c2(v_1), c2(v_1 + ctl) };
        }
    }


    /// <summary>
    /// Calculates vertices along a cubic Bezier curve.
    /// </summary>
    /// <param name="p0">The start point</param>
    /// <param name="p1">The end point</param>
    /// <param name="ctrl1">The first control point</param>
    /// <param name="ctrl2">The second control point</param>
    /// <param name="param">A set of interpolation parameters</param>
    /// <param name="curve">An array to hold generated points.</param>
    private static Coord2[] CubicBezierSegment(
        Coord2 p0,
        Coord2 p1,
        Coord2 ctrl1,
        Coord2 ctrl2,
        float[,] param
        )
    {
        Coord2[] curve = new Coord2[num_of_bezier_segments];
        int n = curve.Length;
        curve[0] = p0;
        curve[n - 1] = p1;

        for (int i = 1; i < n - 1; i++)
        {
            Coord2 c = new Coord2();
            c.X = param[i, 0] * p0.X + param[i, 1] * ctrl1.X + param[i, 2] * ctrl2.X + param[i, 3] * p1.X;
            c.Y = param[i, 0] * p0.Y + param[i, 1] * ctrl1.Y + param[i, 2] * ctrl2.Y + param[i, 3] * p1.Y;

            curve[i] = c;
        }

        return curve;
    }

    /// <summary>
    /// Gets the interpolation parameters for a Bezier curve approximated by a
    /// given number of segments.
    /// </summary>
    /// <param name="n">The number of segments</param>
    /// <returns>An array of double[n + 1, 4] holding the parameter values</returns>
    private static float[,] ComputeIterpolationParameters(int n)
    {
        int iterations = (n >> 1) + 1;
        float[,] param = new float[n + 1, 4];
        for (int i = 0; i < iterations; i++)
        {
            float t = (float)i / n;
            float tc = 1.0f - t;
            float remaining = 1;
            float temp;
            int j = n - i;

            temp = tc * tc * tc;
            param[i, 0] = temp;
            param[j, 3] = temp;
            remaining -= temp;

            temp = 3.0f * tc * tc * t;
            param[i, 1] = temp;
            param[j, 2] = temp;
            remaining -= temp;

            temp = 3.0f * tc * t * t;
            param[i, 2] = temp;
            param[j, 1] = temp;
            remaining -= temp;

            param[i, 3] = remaining;
            param[j, 0] = remaining;

            //double diff = remaining - t * t * t;
            //Console.WriteLine(diff.ToString("R"));
        }
        return param;
    }




}
