using NetTopologySuite.Geometries;
using Open.Topology.TestRunner.Functions;

public static class TryAffineTransformationFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();


    /// <summary>
    /// Transforms a geometry using one to three control vectors.
    /// </summary>
    public static byte[] TryTransformByVectors(byte[] wKBGeom, byte[] wKBcontrol)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry control = wKBReader.Read(wKBcontrol);
        Geometry result = AffineTransformationFunctions.TransformByVectors(g, control);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Transforms a geometry by mapping envelope baseline to target vector.
    /// </summary>
    public static byte[] TryTransformByBaseline(byte[] wKBGeom, byte[] wKBdestBaseline)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry destBaseline = wKBReader.Read(wKBdestBaseline);
        Geometry result = AffineTransformationFunctions.TransformByBaseline(g, destBaseline);
        return wKBWriter.Write(result);
    }


    public static byte[] TryScale(byte[] wKBGeom, double scale)
    {

        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.Scale(g, scale);
        return wKBWriter.Write(result);
    }

    public static byte[] TryReflectInX(byte[] wKBGeom)
    {

        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.ReflectInX(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryReflectInY(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.ReflectInY(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryRotate(byte[] wKBGeom, double multipleOfPi)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.Rotate(g, multipleOfPi);
        return wKBWriter.Write(result);
    }

    public static byte[] TryTranslateCentreToOrigin(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.TranslateCentreToOrigin(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryTranslateToOrigin(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = AffineTransformationFunctions.TranslateToOrigin(g);
        return wKBWriter.Write(result);
    }
}

