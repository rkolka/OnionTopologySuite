
using OnionTopologySuite;
using System;

namespace OnionTopologySuite
{
    public static class BezierFun
    {


        /// <summary>
        /// Creates a geometry of linearized Cubic Bezier Curves
        /// defined by the segments of the input and a parameter
        /// controlling how curved the result should be.
        /// </summary>
        /// <param name="geom">The geometry defining the curve</param>
        /// <param name="alpha">A curvedness parameter (0 is linear, 1 is round, >1 is increasingly curved)</param>
        /// <returns>The linearized curved geometry</returns>
        public static Geometry CubicBezierAlpha(Geometry geom, double alpha)
        {
            var curve = new CubicBezierCurve(geom, alpha);
            return curve.GetResult();
        }

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
        public static Geometry CubicBezierAlphaSkew(Geometry geom, double alpha, double skew)
        {
            var curve = new CubicBezierCurve(geom, alpha, skew);
            return curve.GetResult();
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
        public static Geometry CubicBezierWithControls(Geometry geom, Geometry controlPoints)
        {
            var curve = new CubicBezierCurve(geom, controlPoints);
            try
            {
                return curve.GetResult();
            }
            catch (InvalidOperationException e)
            {
                throw new ArgumentException(nameof(controlPoints), e);
            }
        }

        //-- chosen to make curve at right-angle corners roughly circular
        private const double CIRCLE_LEN_FACTOR = 3.0 / 8.0;

        private static readonly double default_min_segment_length = 0.0;
        private static readonly int num_vertices_per_segment = 16;
        private static readonly double[,] interpolation_params = ComputeIterpolationParameters(num_vertices_per_segment);

        private static readonly double _alpha = -1;
        private static double _skew;

        private static int _controlPointIndex;

        

        /// <summary>
        /// Creates a new instance producing a Bezier curve defined by a geometry
        /// and an alpha curvedness value.
        /// </summary>
        /// <param name="geom">The geometry defining curve</param>
        /// <param name="alpha">A curvedness parameter (0 = linear, 1 = round, 2 = distorted)</param>
        BezierFun(Geometry geom, double alpha)
        {
            _inputGeom = geom;
            _geomFactory = geom.Factory;
            if (alpha < 0.0) alpha = 0;
            _alpha = alpha;
        }

        /// <summary>
        /// Creates a new instance producing a Bezier curve defined by a geometry,
        /// an alpha curvedness value, and a skew factor.
        /// </summary>
        /// <param name="geom">The geometry defining curve</param>
        /// <param name="alpha">curvedness parameter (0 is linear, 1 is round, >1 is increasingly curved)</param>
        /// <param name="skew">The skew parameter (0 is none, positive skews towards longer side, negative towards shorter</param>
        BezierFun(Geometry geom, double alpha, double skew)
        {
            _inputGeom = geom;
            _geomFactory = geom.Factory;
            if (alpha < 0.0) alpha = 0;
            _alpha = alpha;
            _skew = skew;
        }

        /// <summary>
        /// Creates a new instance producing a Bezier curve defined by a geometry,
        /// and a list (or lists) of control points.
        /// </summary><remarks>
        /// <para/>
        /// Typically the control point geometry
        /// is a <see cref="LineString"/> or <see cref="MultiLineString"/>
        /// containing an element for each line or ring in the input geometry.
        /// The list of control points for each linear element must contain two
        /// vertices for each segment (and thus <code>2 * npts - 2</code>).
        /// </remarks>
        BezierFun(Geometry geom, Geometry controlPoints)
        {
            _inputGeom = geom;
            _geomFactory = geom.Factory;
            _controlPoints = controlPoints;
        }

        /// <summary>
        /// Gets the computed Bezier curve geometry
        /// </summary>
        /// <returns>The curved geometry</returns>
        public Geometry GetResult()
        {
            Coord[] segment_curve_buffer;
            segment_curve_buffer = new Coord[num_vertices_per_segment];

            return GeometryMapper.FlatMap(_inputGeom, Dimension.Curve,
                new GeometryMapper.MapOp((geom) =>
                {
                    if (geom is LineString)
                        return BezierLine((LineString)geom);
                    if (geom is Polygon)
                        return BezierPolygon((Polygon)geom);

                    //-- Points
                    return geom.Copy();
                }));
        }

        public static Geometry CreateControls(Geometry geom, double alpha, double skew)
        {
            var curve = new CubicBezierCurve(geom, alpha, skew);
            return curve.GetControls();
        }
        /// <summary>
        /// Gets the Control points of Bezier curve geometry
        /// </summary>
        /// <returns>The control point geometry</returns>
        public Geometry GetControls()
        {

            return GeometryMapper.FlatMap(_inputGeom, Dimension.Curve,
                new GeometryMapper.MapOp((geom) =>
                {
                    if (geom is LineString)
                        return BezierLineControls((LineString)geom);
                    if (geom is Polygon)
                        return BezierPolygonControls((Polygon)geom);

                    //-- Points
                    return geom.Copy();
                }));
        }

        private LineString BezierLine(LineString ls)
        {
            var coords = ls.Coordinates;
            var curvePts = BezierCurve(coords, false);
            curvePts.Add(coords[coords.Length - 1].Copy(), false);
            return _geomFactory.CreateLineString(curvePts.ToCoordinateArray());
        }
        private LineString BezierLineControls(LineString ls)
        {
            return _geomFactory.CreateLineString(ControlPoints(ls.Coordinates, false));
        }

        private Polygon BezierPolygonControls(Polygon poly)
        {
            var shell = _geomFactory.CreateLinearRing(ControlPoints(poly.ExteriorRing.Coordinates, true));
            LinearRing[] holes = null;
            if (poly.NumInteriorRings > 0)
            {
                holes = new LinearRing[poly.NumInteriorRings];
                for (int i = 0; i < poly.NumInteriorRings; i++)
                {
                    holes[i] = _geomFactory.CreateLinearRing(ControlPoints(poly.GetInteriorRingN(i).Coordinates, true));
                }
            }
            return _geomFactory.CreatePolygon(shell, holes);
        }

        private LinearRing BezierRing(LinearRing ring)
        {
            var coords = ring.Coordinates;
            var curvePts = BezierCurve(coords, true);
            curvePts.CloseRing();
            return _geomFactory.CreateLinearRing(curvePts.ToCoordinateArray());
        }

        private Polygon BezierPolygon(Polygon poly)
        {
            var shell = BezierRing((LinearRing)poly.ExteriorRing);
            LinearRing[] holes = null;
            if (poly.NumInteriorRings > 0)
            {
                holes = new LinearRing[poly.NumInteriorRings];
                for (int i = 0; i < poly.NumInteriorRings; i++)
                {
                    holes[i] = BezierRing((LinearRing)poly.GetInteriorRingN(i));
                }
            }
            return _geomFactory.CreatePolygon(shell, holes);
        }

        private CoordinateList BezierCurve(Coordinate[] coords, bool isRing)
        {
            var control = ControlPoints(coords, isRing);
            var curvePts = new CoordinateList();
            for (int i = 0; i < coords.Length - 1; i++)
            {
                int ctrlIndex = 2 * i;
                AddCurve(coords[i], coords[i + 1], control[ctrlIndex], control[ctrlIndex + 1], curvePts);
            }
            return curvePts;
        }

        public string CheckControlPoints(Coord[] coords, Coord[] controls, bool isRing)
        {
            if (controls != null)
            {
                if (_controlPointIndex >= controls.NumGeometries)
                {
                    throw new InvalidOperationException("Too few control point elements");
                }
                var ctrlPtsGeom = _controlPoints.GetGeometryN(_controlPointIndex);
                var ctrlPts = ctrlPtsGeom.Coordinates;

                int expectedNum1 = 2 * coords.Length - 2;
                int expectedNum2 = isRing ? coords.Length - 1 : coords.Length;
                if (expectedNum1 != ctrlPts.Length && expectedNum2 != ctrlPts.Length)
                {
                    throw new InvalidOperationException(
                        string.Format("Wrong number of control points for element {0} - expected {1} or {2}, found {3}",
                            _controlPointIndex, expectedNum1, expectedNum2, ctrlPts.Length
                              ));
                }
                _controlPointIndex++;
                return ctrlPts;
            }
        }

        private static void AddCurve(
            Coord p0, 
            Coord p1,
            Coord ctrl0, 
            Coord crtl1,
            CoordinateList curvePts)
        {
            double len = Distance(p0, p1);
            if (len < default_min_segment_length)
            {
                // segment too short - copy input coordinate
                curvePts.Add(new Coordinate(p0));

            }
            else
            {
                CubicBezier(p0, p1, ctrl0, crtl1,
                    interpolation_params, segment_curve_buffer);
                for (int i = 0; i < segment_curve_buffer.Length - 1; i++)
                {
                    curvePts.Add(segment_curve_buffer[i], false);
                }
            }
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

                double interiorAng = AngleFun.AngleBetweenOriented(v0, v1, v2);
                double orient = Math.Sign(interiorAng);
                double angBisect = AngleFun.Bisector(v0, v1, v2);
                double ang0 = angBisect - orient * AngleFun.PiOver2;
                double ang1 = angBisect + orient * AngleFun.PiOver2;

                double dist0 = CoordFun.Distance(v1, v0);
                double dist1 = CoordFun.Distance(v1, v2);
                double lenBase = Math.Min(dist0, dist1);
                double intAngAbs = Math.Abs(interiorAng);

                //-- make acute corners sharper by shortening tangent vectors
                double sharpnessFactor = intAngAbs >= AngleFun.PiOver2 ? 1 : intAngAbs / AngleFun.PiOver2;

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
                var ctl0 = AngleFun.Project(v1, ang0, stretch0 * len);
                var ctl1 = AngleFun.Project(v1, ang1, stretch1 * len);

                int index = 2 * i - 1;
                // for a ring case the first control point is for last segment
                int i0 = index < 0 ? nControl - 1 : index;
                ctrl[i0] = ctl0;
                ctrl[index + 1] = ctl1;

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
            double len = CoordFun.Distance(p1, c);
            double ang = AngleFun.Angle(p0, p1);
            return AngleFun.Project(p0, ang, len);
        }


        private static Coord MirrorControlPoint(Coord c, Coord p0, Coord p1)
        {
            double vlinex = p1.X - p0.X;
            double vliney = p1.Y - p0.Y;
            // rotate line vector by 90
            double vrotx = -vliney;
            double vroty = vlinex;

            double midx = (p0.X + p1.X) / 2;
            double midy = (p0.Y + p1.Y) / 2;

            return ReflectPointInLine(c, new Coord(midx, midy), new Coord(midx + vrotx, midy + vroty));
        }

        private static Coord ReflectPointInLine(Coord p, Coord p0, Coord p1)
        {
            double vx = p1.X - p0.X;
            double vy = p1.Y - p0.Y;
            double x = p0.X - p.X;
            double y = p0.Y - p.Y;
            double r = 1 / (vx * vx + vy * vy);
            double rx = p.X + 2 * (x - x * vx * vx * r - y * vx * vy * r);
            double ry = p.Y + 2 * (y - y * vy * vy * r - x * vx * vy * r);
            return new Coord(rx, ry);
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
        private static void CubicBezier(
            Coord p0,
            Coord p1,
            Coord ctrl1,
            Coord ctrl2,
            double[,] param,
            Coord[] curve)
        {

            int n = curve.Length;
            curve[0] = p0;
            curve[n - 1] = p1;

            for (int i = 1; i < n - 1; i++)
            {
                Coord c;
                c.X = param[i, 0] * p0.X + param[i, 1] * ctrl1.X + param[i, 2] * ctrl2.X + param[i, 3] * p1.X;
                c.Y = param[i, 0] * p0.Y + param[i, 1] * ctrl1.Y + param[i, 2] * ctrl2.Y + param[i, 3] * p1.Y;

                curve[i] = c;
            }
        }

        /// <summary>
        /// Gets the interpolation parameters for a Bezier curve approximated by a
        /// given number of vertices.
        /// </summary>
        /// <param name="n">The number of vertices</param>
        /// <returns>An array of double[n + 1, 4] holding the parameter values</returns>
        private static double[,] ComputeIterpolationParameters(int n)
        {
            int iterations = (n >> 1) + 1;
            double[,] param = new double[n + 1, 4];
            for (int i = 0; i < iterations; i++)
            {
                double t = (double)i / n;
                double tc = 1.0 - t;
                double remainder = 1;

                double temp = tc * tc * tc;
                param[i, 0] = temp;
                param[n - i, 3] = temp;
                remainder -= temp;

                temp = 3.0 * tc * tc * t;
                param[i, 1] = temp;
                param[n - i, 2] = temp;
                remainder -= temp;

                temp = 3.0 * tc * t * t;
                param[i, 2] = temp;
                param[n - i, 1] = temp;
                remainder -= temp;

                param[i, 3] = remainder;
                param[n - i, 0] = remainder;

                //double diff = remainder - t * t * t;
                //Console.WriteLine(diff.ToString("R"));
            }
            return param;
        }




    }
}