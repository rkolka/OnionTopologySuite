using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTBufferFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTBuffer(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.Buffer(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTBufferWithParams(byte[] wKBGeom, double distance,
                                             int quadrantSegments, int capStyle, int joinStyle,
                                             double mitreLimit)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferWithParams(g, distance, quadrantSegments, capStyle, joinStyle, mitreLimit);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTBufferWithSimplify(byte[] wKBGeom, double distance,
        double simplifyFactor)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferWithSimplify(g, distance, simplifyFactor);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTBufferOffsetCurve(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferOffsetCurve(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTBufferOffsetCurveWithParams(byte[] wKBGeom, double distance,
        int quadrantSegments, int capStyle, int joinStyle,
        double mitreLimit)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferOffsetCurveWithParams(g, distance, quadrantSegments, capStyle, joinStyle, mitreLimit);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTBufferLineSimplifier(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferLineSimplifier(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }



    public static string WKTBufferValidated(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferValidated(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTBufferValidatedGeom(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferValidatedGeom(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTSingleSidedBufferCurve(byte[] wKBgeom, double distance)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBgeom);
            Geometry result = BufferFunctions.SingleSidedBufferCurve(geom, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTSingleSidedBuffer(byte[] wKBgeom, double distance)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBgeom);
            Geometry result = BufferFunctions.SingleSidedBuffer(geom, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTBufferEach(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferFunctions.BufferEach(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTVariableBuffer(byte[] wKBline,
    double startDist,
    double endDist)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBline);
            Geometry result = BufferFunctions.VariableBuffer(g, startDist, endDist);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTVariableBufferMid(byte[] wKBline,
    double startDist,
    double midDist)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBline);
            Geometry result = BufferFunctions.VariableBuffer(g, startDist, midDist);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
}



