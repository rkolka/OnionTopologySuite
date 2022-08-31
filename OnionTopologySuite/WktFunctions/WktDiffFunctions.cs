using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class WKTDiffFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTDiffVerticesBoth(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            GeometryCollection result = DiffFunctions.DiffVerticesBoth(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    /// <summary>
    /// Diff the vertices in A against B to
    /// find vertices in A which are not in B.
    /// </summary>
    /// <param name="a">A geometry</param>
    /// <param name="b">A geometry</param>
    /// <returns>The vertices in A which are not in B</returns>
    public static string WKTDiffVertices(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            GeometryCollection result = DiffFunctions.DiffVertices(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDiffSegments(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            GeometryCollection result = DiffFunctions.DiffSegments(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDiffSegmentsBoth(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            GeometryCollection result = DiffFunctions.DiffSegmentsBoth(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDuplicateSegments(byte[] wKBa)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            GeometryCollection result = DiffFunctions.DuplicateSegments(a);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSingleSegments(byte[] wKBa)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            GeometryCollection result = DiffFunctions.SingleSegments(a);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}

