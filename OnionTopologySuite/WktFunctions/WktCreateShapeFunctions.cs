using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTCreateShapeFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTGrid(byte[] wKBGeom, int nCells)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateShapeFunctions.Grid(g, nCells);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTGridPoints(byte[] wKBGeom, int nCells)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateShapeFunctions.GridPoints(g, nCells);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTSupercircle3(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateShapeFunctions.Supercircle3(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTSquircle(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateShapeFunctions.Squircle(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTSupercircle5(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateShapeFunctions.Supercircle5(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTSupercirclePoint5(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateShapeFunctions.SupercirclePoint5(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTSupercircle(byte[] wKBGeom, int nPts, double pow)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateShapeFunctions.Supercircle(g, nPts, pow);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTPointFieldCentroidStar(byte[] wKBptsGeom)
    {
        try
        {
            Geometry ptsGeom = wKBReader.Read(wKBptsGeom);
            Geometry result = CreateShapeFunctions.PointFieldCentroidStar(ptsGeom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTPointFieldStar(byte[] wKBptsGeom, byte[] wKBcentrePt)
    {
        try
        {
            Geometry ptsGeom = wKBReader.Read(wKBptsGeom);
            Geometry centrePt = wKBReader.Read(wKBcentrePt);
            Geometry result = CreateShapeFunctions.PointFieldStar(ptsGeom, centrePt);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

}

