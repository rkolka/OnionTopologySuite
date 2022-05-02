using Manifold;
using NetTopologySuite.Geometries;
using System;
using System.IO;

public class Script
{
    private static readonly string AddinName = "OnionTopologySuite";
    private static readonly string AddinCodeFolder = "Code\\OnionTopologySuite";

    private static readonly string[] CodeFiles = { "OnionTopologySuiteWKB.sql", "OnionTopologySuiteGEOM.sql", "OnionTopologySuiteTest.sql" };


    private static Context Manifold;

    public static void Main()
    {
        // The current application context 
        Application app = Manifold.Application;

        string AddinDir = System.IO.Path.GetDirectoryName(new System.Uri(System.Reflection.Assembly.GetExecutingAssembly().CodeBase).LocalPath);


        // Import CodeFiles
        using (Database db = app.GetDatabaseRoot())
        {
            foreach (string fname in CodeFiles)
            {
                // if not existing or user wants to overwrite
                bool overwrite = true;

                if (db.GetComponentType(fname) == "")
                {
                    overwrite = true;
                }
                else
                {
                    overwrite = false;

                    string message = $"{db.GetComponentType(fname).ToUpper()} {fname} already exists. DROP?";

                    System.Windows.Forms.MessageBoxButtons buttons = System.Windows.Forms.MessageBoxButtons.YesNo;
                    System.Windows.Forms.DialogResult result = System.Windows.Forms.MessageBox.Show(message, AddinName, buttons);
                    if (result == System.Windows.Forms.DialogResult.Yes)
                    {
                        db.Delete(fname);
                        overwrite = true;
                    }
                }

                if (overwrite)
                {
                    string text = File.ReadAllText(AddinDir + "\\" + fname);

                    // insert
                    CreateQuery(app, db, fname, text, AddinCodeFolder);
                }
            }

        }

        app.Log(DisplayHelp());
        app.OpenLog();

    }



    public static string DisplayHelp()
    {
        return "Use include directive:\r\n-- $include$ [OnionTopologySuiteGEOM.sql]";
    }

    public static void CreateQuery(Application app, Database db, string name, string text, string folder = "")
    {
        PropertySet propertyset = app.CreatePropertySet();
        propertyset.SetProperty("Text", text);
        if (folder != "")
        {
            propertyset.SetProperty("Folder", folder);

        }
        db.Insert(name, "query", null, propertyset);

    }

    public static Geometry NTSGeometryFromMfdGeom(Manifold.Geom mg)
    {
        Geometry ng = null;

        switch (mg.Type)
        {
            case "Area":

                break;
            case "Line":
                break;
            case "Point":
                break;
            default:
                break;
        }

        if (mg.Branches.Count)
        {

        }
    }

    public static Manifold.Geom MfdGeomFromNTSGeometry(Geometry ng)
    {
        Geom mg = null;

        if (ng.IsEmpty)
        {
            return mg;
        }
        GeomBuilder gb = Manifold.Application.CreateGeomBuilder();

        if (!double.IsNaN(ng.Coordinate.Z))
        {
            switch (ng)
            {
                case Point g:
                    gb.StartGeomPoint3();
                    gb.AddBranch();
                    gb.AddCoord3(new Manifold.Point3<double>(g.X, g.Y, g.Z));
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                case MultiPoint g:
                    gb.StartGeomPoint3();
                    gb.AddBranch();
                    foreach (var p in g.Coordinates)
                    {
                        gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                    }
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                case LineString g:
                    gb.StartGeomLine3();
                    gb.AddBranch();
                    foreach (var p in g.Coordinates)
                    {
                        gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                    }
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                case MultiLineString g:
                    gb.StartGeomLine3();
                    foreach (var l in g.Geometries)
                    {
                        gb.AddBranch();
                        foreach (var p in l.Coordinates)
                        {
                            gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                        }
                        gb.EndBranch();
                    }
                    mg = gb.EndGeom();
                    break;
                case Polygon g:
                    gb.StartGeomArea3();
                    gb.AddBranch();
                    foreach (var p in g.Shell.Coordinates)
                    {
                        gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                    }
                    gb.EndBranch();
                    foreach (var h in g.Holes)
                    {
                        gb.AddBranch();
                        foreach (var p in h.Coordinates)
                        {
                            gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                        }
                        gb.EndBranch();
                    }
                    mg = gb.EndGeom();
                    break;
                case MultiPolygon mp:
                    gb.StartGeomArea3();
                    foreach (Polygon g in mp.Geometries)
                    {
                        gb.AddBranch();
                        foreach (var p in g.Shell.Coordinates)
                        {
                            gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                        }
                        gb.EndBranch();
                        foreach (var h in g.Holes)
                        {
                            gb.AddBranch();
                            foreach (var p in h.Coordinates)
                            {
                                gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                            }
                            gb.EndBranch();
                        }
                    }
                    mg = gb.EndGeom();
                    break;
                case GeometryCollection g:
                    gb.StartGeomPoint3();
                    gb.AddBranch();
                    foreach (var p in g.Coordinates)
                    {
                        gb.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
                    }
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                default:
                    throw new ArgumentException("OnionTS: Unknown NTS geometry type");
            }
        }
        else
        {
            switch (ng)
            {
                case Point g:
                    gb.StartGeomPoint();
                    gb.AddBranch();
                    gb.AddCoord(new Manifold.Point<double>(g.X, g.Y));
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                case MultiPoint g:
                    gb.StartGeomPoint();
                    gb.AddBranch();
                    foreach (var p in g.Coordinates)
                    {
                        gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                    }
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                case LineString g:
                    gb.StartGeomLine();
                    gb.AddBranch();
                    foreach (var p in g.Coordinates)
                    {
                        gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                    }
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                case MultiLineString g:
                    gb.StartGeomLine();
                    foreach (var l in g.Geometries)
                    {
                        gb.AddBranch();
                        foreach (var p in l.Coordinates)
                        {
                            gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                        }
                        gb.EndBranch();
                    }
                    mg = gb.EndGeom();
                    break;
                case Polygon g:
                    gb.StartGeomArea();
                    gb.AddBranch();
                    foreach (var p in g.Shell.Coordinates)
                    {
                        gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                    }
                    gb.EndBranch();
                    foreach (var h in g.Holes)
                    {
                        gb.AddBranch();
                        foreach (var p in h.Coordinates)
                        {
                            gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                        }
                        gb.EndBranch();
                    }
                    mg = gb.EndGeom();
                    break;
                case MultiPolygon mp:
                    gb.StartGeomArea();
                    foreach (Polygon g in mp.Geometries)
                    {
                        gb.AddBranch();
                        foreach (var p in g.Shell.Coordinates)
                        {
                            gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                        }
                        gb.EndBranch();
                        foreach (var h in g.Holes)
                        {
                            gb.AddBranch();
                            foreach (var p in h.Coordinates)
                            {
                                gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                            }
                            gb.EndBranch();
                        }
                    }
                    mg = gb.EndGeom();
                    break;
                case GeometryCollection g:
                    gb.StartGeomPoint();
                    gb.AddBranch();
                    foreach (var p in g.Coordinates)
                    {
                        gb.AddCoord(new Manifold.Point<double>(p.X, p.Y));
                    }
                    gb.EndBranch();
                    mg = gb.EndGeom();
                    break;
                default:
                    throw new ArgumentException("OnionTS: Unknown NTS geometry type");
            }
        }
        return mg;
    }

    public static byte[] GeomBytes(Geom geom)
    {
        byte[] bytes = geom.GetBytes();
        // write out to file.
        File.WriteAllBytes($"{geom.Type}{(geom.HasZ ? "Z" : "")}{(geom.HasCurves ? "C" : "")}_o{geom.Opts}_b{geom.Branches.Count}_c{geom.Coords.Count}_{geom.GetHashCode()}.geom", bytes);
        return bytes;
    }
}

