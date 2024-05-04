using NetTopologySuite.Geometries;
using NetTopologySuite.Shape;
using NetTopologySuite;
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

    public static byte[] WKBBezierCurveGetControlPoints(byte[] geomwkb, double alpha, double skew)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return CubicBezierCurve.CreateControls(geometry, alpha, skew).ToBinary();
    }

    public static byte[] WKBBezierCurveWithControlPoints(byte[] geomwkb, byte[] controlPoints)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        Geometry _controlPoints = wKBReader.Read(controlPoints);
        return CubicBezierCurve.Create(geometry, _controlPoints).ToBinary();
    }


    public static byte[] WKBBezierCurveControlPoints(byte[] geomwkb, double alpha, double skew)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        // TODO! for each branch, 
        
        Coordinate[] coordArray = CubicBezierCurve.ControlPoints(geometry.Coordinates, false, alpha, skew);
        Geometry result = geometry.Factory.CreateLinearRing(coordArray);
        return result.ToBinary();
    }


}

