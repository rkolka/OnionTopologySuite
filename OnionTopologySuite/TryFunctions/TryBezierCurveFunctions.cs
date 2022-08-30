using NetTopologySuite.Geometries;
using NetTopologySuite.Shape;
using System;

public static class TryBezierCurveFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static string TryBezierCurveByAlpha(byte[] geomwkb, double alpha)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            byte[] _dummy = CubicBezierCurve.Create(geometry, alpha).ToBinary();
            return "OK";
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string TryBezierCurveByAlphaAndSkew(byte[] geomwkb, double alpha, double skew)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            byte[] _dummy = CubicBezierCurve.Create(geometry, alpha, skew).ToBinary();
            return "OK";
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
		
    public static string TryBezierCurveWithControlPoints(byte[] geomwkb, byte[] controlPoints)
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


    public static string TryBezierCurveDefaultControlPoints(byte[] geomwkb, double alpha, double skew)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            
            return "OK";
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}

