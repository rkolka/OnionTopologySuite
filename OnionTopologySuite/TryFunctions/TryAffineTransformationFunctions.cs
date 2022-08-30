using NetTopologySuite.Geometries;
using Open.Topology.TestRunner.Functions;

public static class WKBAffineTransformationFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();


    /// <summary>
    /// Transforms a geometry using one to three control vectors.
    /// </summary>
    public static byte[] WKBTransformByVectors(byte[] wKBGeom, byte[] wKBcontrol)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry control = wKBReader.Read(wKBcontrol);
        Geometry result = AffineTransformationFunctions.TransformByVectors(g, control);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Transforms a geometry by mapping envelope baseline to target vector.
    /// </summary>
    public static byte[] WKBTransformByBaseline(byte[] wKBGeom, byte[] wKBdestBaseline)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry destBaseline = wKBReader.Read(wKBdestBaseline);
        Geometry result = AffineTransformationFunctions.TransformByBaseline(g, destBaseline);
        return wKBWriter.Write(result);
    }


    public static byte[] WKBScale(byte[] wKBGeom, double scale)
    {

        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.Scale(g, scale);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBReflectInX(byte[] wKBGeom)
    {

        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.ReflectInX(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBReflectInY(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.ReflectInY(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBRotate(byte[] wKBGeom, double multipleOfPi)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.Rotate(g, multipleOfPi);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBTranslateCentreToOrigin(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.TranslateCentreToOrigin(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBTranslateToOrigin(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.TranslateToOrigin(g);
        return wKBWriter.Write(result);
    }
}

