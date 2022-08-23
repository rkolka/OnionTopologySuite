using NetTopologySuite.Geometries;
using NetTopologySuite.Shape;

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
}

