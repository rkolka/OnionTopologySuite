using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryLinearReferencingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTExtractPoint(byte[] wKBGeom, double index)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = LinearReferencingFunctions.ExtractPoint(g, index);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTExtractLine(byte[] wKBGeom, double start, double end)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = LinearReferencingFunctions.ExtractLine(g, start, end);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTProject(byte[] wKBGeom, byte[] wKBGeom2)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LinearReferencingFunctions.Project(g, g2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTExtractLineByGeom(byte[] wKBGeom, byte[] wKBGeom2)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LinearReferencingFunctions.ExtractLineByGeom(g, g2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTExtractLineByGeomBounds(byte[] wKBGeom, byte[] wKBGeom2, double b1, double b2)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LinearReferencingFunctions.ExtractLineByGeomBounds(g, g2, b1, b2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
    public static string WKTProjectIndex(byte[] wKBGeom, byte[] wKBGeom2)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            double result = LinearReferencingFunctions.ProjectIndex(g, g2);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
}

