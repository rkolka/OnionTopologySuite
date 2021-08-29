using System;
using System.Diagnostics;
using System.IO;
using System.IO;
using System.Reflection;
using NetTopologySuite.Geometries;
using Manifold;
public class Script
{

    private static Manifold.Context Manifold;

    public static Manifold.Geom MfdGeomFromNTSGeometry(Geometry ng)
    {
        Geom mg = null;

        if (ng.IsEmpty)
        {
            return mg;
        }
        GeomBuilder gb = Manifold.Application.CreateGeomBuilder();

        Coordinate[] coords = ng.Coordinates;


        switch (ng.GeometryType)
        {
            case "Point":
                gb.StartGeomPoint3();
                gb.AddBranch();
                gb.AddCoord3(new Manifold.Point<double>(coords[0].X, coords[0].Y));
                gb.EndBranch();
                mg = gb.EndGeom();
                break;
            case "MultiPoint":
            case "LineString":
            case "LinearRing":
            case "MultiLineString":
            case "Polygon":
            case "MultiPolygon":
            case "GeometryCollection":
            default:
                throw new ArgumentException("Unknown geometry type");
        }

        return mg;
    }


    public static void Main()
    {
        // The current application context 
        Manifold.Application app = Manifold.Application;

        //app.Log("OnionTopologySuite (re)loaded!");
        app.OpenLog();
        app.Log(DisplayHelp());
    }

    public static string DisplayHelp()
    {
        string helpfile = Path.ChangeExtension(
            new Uri(Assembly.GetExecutingAssembly().CodeBase).LocalPath
            , "txt"
            );

        Process.Start(helpfile);
        return helpfile;
    }

    public static byte[] GeomBytes(Geom geom)
    {
        byte[] bytes = geom.GetBytes();
        File.WriteAllBytes($"{geom.Type}{(geom.HasZ ? "Z" : "")}{(geom.HasCurves ? "C" : "")}_o{geom.Opts}_b{geom.Branches.Count}_c{geom.Coords.Count}_{geom.GetHashCode()}.bin", bytes);
        return bytes;
    }
}

