using System;
using Manifold;


//using OnionTopologySuite;
using Coord = Manifold.Point<double>;

public partial class Script
{

    //-- chosen to make curve at right-angle corners roughly circular
    private const double CIRCLE_LEN_FACTOR = 3.0 / 8.0;

    private static readonly double default_min_segment_length = 0.0;
    private static readonly int num_of_bezier_segments = 16;
    private static readonly double[,] interpolation_params = ComputeIterpolationParameters(num_of_bezier_segments);

    private static readonly double default_alpha = -1;
    private static double default_skew = 0;



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
    public static Geom GeomBezierControlsAlpha(Geom geom, double alpha) => GeomBezierControls(geom, alpha, default_skew);
    public static Geom GeomBezierControlsAlphaSkew(Geom geom, double alpha, double skew) => GeomBezierControls(geom, alpha, skew);

    public static Geom GeomBezier(Geom geom) => CubicBezier(geom, GeomBezierControls(geom, default_alpha, default_skew));
    public static Geom GeomBezierAlpha(Geom geom, double alpha) => CubicBezier(geom, GeomBezierControls(geom, alpha, default_skew));
    public static Geom GeomBezierAlphaSkew(Geom geom, double alpha, double skew) => CubicBezier(geom, GeomBezierControls(geom, alpha, skew));

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



    /// <summary>
    /// Builds a new geom from ´geom´ where coord at `index´ is replaced with `newCoord`
    /// </summary>
    /// <param name="geom">a geom</param>
    /// <param name="index">an integer</param>
    /// <param name="newCoord">a float64x2</param>
    /// <returns>New geom with one coordinate changed, or geom if index out of range.</returns>
    public static Manifold.Geom GeomBezierControls(Manifold.Geom geom, double alpha, double skew)
    {
        if (geom == null || geom.Type == "point")
        {
            return null;
        }

        Manifold.GeomBuilder builder = Manifold.Application.CreateGeomBuilder();

        switch (geom.Type)
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



        for (int branch = 0; branch < geom.Branches.Count; ++branch)
        {
            Manifold.Geom.CoordSet coords = geom.Branches[branch].Coords;
            for (int i = 1; i < coords.Count - 1; ++i)
            {
                builder.AddBranch();
                ControlPoints(coords[i - 1], coords[i], coords[i + 1], alpha, skew);
                builder.EndBranch();
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

    private static Coord[] AddCurve(
        Coord p0,
        Coord p1,
        Coord ctrl0,
        Coord crtl1
         )
    {

        Coord[] segment_curve_buffer;

        double len = Distance(p0, p1);
        if (len < default_min_segment_length)
        {
            // segment too short - copy input coordinate
            segment_curve_buffer = new Coord[1];
            segment_curve_buffer[0] = p1;
        }
        else
        {
            segment_curve_buffer = CubicBezierSegment(p0, p1, ctrl0, crtl1, interpolation_params);
    
        }

        return segment_curve_buffer;
    }

    /// <summary>
    /// Control points for 
    /// </summary>
    /// <param name="v0"></param>
    /// <param name="v1"></param>
    /// <param name="v2"></param>
    /// <returns></returns>
    public static (Coord, Coord) ControlPoints(Coord v0, Coord v1, Coord v2, double alpha, double skew)
    {

        double interiorAng = AngleBetweenOriented(v0, v1, v2);
        double orient = Math.Sign(interiorAng);
        double angBisect = Bisector(v0, v1, v2);
        double ang0 = angBisect - orient * PiOver2;
        double ang1 = angBisect + orient * PiOver2;

        double dist0 = Distance(v1, v0);
        double dist1 = Distance(v1, v2);
        double lenBase = Math.Min(dist0, dist1);
        double intAngAbs = Math.Abs(interiorAng);

        //-- make acute corners sharper by shortening tangent vectors
        double sharpnessFactor = intAngAbs >= PiOver2 ? 1 : intAngAbs / PiOver2;

        double len = alpha * CIRCLE_LEN_FACTOR * sharpnessFactor * lenBase;
        double stretch0 = 1;
        double stretch1 = 1;
        if (skew != 0)
        {
            double stretch = Math.Abs(dist0 - dist1) / Math.Max(dist0, dist1);
            int skewIndex = dist0 > dist1 ? 0 : 1;
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
        var ctl0 = Project(v1, ang0, stretch0 * len);
        var ctl1 = Project(v1, ang1, stretch1 * len);

        return (ctl0, ctl1);
    }

    /// <summary>
    /// Creates control points for each vertex of curve.
    /// The control points are collinear with each vertex,
    /// thus providing C1-continuity.
    /// By default the control vectors are the same length,
    /// which provides C2-continuity(same curvature on each
    /// side of vertex.
    /// The alpha parameter controls the length of the control vectors.
    /// Alpha = 0 makes the vectors zero-length, and hence flattens the curves.
    /// Alpha = 1 makes the curve at right angles roughly circular.
    /// Alpha > 1 starts to distort the curve and may introduce self-intersections.
    /// <para/>
    /// The control point array contains a pair of coordinates for each input segment.
    /// </summary>
    public static Coord[] ControlPoints(Coord[] coords, bool isRing, double alpha, double skew)
    {
        int N = coords.Length;
        int start = 1;
        int end = N - 1;

        if (isRing)
        {
            N = coords.Length - 1;
            start = 0;
            end = N;
        }

        int nControl = 2 * coords.Length - 2;
        var ctrl = new Coord[nControl];

        for (int i = start; i < end; i++)
        {
            int iprev = i == 0 ? N - 1 : i - 1;
            var v0 = coords[iprev];
            var v1 = coords[i];
            var v2 = coords[i + 1];

        }
        if (!isRing)
        {
            // Sets the end control points for a line.
            // Produce a symmetric curve for the first and last segments
            // by using mirrored control points for start and end vertex.
            int last_ctrl = ctrl.Length - 1;

            ctrl[0] = MirrorControlPoint(ctrl[1], coords[1], coords[0]);
            ctrl[last_ctrl] = MirrorControlPoint(ctrl[last_ctrl - 1],
                coords[coords.Length - 1], coords[coords.Length - 2]);
        }
        return ctrl;
    }

    /// <summary>
    /// Creates a control point aimed at the control point at the opposite end of the segment.
    /// </summary>
    private static Coord AimedControlPoint(Coord c, Coord p1, Coord p0)
    {
        double len = Distance(p1, c);
        double ang = Angle(p0, p1);
        return Project(p0, ang, len);
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
    private static Coord[] CubicBezierSegment(
        Coord p0,
        Coord p1,
        Coord ctrl1,
        Coord ctrl2,
        double[,] param
        )
    {
        Coord[] curve = new Coord[num_of_bezier_segments];
        int n = curve.Length;
        curve[0] = p0;
        curve[n - 1] = p1;

        for (int i = 1; i < n - 1; i++)
        {
            Coord c = new Coord();
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
    private static double[,] ComputeIterpolationParameters(int n)
    {
        int iterations = (n >> 1) + 1;
        double[,] param = new double[n + 1, 4];
        for (int i = 0; i < iterations; i++)
        {
            double t = (double)i / n;
            double tc = 1.0 - t;
            double remaining = 1;
            double temp;
            int j = n - i;

            temp = tc * tc * tc;
            param[i, 0] = temp;
            param[j, 3] = temp;
            remaining -= temp;

            temp = 3.0 * tc * tc * t;
            param[i, 1] = temp;
            param[j, 2] = temp;
            remaining -= temp;

            temp = 3.0 * tc * t * t;
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
