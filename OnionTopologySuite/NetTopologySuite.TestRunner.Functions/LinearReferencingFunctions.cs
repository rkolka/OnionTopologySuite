using NetTopologySuite.Geometries;
using NetTopologySuite.LinearReferencing;

namespace Open.Topology.TestRunner.Functions
{
    public static class LinearReferencingFunctions
    {
        public static Geometry ExtractPoint(Geometry g, double index)
        {
            var ll = new LengthIndexedLine(g);
            /*System.ArgumentException
  HResult=0x80070057
  Message=Lineal geometry is required.
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.LinearReferencing.LinearIterator..ctor(Geometry linearGeom, Int32 componentIndex, Int32 vertexIndex)
   at NetTopologySuite.LinearReferencing.LengthLocationMap.GetLocationForward(Double length)
   at NetTopologySuite.LinearReferencing.LengthIndexedLine.ExtractPoint(Double index)
   at Open.Topology.TestRunner.Functions.LinearReferencingFunctions.ExtractPoint(Geometry g, Double index) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\LinearReferencingFunctions.cs:line 11
   at WKBLinearReferencingFunctions.WKBExtractPoint(Byte[] wKBGeom, Double index) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBLinearReferencingFunctions.cs:line 14
*/
            var p = ll.ExtractPoint(index);
            return g.Factory.CreatePoint(p);
        }

        public static Geometry ExtractLine(Geometry g, double start, double end)
        {
            var ll = new LengthIndexedLine(g);
            /*System.ArgumentException
  HResult=0x80070057
  Message=Lineal geometry is required.
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.LinearReferencing.LinearIterator..ctor(Geometry linearGeom, Int32 componentIndex, Int32 vertexIndex)
   at NetTopologySuite.LinearReferencing.LengthLocationMap.GetLocationForward(Double length)
   at NetTopologySuite.LinearReferencing.LengthLocationMap.GetLocation(Double length, Boolean resolveLower)
   at NetTopologySuite.LinearReferencing.LengthIndexedLine.ExtractLine(Double startIndex, Double endIndex)
   at Open.Topology.TestRunner.Functions.LinearReferencingFunctions.ExtractLine(Geometry g, Double start, Double end) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\LinearReferencingFunctions.cs:line 29
   at WKBLinearReferencingFunctions.WKBExtractLine(Byte[] wKBGeom, Double start, Double end) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBLinearReferencingFunctions.cs:line 21
*/
            return ll.ExtractLine(start, end);
        }

        public static Geometry Project(Geometry g, Geometry g2)
        {
            var ll = new LengthIndexedLine(g);
            if (g2.Dimension == Dimension.Curve)
            {
                var line = (LineString)g2.GetGeometryN(0);
                var pStart = line.GetCoordinateN(0);
                var pEnd = line.GetCoordinateN(line.NumPoints - 1);
                double indexStart = ll.Project(pStart);
                double indexEnd = ll.Project(pEnd);
                return ll.ExtractLine(indexStart, indexEnd);
            }
            else
            {
                /*System.ArgumentException
  HResult=0x80070057
  Message=Lineal geometry is required.
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.LinearReferencing.LinearIterator..ctor(Geometry linearGeom, Int32 componentIndex, Int32 vertexIndex)
   at NetTopologySuite.LinearReferencing.LengthIndexOfPoint.IndexOfFromStart(Coordinate inputPt, Double minIndex)
   at NetTopologySuite.LinearReferencing.LengthIndexedLine.Project(Coordinate pt)
   at Open.Topology.TestRunner.Functions.LinearReferencingFunctions.Project(Geometry g, Geometry g2) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\LinearReferencingFunctions.cs:line 58
   at WKBLinearReferencingFunctions.WKBProject(Byte[] wKBGeom, Byte[] wKBGeom2) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBLinearReferencingFunctions.cs:line 29
*/
                double index = ll.Project(g2.Coordinate);
                var p = ll.ExtractPoint(index);
                return g.Factory.CreatePoint(p);
            }
        }
        public static double ProjectIndex(Geometry g, Geometry g2)
        {
            var ll = new LengthIndexedLine(g);
            /*System.ArgumentException
  HResult=0x80070057
  Message=Lineal geometry is required.
  Source=NetTopologySuite
  StackTrace:
   at NetTopologySuite.LinearReferencing.LinearIterator..ctor(Geometry linearGeom, Int32 componentIndex, Int32 vertexIndex)
   at NetTopologySuite.LinearReferencing.LengthIndexOfPoint.IndexOfFromStart(Coordinate inputPt, Double minIndex)
   at NetTopologySuite.LinearReferencing.LengthIndexedLine.Project(Coordinate pt)
   at Open.Topology.TestRunner.Functions.LinearReferencingFunctions.ProjectIndex(Geometry g, Geometry g2) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\LinearReferencingFunctions.cs:line 77
   at WKBLinearReferencingFunctions.WKBProjectIndex(Byte[] wKBGeom, Byte[] wKBGeom2) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBLinearReferencingFunctions.cs:line 36
*/
            return ll.Project(g2.Coordinate);

        }
    }
}
