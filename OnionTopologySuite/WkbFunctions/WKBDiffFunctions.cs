using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class WKBDiffFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBDiffVerticesBoth(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        GeometryCollection result = DiffFunctions.DiffVerticesBoth(a, b);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Diff the vertices in A against B to
    /// find vertices in A which are not in B.
    /// </summary>
    /// <param name="a">A geometry</param>
    /// <param name="b">A geometry</param>
    /// <returns>The vertices in A which are not in B</returns>
    public static byte[] WKBDiffVertices(byte[] wKBa, byte[] wKBb)
    {

        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        GeometryCollection result = DiffFunctions.DiffVertices(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDiffSegments(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        GeometryCollection result = DiffFunctions.DiffSegments(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDiffSegmentsBoth(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        GeometryCollection result = DiffFunctions.DiffSegmentsBoth(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDuplicateSegments(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        GeometryCollection result = DiffFunctions.DuplicateSegments(a);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSingleSegments(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        GeometryCollection result = DiffFunctions.SingleSegments(a);
        return wKBWriter.Write(result);
    }

}

