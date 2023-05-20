using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTNTSFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    private static readonly double HEIGHT = 70;
    private static readonly double WIDTH = 150; //125;
    private static readonly double J_WIDTH = 30;
    private static readonly double J_RADIUS = J_WIDTH - 5;

    private static readonly double S_RADIUS = HEIGHT / 4;

    private static readonly double T_WIDTH = WIDTH - 2 * S_RADIUS - J_WIDTH;

    public static string WKTLogoLines(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = NTSFunctions.LogoLines(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTLogoBuffer(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = NTSFunctions.LogoBuffer(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}
