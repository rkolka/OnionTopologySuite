using NetTopologySuite.Geometries;
using NetTopologySuite.Operation.Buffer;

public static class WKBOffsetCurveFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static byte[] WKBOffsetCurve(byte[] geomwkb, double distance)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return OffsetCurve.GetCurve(geometry, distance).ToBinary();
    }

    public static byte[] WKBOffsetCurveWithParams(byte[] geomwkb, double distance, int quadSegs, int joinStyle, double mitreLimit)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        JoinStyle _joinStyle = (JoinStyle)joinStyle;
        //Round = 1,
        //Mitre = 2,
        //Bevel = 3
        return OffsetCurve.GetCurve(geometry, distance, quadSegs, _joinStyle, mitreLimit).ToBinary();
    }

}

