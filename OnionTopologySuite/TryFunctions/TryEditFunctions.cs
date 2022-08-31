using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class TryEditFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTAddHole(byte[] wKBpolyGeom, byte[] wKBhole)
    {
        try
        {
            Geometry polyGeom = wKBReader.Read(wKBpolyGeom);
            Geometry hole = wKBReader.Read(wKBhole);
            Geometry result = EditFunctions.AddHole(polyGeom, hole);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}

