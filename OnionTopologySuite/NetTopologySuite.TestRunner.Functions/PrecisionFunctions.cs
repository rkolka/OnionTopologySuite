using NetTopologySuite.Geometries;
using NetTopologySuite.Precision;

namespace Open.Topology.TestRunner.Functions
{
    public static class PrecisionFunctions
    {
      

        public static Geometry ReducePrecisionPointwise(Geometry geom, double scaleFactor)
        {
            var pm = new PrecisionModel(scaleFactor);/*
                                                      System.IO.FileNotFoundException
  HResult=0x80070002
  Message=Could not load file or assembly 'System.Buffers, Version=4.0.2.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51' or one of its dependencies. The system cannot find the file specified.
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.Noding.Snapround.HotPixelIndex.ShuffledCoordinates.ShuffledCoordinatesEnumerator..ctor(Coordinate[] pts)
   at NetTopologySuite.Noding.Snapround.HotPixelIndex.ShuffledCoordinates.GetEnumerator()
   at NetTopologySuite.Noding.Snapround.HotPixelIndex.Add(IEnumerable`1 pts)
   at NetTopologySuite.Noding.Snapround.SnapRoundingNoder.AddVertexPixels(IEnumerable`1 segStrings)
   at NetTopologySuite.Noding.Snapround.SnapRoundingNoder.SnapRound(IList`1 segStrings)
   at NetTopologySuite.Noding.Snapround.SnapRoundingNoder.ComputeNodes(IList`1 inputSegmentStrings)
   at NetTopologySuite.Operation.OverlayNG.EdgeNodingBuilder.Node(IList`1 segStrings)
   at NetTopologySuite.Operation.OverlayNG.EdgeNodingBuilder.Build(Geometry geom0, Geometry geom1)
   at NetTopologySuite.Operation.OverlayNG.OverlayNG.NodeEdges()
   at NetTopologySuite.Operation.OverlayNG.OverlayNG.ComputeEdgeOverlay()
   at NetTopologySuite.Operation.OverlayNG.OverlayNG.GetResult()
   at NetTopologySuite.Operation.OverlayNG.PrecisionReducer.ReducePrecision(Geometry geom, PrecisionModel pm)
   at NetTopologySuite.Precision.PrecisionReducerTransformer.TransformPolygon(Polygon geom, Geometry parent)
   at NetTopologySuite.Precision.GeometryPrecisionReducer.Reduce(Geometry geom)
   at Open.Topology.TestRunner.Functions.PrecisionFunctions.ReducePrecisionPointwise(Geometry geom, Double scaleFactor) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\PrecisionFunctions.cs:line 13
   at WKBPrecisionFunctions.WKBReducePrecisionPointwise(Byte[] wKBGeom, Double scaleFactor) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBPrecisionFunctions.cs:line 14
*/
            var reducedGeom = GeometryPrecisionReducer.Reduce(geom, pm);
            return reducedGeom;
        }
    }
}