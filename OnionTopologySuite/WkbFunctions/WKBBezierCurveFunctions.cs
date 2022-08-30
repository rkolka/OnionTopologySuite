using NetTopologySuite.Geometries;
using NetTopologySuite.Shape;
using System;

public static class WKBBezierCurveFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static byte[] WKBBezierCurveByAlpha(byte[] geomwkb, double alpha)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return CubicBezierCurve.Create(geometry, alpha).ToBinary();
    }

    public static byte[] WKBBezierCurveByAlphaAndSkew(byte[] geomwkb, double alpha, double skew)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return CubicBezierCurve.Create(geometry, alpha, skew).ToBinary();
    }
		// System.ArgumentException
		//    HResult=0x80070057
		//  Message=controlPoints
		//  Source = NetTopologySuite
		//  StackTrace:
		//   at NetTopologySuite.Shape.CubicBezierCurve.Create(Geometry geom, Geometry controlPoints)
		//   at WKBBezierCurveFunctions.WKBBezierCurveWithControlPoints(Byte[] geomwkb, Byte[] controlPoints) in E:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBBezierCurveFunctions.cs:line 26

		//  This exception was originally thrown at this call stack:
		//    [External Code]

		//    Inner Exception 1:
		//InvalidOperationException: Wrong number of control points for element 0 - expected 20 or 10, found 1

    public static byte[] WKBBezierCurveWithControlPoints(byte[] geomwkb, byte[] controlPoints)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        Geometry _controlPoints = wKBReader.Read(controlPoints);
        return CubicBezierCurve.Create(geometry, _controlPoints).ToBinary();

    }


    /* 
     * System.IndexOutOfRangeException
  HResult=0x80131508
  Message=Index was outside the bounds of the array.
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.Shape.CubicBezierCurve.BezierCurve(Coordinate[] coords, Boolean isRing)
   at NetTopologySuite.Shape.CubicBezierCurve.BezierRing(LinearRing ring)
   at NetTopologySuite.Shape.CubicBezierCurve.BezierPolygon(Polygon poly)
   at NetTopologySuite.Geometries.Utilities.GeometryMapper.FlatMap(Geometry geom, IMapOp op, List`1 mapped)
   at NetTopologySuite.Geometries.Utilities.GeometryMapper.FlatMap(Geometry geom, Dimension emptyDim, IMapOp op)
   at NetTopologySuite.Shape.CubicBezierCurve.Create(Geometry geom, Geometry controlPoints)
   at WKBBezierCurveFunctions.TryWKBBezierCurveWithControlPoints(Byte[] geomwkb, Byte[] controlPoints) in C:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBBezierCurveFunctions.cs:line 50

  This exception was originally thrown at this call stack:
    [External Code]
    WKBBezierCurveFunctions.TryWKBBezierCurveWithControlPoints(byte[], byte[]) in WKBBezierCurveFunctions.cs
     */
    public static string TryWKBBezierCurveWithControlPoints(byte[] geomwkb, byte[] controlPoints)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            Geometry _controlPoints = wKBReader.Read(controlPoints);
            byte[] _dummy = CubicBezierCurve.Create(geometry, _controlPoints).ToBinary();
            return "OK";
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }


    }
}

