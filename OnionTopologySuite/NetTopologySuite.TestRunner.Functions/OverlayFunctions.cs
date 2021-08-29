using System.Collections.Generic;
using NetTopologySuite.Geometries;
using NetTopologySuite.Utilities;

namespace Open.Topology.TestRunner.Functions
{
    public static class OverlayFunctions
    {
        public static Geometry Intersection(Geometry a, Geometry b)
        {
            return a.Intersection(b);
        }

        public static Geometry Union(Geometry a, Geometry b)
        {

            return a.Union(b);
        }

        public static Geometry SymDifference(Geometry a, Geometry b)
        {
            /*NetTopologySuite.Geometries.TopologyException
  HResult=0x80131600
  Message=unable to assign hole to a shell [ (549.53907217850087, 754.62537323707238) ]
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.Operation.Overlay.PolygonBuilder.PlaceFreeHoles(IList`1 shellList, IEnumerable`1 freeHoleList)
   at NetTopologySuite.Operation.Overlay.OverlayOp.ComputeOverlay(SpatialFunction opCode)
   at NetTopologySuite.Operation.Overlay.Snap.SnapIfNeededOverlayOp.GetResultGeometry(SpatialFunction opCode)
--- End of stack trace from previous location ---
   at System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   at NetTopologySuite.Operation.Overlay.Snap.SnapIfNeededOverlayOp.GetResultGeometry(SpatialFunction opCode)
   at NetTopologySuite.Geometries.GeometryOverlay.OverlayV1.Overlay(Geometry geom0, Geometry geom1, SpatialFunction opCode)
   at Open.Topology.TestRunner.Functions.OverlayFunctions.SymDifference(Geometry a, Geometry b) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\OverlayFunctions.cs:line 21
   at WKBOverlayFunctions.WKBSymDifference(Byte[] wKBa, Byte[] wKBb) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBOverlayFunctions.cs:line 32

  This exception was originally thrown at this call stack:
    [External Code]
    Open.Topology.TestRunner.Functions.OverlayFunctions.SymDifference(NetTopologySuite.Geometries.Geometry, NetTopologySuite.Geometries.Geometry) in OverlayFunctions.cs
    WKBOverlayFunctions.WKBSymDifference(byte[], byte[]) in WKBOverlayFunctions.cs*/
            return a.SymmetricDifference(b);
        }

        public static Geometry Difference(Geometry a, Geometry b)
        {
            /*NetTopologySuite.Geometries.TopologyException
  HResult=0x80131600
  Message=unable to assign hole to a shell [ (549.53907217850087, 754.62537323707238) ]
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.Operation.Overlay.PolygonBuilder.PlaceFreeHoles(IList`1 shellList, IEnumerable`1 freeHoleList)
   at NetTopologySuite.Operation.Overlay.OverlayOp.ComputeOverlay(SpatialFunction opCode)
   at NetTopologySuite.Operation.Overlay.Snap.SnapIfNeededOverlayOp.GetResultGeometry(SpatialFunction opCode)
--- End of stack trace from previous location ---
   at System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   at NetTopologySuite.Operation.Overlay.Snap.SnapIfNeededOverlayOp.GetResultGeometry(SpatialFunction opCode)
   at NetTopologySuite.Geometries.GeometryOverlay.OverlayV1.Overlay(Geometry geom0, Geometry geom1, SpatialFunction opCode)
   at Open.Topology.TestRunner.Functions.OverlayFunctions.Difference(Geometry a, Geometry b) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\OverlayFunctions.cs:line 46
   at WKBOverlayFunctions.WKBDifference(Byte[] wKBa, Byte[] wKBb) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBOverlayFunctions.cs:line 40

  This exception was originally thrown at this call stack:
    [External Code]
    Open.Topology.TestRunner.Functions.OverlayFunctions.Difference(NetTopologySuite.Geometries.Geometry, NetTopologySuite.Geometries.Geometry) in OverlayFunctions.cs
    WKBOverlayFunctions.WKBDifference(byte[], byte[]) in WKBOverlayFunctions.cs*/
            return a.Difference(b);
        }

        public static Geometry DifferenceBa(Geometry a, Geometry b)
        {
            return b.Difference(a);
        }

        public static Geometry UnaryUnion(Geometry a)
        {
            return a.Union();
        }

        public static Geometry UnionUsingGeometryCollection(Geometry a, Geometry b)
        {
            var gc = a.Factory.CreateGeometryCollection(
                new[] { a, b });
            return gc.Union();
        }

        public static Geometry Clip(Geometry a, Geometry mask)
        {
            var geoms = new List<Geometry>();
            for (int i = 0; i < a.NumGeometries; i++)
            {
                /*NetTopologySuite.Geometries.TopologyException
  HResult=0x80131600
  Message=unable to assign hole to a shell [ (549.53907217850087, 754.62537323707238, NaN) ]
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.Operation.Overlay.PolygonBuilder.PlaceFreeHoles(IList`1 shellList, IEnumerable`1 freeHoleList)
   at NetTopologySuite.Operation.Overlay.OverlayOp.ComputeOverlay(SpatialFunction opCode)
   at NetTopologySuite.Operation.Overlay.Snap.SnapIfNeededOverlayOp.GetResultGeometry(SpatialFunction opCode)
--- End of stack trace from previous location ---
   at System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   at NetTopologySuite.Operation.Overlay.Snap.SnapIfNeededOverlayOp.GetResultGeometry(SpatialFunction opCode)
   at NetTopologySuite.Geometries.GeometryOverlay.OverlayV1.Overlay(Geometry geom0, Geometry geom1, SpatialFunction opCode)
   at Open.Topology.TestRunner.Functions.OverlayFunctions.Clip(Geometry a, Geometry mask) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\OverlayFunctions.cs:line 90
   at WKBOverlayFunctions.WKBClip(Byte[] wKBa, Byte[] wKBmask) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBOverlayFunctions.cs:line 71

  This exception was originally thrown at this call stack:
    [External Code]
    Open.Topology.TestRunner.Functions.OverlayFunctions.Clip(NetTopologySuite.Geometries.Geometry, NetTopologySuite.Geometries.Geometry) in OverlayFunctions.cs
    WKBOverlayFunctions.WKBClip(byte[], byte[]) in WKBOverlayFunctions.cs*/
                var clip = a.GetGeometryN(i).Intersection(mask);
                geoms.Add(clip);
            }
            return FunctionsUtil.BuildGeometry(geoms, a);
        }
    }
}