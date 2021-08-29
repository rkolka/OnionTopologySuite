using System;
using NetTopologySuite.Algorithm;
using NetTopologySuite.Geometries;

namespace Open.Topology.TestRunner.Functions
{
    public static class CGAlgorithmFunctions
    {
        public static int OrientationIndex(Geometry segment, Geometry ptGeom)
        {
            if (segment.NumPoints != 2 || ptGeom.NumPoints != 1)
            {
                /*System.ArgumentException
  HResult=0x80070057
  Message=A must have two points and B must have one
  Source=OnionTopologySuite
  StackTrace:
   at Open.Topology.TestRunner.Functions.CGAlgorithmFunctions.OrientationIndex(Geometry segment, Geometry ptGeom) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\CGAlgorithmFunctions.cs:line 15
   at WKBCGAlgorithmFunctions.WKBOrientationIndex(Byte[] wKBsegment, Byte[] wKBptGeom) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBCGAlgorithmFunctions.cs:line 17
*/
                throw new ArgumentException("A must have two points and B must have one");
            }
            var segPt = segment.Coordinates;

            var p = ptGeom.Coordinate;
            int index = (int)Orientation.Index(segPt[0], segPt[1], p);
            return index;
        }

        public static int OrientationIndexDd(Geometry segment, Geometry ptGeom)
        {
            if (segment.NumPoints != 2 || ptGeom.NumPoints != 1)
            {/*System.ArgumentException
  HResult=0x80070057
  Message=A must have two points and B must have one
  Source=OnionTopologySuite
  StackTrace:
   at Open.Topology.TestRunner.Functions.CGAlgorithmFunctions.OrientationIndexDd(Geometry segment, Geometry ptGeom) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\CGAlgorithmFunctions.cs:line 36
   at WKBCGAlgorithmFunctions.WKBOrientationIndexDd(Byte[] wKBsegment, Byte[] wKBptGeom) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBCGAlgorithmFunctions.cs:line 25
*/
                throw new ArgumentException("A must have two points and B must have one");
            }
            var segPt = segment.Coordinates;

            var p = ptGeom.Coordinate;
            int index = CGAlgorithmsDD.OrientationIndex(segPt[0], segPt[1], p);
            return index;
        }

        public static bool SegmentIntersects(Geometry g1, Geometry g2)
        {
            var pt1 = g1.Coordinates;
            var pt2 = g2.Coordinates;
            var ri = new RobustLineIntersector();
            ri.ComputeIntersection(pt1[0], pt1[1], pt2[0], pt2[1]);
            return ri.HasIntersection;
        }

        public static Geometry SegmentIntersection(Geometry g1, Geometry g2)
        {
            var pt1 = g1.Coordinates;
            var pt2 = g2.Coordinates;
            var ri = new RobustLineIntersector();
            ri.ComputeIntersection(pt1[0], pt1[1], pt2[0], pt2[1]);
            switch (ri.IntersectionNum)
            {
                case 0:
                    // no intersection => return empty point
                    return g1.Factory.CreatePoint((Coordinate)null);
                case 1:
                    // return point
                    return g1.Factory.CreatePoint(ri.GetIntersection(0));
                case 2:
                    // return line
                    return g1.Factory.CreateLineString(
                        new Coordinate[] {
                            ri.GetIntersection(0),
                            ri.GetIntersection(1)
                        });
            }
            return null;
        }

        public static Geometry SegmentIntersectionDd(Geometry g1, Geometry g2)
        {
            var pt1 = g1.Coordinates;
            var pt2 = g2.Coordinates;

            // first check if there actually is an intersection
            var ri = new RobustLineIntersector();
            ri.ComputeIntersection(pt1[0], pt1[1], pt2[0], pt2[1]);
            if (!ri.HasIntersection)
            {
                // no intersection => return empty point
                return g1.Factory.CreatePoint((Coordinate)null);
            }

            var intPt = CGAlgorithmsDD.Intersection(pt1[0], pt1[1], pt2[0], pt2[1]);
            return g1.Factory.CreatePoint(intPt);
        }
    }
}