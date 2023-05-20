using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTCGAlgorithmFunctions
{

    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTOrientationIndex(byte[] wKBsegment, byte[] wKBptGeom)
    {
        try
        {
            Geometry segment = wKBReader.Read(wKBsegment);
            Geometry ptGeom = wKBReader.Read(wKBptGeom);
            int result = CGAlgorithmFunctions.OrientationIndex(segment, ptGeom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTOrientationIndexDd(byte[] wKBsegment, byte[] wKBptGeom)
    {
        try
        {
            Geometry segment = wKBReader.Read(wKBsegment);
            Geometry ptGeom = wKBReader.Read(wKBptGeom);
            int result = CGAlgorithmFunctions.OrientationIndexDd(segment, ptGeom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

}
