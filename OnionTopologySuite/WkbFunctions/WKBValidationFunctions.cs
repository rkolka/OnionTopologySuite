using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class WKBValidationFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    /// <summary>
    /// Validates all geometries in a collection independently.
    /// Errors are returned as points at the invalid location
    /// </summary>
    /// <param name="g"></param>
    /// <returns>the invalid locations, if any</returns>
    public static byte[] WKBInvalidLocations(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ValidationFunctions.InvalidLocations(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBInvalidGeoms(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ValidationFunctions.InvalidGeoms(g);
        return wKBWriter.Write(result);
    }
}
