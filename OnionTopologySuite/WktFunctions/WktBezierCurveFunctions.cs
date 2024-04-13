using NetTopologySuite.Algorithm;
using NetTopologySuite.Geometries;
using NetTopologySuite.Geometries.Implementation;
using NetTopologySuite.Shape;
using System;
using System.Windows.Forms;

public static class WKTBezierCurveFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static string WKTBezierCurveByAlpha(byte[] geomwkb, double alpha)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            return CubicBezierCurve.Create(geometry, alpha).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTBezierCurveByAlphaAndSkew(byte[] geomwkb, double alpha, double skew)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            return CubicBezierCurve.Create(geometry, alpha, skew).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTBezierCurveGetControlPoints(byte[] geomwkb, double alpha, double skew)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            return CubicBezierCurve.CreateControls(geometry, alpha, skew).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTBezierCurveWithControlPoints(byte[] geomwkb, byte[] controlPoints)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            Geometry _controlPoints = wKBReader.Read(controlPoints);
            return CubicBezierCurve.Create(geometry, _controlPoints).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }


    public static string WKTBezierCurveControlPoints(byte[] geomwkb, double alpha, double skew)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            Coordinate[] coordArray = CubicBezierCurve.ControlPoints(geometry.Coordinates, false, alpha, skew);
            Geometry result = geometry.Factory.CreateLinearRing(coordArray);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}

