using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKBCGAlgorithmFunctions
{

    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static int WKBOrientationIndex(byte[] wKBsegment, byte[] wKBptGeom)
    {
        Geometry segment = wKBReader.Read(wKBsegment);
        Geometry ptGeom = wKBReader.Read(wKBptGeom);
        int result = CGAlgorithmFunctions.OrientationIndex(segment, ptGeom);
        return result;
    }

    public static int WKBOrientationIndexDd(byte[] wKBsegment, byte[] wKBptGeom)
    {
        Geometry segment = wKBReader.Read(wKBsegment);
        Geometry ptGeom = wKBReader.Read(wKBptGeom);
        int result = CGAlgorithmFunctions.OrientationIndexDd(segment, ptGeom);
        return result;
    }

}
