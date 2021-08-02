using NetTopologySuite.Algorithm;
using NetTopologySuite.Geometries;
using NetTopologySuite.Operation;

namespace Open.Topology.TestRunner.Functions
{
    public class BoundaryFunctions
    {
        public static Geometry Boundary(Geometry g) { return g.Boundary; }

        public static Geometry BoundaryMod2(Geometry g)
        {
            return BoundaryOp.GetBoundary(g, BoundaryNodeRules.Mod2BoundaryRule);
        }
        public static Geometry BoundaryEndpoint(Geometry g)
        {
            return BoundaryOp.GetBoundary(g, BoundaryNodeRules.EndpointBoundaryRule);
        }
        public static Geometry BoundaryMonoValentEnd(Geometry g)
        {
            return BoundaryOp.GetBoundary(g, BoundaryNodeRules.MonoValentEndpointBoundaryRule);
        }
        public static Geometry BoundaryMultiValentEnd(Geometry g)
        {
            return BoundaryOp.GetBoundary(g, BoundaryNodeRules.MultivalentEndpointBoundaryRule);
        }

    }
}