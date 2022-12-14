using Manifold;
using NetTopologySuite.Geometries;
using NetTopologySuite.IO;
using System;
using System.IO;

public class Script
{
    /// <summary>
    /// Add-in name inside Manifold
    /// </summary>
    private static readonly string AddinName = "OnionTopologySuite";

    /// <summary>
    /// Add-in folder inside Manifold
    /// </summary>
    private static readonly string AddinCodeFolder = "Code\\OnionTopologySuite";

    /// <summary>
    /// Filenames that are imported to Manifold
    /// </summary>
    private static readonly string[] FilesToImport = {
        "OnionTopologySuite.sql",
        "OnionTopologySuiteWKB.sql", 
        "OnionTopologySuiteGEOM.sql",
        "OnionTopologySuiteWktWKB.sql",
        "OnionTopologySuiteWktGEOM.sql",
        "OnionTopologySuiteUtils.sql",
        "OnionTopologySuiteTest.sql", 
        "OnionTopologySuiteTestWkt.sql",
        "OnionTopologySuiteTestUtils.sql",
    };


    private static Context Manifold;

    public static void Main()
    {
        // The current application context 
        Application app = Manifold.Application;

        string AddinDir = System.IO.Path.GetDirectoryName(new System.Uri(System.Reflection.Assembly.GetExecutingAssembly().CodeBase).LocalPath);


        // Import CodeFiles
        using (Database db = app.GetDatabaseRoot())
        {
            foreach (string fname in FilesToImport)
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

                    string message = $"{db.GetComponentType(fname).ToUpper()} {fname} already exists. Overwrite?";

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
        return "Use include directive:\r\n-- $include$ [OnionTopologySuite.sql]";
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

    public static Geometry GeomMfdToNTS(Manifold.Geom mg)
    {
        //Geometry ng = null;

        //switch (mg.Type)
        //{
        //    case "Area":

        //        break;
        //    case "Line":
        //        break;
        //    case "Point":
        //        break;
        //    default:
        //        break;
        //}

        //if (mg.Branches.Count)
        //{

        //}
        return null;
    }




    public static Manifold.Geom GeomMfdFromNTS(Geometry ng)
    {
        Geom mg = null;

        if (ng.IsEmpty)
        {
            return mg;
        }
        GeomBuilder gb = Manifold.Application.CreateGeomBuilder();

        if (!double.IsNaN(ng.Coordinate.Z))  // 3d geoms
        {
            switch (ng)
            {
                case Point g:
                    gb.StartGeomPoint3();
                    AddBranches3(gb, g);
                    break;
                case MultiPoint g:
                    gb.StartGeomPoint3();
                    AddBranches3(gb, g);
                    break;
                case LineString g:
                    gb.StartGeomLine3();
                    AddBranches3(gb, g);
                    break;
                case MultiLineString g:
                    gb.StartGeomLine3();
                    AddBranches3(gb, g);
                    break;
                case Polygon g:
                    gb.StartGeomArea3();
                    AddBranches3(gb, g);
                    break;
                case MultiPolygon g:
                    gb.StartGeomArea3();
                    AddBranches3(gb, g);
                    break;
                case GeometryCollection gc:
                    switch (MinDimension(gc))
                    {
                        case Dimension.Point:
                            gb.StartGeomPoint3();
                            break;
                        case Dimension.Surface:
                            gb.StartGeomArea3();
                            break;
                        default:
                            gb.StartGeomLine3();
                            break;
                    }
                    AddBranches3(gb, gc);
                    break;
                default:
                    throw new ArgumentException("OnionTS: Unknown NTS geometry type");
            }
        }
        else  // 2d geoms
        {
            switch (ng)
            {
                case Point g:
                    gb.StartGeomPoint();
                    AddBranches(gb, g);
                    break;
                case MultiPoint g:
                    gb.StartGeomPoint();
                    AddBranches(gb, g);
                    break;
                case LineString g:
                    gb.StartGeomLine();
                    AddBranches(gb, g);
                    break;
                case MultiLineString g:
                    gb.StartGeomLine();
                    AddBranches(gb, g);
                    break;
                case Polygon g:
                    gb.StartGeomArea();
                    AddBranches(gb, g);
                    break;
                case MultiPolygon g:
                    gb.StartGeomArea();
                    AddBranches(gb, g);
                    break;
                case GeometryCollection gc:
                    switch (MinDimension(gc))
                    {
                        case Dimension.Point:
                            gb.StartGeomPoint();
                            break;
                        case Dimension.Surface:
                            gb.StartGeomArea();
                            break;
                        default:
                            gb.StartGeomLine();
                            break;
                    }
                    AddBranches(gb, gc);
                    break;
                default:
                    throw new ArgumentException("OnionTS: Unknown NTS geometry type");
            }
        }
        mg = gb.EndGeom();
        return mg;
    }

    public static byte[] GeomToBytes(Geom geom)
    {
        byte[] bytes = geom.GetBytes();
        return bytes;
    }

    public static Geom GeomFromBytes(byte[] bytes)
    {
        Application app = Manifold.Application;
        using (Manifold.TypeConverter converter = app.CreateTypeConverter())
        {
            Geom geom = (Manifold.Geom)converter.Convert(bytes, typeof(Manifold.Geom));
            return geom;
        }
        
    }

    /// <summary>
    /// Takes WKT string, converts it to NTS-geom and uses GeomMfdFromNTS to convert it to MFD-geom
    /// </summary>
    /// <param name="wkt">WKT string</param>
    /// <returns>Geom</returns>
    public static Geom GeomWktNtsMfd(string wkt)
    {
        WKTReader reader = new WKTReader();
        Geometry ng = reader.Read(wkt);
        Geom geom = GeomMfdFromNTS(ng);
        return geom;
    }


    /// <summary>
    /// Writes Geom bytes to file
    /// </summary>
    /// <param name="geom"></param>
    /// <param name="path">folder path, filename is synthetic</param>
    /// <returns></returns>
    public static int GeomBytesToFile(Geom geom, string path)
    {
        byte[] bytes = geom.GetBytes();
        // write out to file.
        string dirPath = System.IO.Path.GetDirectoryName(path);
        File.WriteAllBytes($"{dirPath}\\{geom.Type}{(geom.HasZ ? "Z" : "")}{(geom.HasCurves ? "C" : "")}_o{geom.Opts}_b{geom.Branches.Count}_c{geom.Coords.Count}_{geom.GetHashCode()}.geom", bytes);
        return bytes.Length;
    }

    #region Private helpers

    /// <summary>
    /// To an open GeomBuilder add array of coordinates as 1 branch
    /// 3D varinat
    /// </summary>
    /// <param name="builder">An open GeomBuilder in/out </param>
    /// <param name="Coordinates"></param>
    static void AddBranch3(GeomBuilder builder, Coordinate[] Coordinates)
    {
        //only allowed when build started and any previous branches closed.
        builder.AddBranch();
        foreach (var p in Coordinates)
        {
            builder.AddCoord3(new Manifold.Point3<double>(p.X, p.Y, p.Z));
        }
        builder.EndBranch();
    }

    /// <summary>
    /// To an open GeomBuilder add array of coordinates as 1 branch
    /// 2D varinat
    /// </summary>
    /// <param name="builder">An open GeomBuilder in/out </param>
    /// <param name="Coordinates"></param>
    static void AddBranch(GeomBuilder builder, Coordinate[] Coordinates)
    {
        //only allowed when build started and any previous branches closed.
        builder.AddBranch();
        foreach (var p in Coordinates)
        {
            builder.AddCoord(new Manifold.Point<double>(p.X, p.Y));
        }
        builder.EndBranch();
    }

    /// <summary>
    /// To an open GeomBuilder of existing type, add NTS-geom's branches as necessary.
    /// In case of GeometryCollection calls itself recursively.
    /// 3D variant.
    /// </summary>
    /// <param name="builder">An open GeomBuilder in/out </param>
    /// <param name="ng">NTS-geom</param>
    static void AddBranches3(GeomBuilder builder, Geometry ng)
    {
        if (!ng.IsEmpty)
        {
            switch (ng)
            {
                case Point g:
                    AddBranch3(builder, g.Coordinates);
                    break;
                case MultiPoint g:
                    AddBranch3(builder, g.Coordinates);
                    break;
                case LineString g:
                    AddBranch3(builder, g.Coordinates);
                    break;
                case MultiLineString g:
                    foreach (var l in g.Geometries)
                    {
                        AddBranch3(builder, l.Coordinates);
                    }
                    break;
                case Polygon g:
                    AddBranch3(builder, g.Shell.Coordinates);
                    foreach (var h in g.Holes)
                    {
                        AddBranch3(builder, h.Coordinates);
                    }
                    break;
                case MultiPolygon mp:
                    foreach (Polygon g in mp.Geometries)
                    {
                        AddBranch3(builder, g.Shell.Coordinates);
                        foreach (var h in g.Holes)
                        {
                            AddBranch3(builder, h.Coordinates);
                        }
                    }
                    break;
                case GeometryCollection gc:
                    foreach (var g in gc)
                    {
                        AddBranches3(builder, g);
                    }
                    break;
                default:
                    throw new ArgumentException("OnionTS: Unknown NTS geometry type");
            }
        }
    }


    /// <summary>
    /// To an open GeomBuilder of existing type, add NTS-geom's branches as necessary. 
    /// In case of GeometryCollection calls itself recursively.
    /// 2D variant.
    /// </summary>
    /// <param name="builder">An open GeomBuilder in/out </param>
    /// <param name="ng">NTS-geom</param>
    static void AddBranches(GeomBuilder builder, Geometry ng)
    {
        if (!ng.IsEmpty)
        {
            switch (ng)
            {
                case Point g:
                    AddBranch(builder, g.Coordinates);
                    break;
                case MultiPoint g:
                    AddBranch(builder, g.Coordinates);
                    break;
                case LineString g:
                    AddBranch(builder, g.Coordinates);
                    break;
                case MultiLineString g:
                    foreach (var l in g.Geometries)
                    {
                        AddBranch(builder, l.Coordinates);
                    }
                    break;
                case Polygon g:
                    AddBranch(builder, g.Shell.Coordinates);
                    foreach (var h in g.Holes)
                    {
                        AddBranch(builder, h.Coordinates);
                    }
                    break;
                case MultiPolygon mp:
                    foreach (Polygon g in mp.Geometries)
                    {
                        AddBranch(builder, g.Shell.Coordinates);
                        foreach (var h in g.Holes)
                        {
                            AddBranch(builder, h.Coordinates);
                        }
                    }
                    break;
                case GeometryCollection gc:
                    foreach (var g in gc)
                    {
                        AddBranches(builder, g);
                    }
                    break;
                default:
                    throw new ArgumentException("OnionTS: Unknown NTS geometry type");
            }
        }
    }

    public static Dimension MinDimension(GeometryCollection gc)
    {
        var dimension = Dimension.A;
        for (int i = 0; i < gc.Geometries.Length; i++)
            dimension = (Dimension)Math.Min((int)dimension, (int)gc.Geometries[i].Dimension);
        return dimension;
    }
    #endregion
}

