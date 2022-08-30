using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class WKBEditFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBAddHole(byte[] wKBpolyGeom, byte[] wKBhole)
    {
        Geometry polyGeom = wKBReader.Read(wKBpolyGeom);
        Geometry hole = wKBReader.Read(wKBhole);
        Geometry result = EditFunctions.AddHole(polyGeom, hole);
        return wKBWriter.Write(result);
    }

}

