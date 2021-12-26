using NetTopologySuite.Geometries;
using NetTopologySuite.Utilities;
using System;
using System.Collections.Generic;

namespace Open.Topology.TestRunner.Functions
{
    public static class BufferByUnionFunctions
    {
        public static Geometry ComponentBuffers(Geometry g, double distance)
        {
            /*
             * System.InvalidCastException
  HResult=0x80004002
  Message=Unable to cast object of type 'NetTopologySuite.Geometries.Polygon' to type 'NetTopologySuite.Geometries.GeometryCollection'.
  Source=OnionTopologySuite
  StackTrace:
   at Open.Topology.TestRunner.Functions.BufferByUnionFunctions.ComponentBuffers(Geometry g, Double distance) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\NetTopologySuite.TestRunner.Functions\BufferByUnionFunctions.cs:line 13
   at WKBBufferByUnionFunctions.WKBComponentBuffers(Byte[] wKBGeom, Double distance) in D:\Code\cs\OnionTopologySuite\OnionTopologySuite\WkbFunctions\WKBBufferByUnionFunctions.cs:line 15
*/
            var bufs = new List<Geometry>();
            foreach (var comp in new GeometryCollectionEnumerator((GeometryCollection)g))
            {
                if (comp is GeometryCollection) continue;
                bufs.Add(comp.Buffer(distance));
            }
            return FunctionsUtil.GetFactoryOrDefault(g)
                .CreateGeometryCollection(GeometryFactory.ToGeometryArray(bufs));
        }

        public static Geometry BufferByComponents(Geometry g, double distance)
        {
            return ComponentBuffers(g, distance).Union();
        }

        /// <summary>
        /// Buffer polygons by buffering the individual boundary segments and
        /// either unioning or differencing them.
        /// </summary>
        /// <param name="g"></param>
        /// <param name="distance"></param>
        /// <returns>The buffer geometry</returns>
        public static Geometry BufferBySegments(Geometry g, double distance)
        {
            var segs = LineHandlingFunctions.ExtractSegments(g);
            double posDist = Math.Abs(distance);
            var segBuf = BufferByComponents(segs, posDist);
            if (distance < 0.0)
                return g.Difference(segBuf);
            return g.Union(segBuf);
        }

        public static Geometry BufferByChains(Geometry g, double distance, int maxChainSize)
        {
            if (maxChainSize <= 0)
                throw new ArgumentOutOfRangeException("maxChainSize", "Maximum Chain Size must be specified as an input parameter");
            var segs = LineHandlingFunctions.ExtractChains(g, maxChainSize);
            double posDist = Math.Abs(distance);
            var segBuf = BufferByComponents(segs, posDist);
            if (distance < 0.0)
                return g.Difference(segBuf);
            return g.Union(segBuf);
        }
    }
}