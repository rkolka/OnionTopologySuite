using System;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using NetTopologySuite.Geometries;
using Manifold;

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

        

        using (Database db = app.GetDatabaseRoot())
        {
            foreach (string fname in CodeFiles)
            {
                bool rewrite = true;
                
                if (db.GetComponentType(fname) == "")
                {
                    rewrite = true;
                }
                else 
                {
                    rewrite = false;

                    string message = $"{db.GetComponentType(fname).ToUpper()} {fname} already exists. DROP?";

                    System.Windows.Forms.MessageBoxButtons buttons = System.Windows.Forms.MessageBoxButtons.YesNo;
                    System.Windows.Forms.DialogResult result = System.Windows.Forms.MessageBox.Show(message, AddinName, buttons);
                    if (result == System.Windows.Forms.DialogResult.Yes)
                    {
                        db.Delete(fname);
                        rewrite = true;
                    }
                }

                if (rewrite)
                {
                    string text = File.ReadAllText(AddinDir + "\\" + fname);
                    // TODO? check hash?

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

    public static byte[] GeomBytes(Geom geom)
    {
        byte[] bytes = geom.GetBytes();
        // write out to file.
        File.WriteAllBytes($"{geom.Type}{(geom.HasZ ? "Z" : "")}{(geom.HasCurves ? "C" : "")}_o{geom.Opts}_b{geom.Branches.Count}_c{geom.Coords.Count}_{geom.GetHashCode()}.bin", bytes);
        return bytes;
    }
}

