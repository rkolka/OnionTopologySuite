using NetTopologySuite.Geometries;
using NetTopologySuite.IO;


public static class WKBWKTFunctions
{
    private static readonly WKBReader wKBReader = new WKBReader();


    public static string WKBWKT(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            return g.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }


}

