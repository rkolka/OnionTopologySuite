using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKBBufferFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBBuffer(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.Buffer(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferWithParams(byte[] wKBGeom, double distance,
                                             int quadrantSegments, int capStyle, int joinStyle,
                                             double mitreLimit)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferWithParams(g, distance, quadrantSegments, capStyle, joinStyle, mitreLimit);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferWithSimplify(byte[] wKBGeom, double distance,
        double simplifyFactor)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferWithSimplify(g, distance, simplifyFactor);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferOffsetCurve(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferOffsetCurve(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferOffsetCurveWithParams(byte[] wKBGeom, double distance,
        int quadrantSegments, int capStyle, int joinStyle,
        double mitreLimit)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferOffsetCurveWithParams(g, distance, quadrantSegments, capStyle, joinStyle, mitreLimit);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferLineSimplifier(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferLineSimplifier(g, distance);
        return wKBWriter.Write(result);
    }



    public static byte[] WKBBufferValidated(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferValidated(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferValidatedGeom(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferValidatedGeom(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSingleSidedBufferCurve(byte[] wKBgeom, double distance)
    {
        Geometry geom = wKBReader.Read(wKBgeom);
        Geometry result = BufferFunctions.SingleSidedBufferCurve(geom, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSingleSidedBuffer(byte[] wKBgeom, double distance)
    {
        Geometry geom = wKBReader.Read(wKBgeom);
        Geometry result = BufferFunctions.SingleSidedBuffer(geom, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferEach(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferFunctions.BufferEach(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBVariableBuffer(byte[] wKBline,
    double startDist,
    double endDist)
    {
        Geometry g = wKBReader.Read(wKBline);
        Geometry result = BufferFunctions.VariableBuffer(g, startDist, endDist);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBVariableBufferMid(byte[] wKBline,
    double startDist,
    double midDist)
    {
        Geometry g = wKBReader.Read(wKBline);
        Geometry result = BufferFunctions.VariableBuffer(g, startDist, midDist);
        return wKBWriter.Write(result);
    }
}



