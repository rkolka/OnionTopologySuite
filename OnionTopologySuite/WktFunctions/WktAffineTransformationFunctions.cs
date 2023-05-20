using NetTopologySuite.Geometries;
using Open.Topology.TestRunner.Functions;

public static class WKTAffineTransformationFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();


    /// <summary>
    /// Transforms a geometry using one to three control vectors.
    /// </summary>
    public static string WKTTransformByVectors(byte[] wKBGeom, byte[] wKBcontrol)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry control = wKBReader.Read(wKBcontrol);
            Geometry result = AffineTransformationFunctions.TransformByVectors(g, control);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    /// <summary>
    /// Transforms a geometry by mapping envelope baseline to target vector.
    /// </summary>
    public static string WKTTransformByBaseline(byte[] wKBGeom, byte[] wKBdestBaseline)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry destBaseline = wKBReader.Read(wKBdestBaseline);
            Geometry result = AffineTransformationFunctions.TransformByBaseline(g, destBaseline);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }


    public static string WKTScale(byte[] wKBGeom, double scale)
    {

        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = AffineTransformationFunctions.Scale(g, scale);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTReflectInX(byte[] wKBGeom)
    {

        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = AffineTransformationFunctions.ReflectInX(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTReflectInY(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = AffineTransformationFunctions.ReflectInY(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTRotate(byte[] wKBGeom, double multipleOfPi)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = AffineTransformationFunctions.Rotate(g, multipleOfPi);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTTranslateCentreToOrigin(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = AffineTransformationFunctions.TranslateCentreToOrigin(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTTranslateToOrigin(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = AffineTransformationFunctions.TranslateToOrigin(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}

