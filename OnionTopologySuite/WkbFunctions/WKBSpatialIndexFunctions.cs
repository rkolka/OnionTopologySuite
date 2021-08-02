using System;
using System.Collections.Generic;
using System.Linq;
using NetTopologySuite.Geometries;
using NetTopologySuite.Index.Chain;
using NetTopologySuite.Index.KdTree;
using NetTopologySuite.Index.Quadtree;
using NetTopologySuite.Index.Strtree;

using Open.Topology.TestRunner.Functions;

public class WKBSpatialIndexFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBKdTreeQuery(byte[] wKBpts, byte[] wKBquery, double tolerance)
    {
        Geometry pts = wKBReader.Read(wKBpts);
        Geometry query = wKBReader.Read(wKBquery);
        Geometry result = SpatialIndexFunctions.KdTreeQuery(pts, query, tolerance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBKdTreeQueryRepeated(byte[] wKBpts, byte[] wKBqueryEnv, double tolerance)
    {
        Geometry pts = wKBReader.Read(wKBpts);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.KdTreeQueryRepeated(pts, queryEnv, tolerance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSTRtreeBounds(byte[] wKBGeoms)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry result = SpatialIndexFunctions.STRtreeBounds(geoms);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSTRtreeQuery(byte[] wKBGeoms, byte[] wKBqueryEnv)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.STRtreeQuery(geoms, queryEnv);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBStrTreeNN(byte[] wKBGeoms, byte[] wKBGeom)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.StrTreeNN(geoms, geom);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBStrTreeNNInSet(byte[] wKBGeoms)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry result = SpatialIndexFunctions.StrTreeNNInSet(geoms);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBStrTreeNNk(byte[] wKBGeoms, byte[] wKBGeom, int k)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.StrTreeNNk(geoms, geom, k);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBQuadTreeQuery(byte[] wKBGeoms, byte[] wKBqueryEnv)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.QuadTreeQuery(geoms, queryEnv);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBMonotoneChains(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.MonotoneChains(geom);
        return wKBWriter.Write(result);
    }
}

