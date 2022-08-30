using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKBCreateShapeFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBGrid(byte[] wKBGeom, int nCells)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateShapeFunctions.Grid(g, nCells);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBGridPoints(byte[] wKBGeom, int nCells)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateShapeFunctions.GridPoints(g, nCells);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSupercircle3(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateShapeFunctions.Supercircle3(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSquircle(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateShapeFunctions.Squircle(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSupercircle5(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateShapeFunctions.Supercircle5(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSupercirclePoint5(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateShapeFunctions.SupercirclePoint5(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSupercircle(byte[] wKBGeom, int nPts, double pow)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateShapeFunctions.Supercircle(g, nPts, pow);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPointFieldCentroidStar(byte[] wKBptsGeom)
    {
        Geometry ptsGeom = wKBReader.Read(wKBptsGeom);
        Geometry result = CreateShapeFunctions.PointFieldCentroidStar(ptsGeom);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPointFieldStar(byte[] wKBptsGeom, byte[] wKBcentrePt)
    {
        Geometry ptsGeom = wKBReader.Read(wKBptsGeom);
        Geometry centrePt = wKBReader.Read(wKBcentrePt);
        Geometry result = CreateShapeFunctions.PointFieldStar(ptsGeom, centrePt);
        return wKBWriter.Write(result);
    }

}

