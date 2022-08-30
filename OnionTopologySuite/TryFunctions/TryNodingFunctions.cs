using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryNodingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static bool TryIsNodingValid(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        bool result = NodingFunctions.IsNodingValid(geom);
        return result;
    }

    public static bool TryIsSegmentNodingValid(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        bool result = NodingFunctions.IsSegmentNodingValid(geom);
        return result;
    }

    public static byte[] TryFindOneNode(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.FindOneNode(geom);
        /*System.ArgumentException
  HResult=0x80070057
  Message=ShouldNeverReachHere
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.IO.WKBWriter.GetBuffer(Geometry geometry, Boolean includeSRID)
   at NetTopologySuite.IO.WKBWriter.Write(Geometry geometry)
   at TryNodingFunctions.WKBFindOneNode(Byte[] wKBGeom) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBNodingFunctions.cs:line 36
*/
        return wKBWriter.Write(result);
    }

    public static byte[] TryFindNodes(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.FindNodes(geom);
        return wKBWriter.Write(result);
    }


    public static byte[] TryFindInteriorNodes(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.FindInteriorNodes(geom);
        return wKBWriter.Write(result);
    }

    public static int TryIntersectionCount(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        int result = NodingFunctions.IntersectionCount(geom);
        return result;
    }
    public static int TryInteriorIntersectionCount(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        int result = NodingFunctions.InteriorIntersectionCount(geom);
        return result;
    }

    public static byte[] TryMCIndexNodingWithPrecision(byte[] wKBGeom, double scaleFactor)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.MCIndexNodingWithPrecision(geom, scaleFactor);
        return wKBWriter.Write(result);
    }

    public static byte[] TryMCIndexNoding(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.MCIndexNoding(geom);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Reduces precision pointwise, then snap-rounds.
    /// Note that output set may not contain non-unique linework
    /// (and thus cannot be used as input to Polygonizer directly).
    /// UnaryUnion is one way to make the linework unique.
    /// </summary>
    /// <param name="geom">A geometry containing linework to node</param>
    /// <param name="scaleFactor">The precision model scale factor to use</param>
    /// <returns>The noded, snap-rounded linework</returns>
    public static byte[] TrySnapRoundWithPrecision(byte[] wKBGeom, double scaleFactor)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.MCIndexNodingWithPrecision(geom, scaleFactor);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Runs a ScaledNoder on input.
    /// Input vertices should be rounded to precision model.
    /// </summary>
    /// <param name="geom"></param>
    /// <param name="scaleFactor"></param>
    /// <returns>The noded geometry</returns>
    public static byte[] TryScaledNoding(byte[] wKBGeom, double scaleFactor)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.ScaledNoding(geom, scaleFactor);
        return wKBWriter.Write(result);
    }

}

