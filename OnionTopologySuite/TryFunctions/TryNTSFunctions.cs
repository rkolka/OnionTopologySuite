using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryNTSFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    private static readonly double HEIGHT = 70;
    private static readonly double WIDTH = 150; //125;
    private static readonly double J_WIDTH = 30;
    private static readonly double J_RADIUS = J_WIDTH - 5;

    private static readonly double S_RADIUS = HEIGHT / 4;

    private static readonly double T_WIDTH = WIDTH - 2 * S_RADIUS - J_WIDTH;

    public static byte[] TryLogoLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = NTSFunctions.LogoLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryLogoBuffer(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = NTSFunctions.LogoBuffer(g, distance);
        return wKBWriter.Write(result);
    }

}
