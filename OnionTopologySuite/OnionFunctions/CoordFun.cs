using System;
using System.Numerics;
using Coord = Manifold.Point<double>;

public partial class Script
{

    public static double Distance(Coord a, Coord b)
    {
        double dx = b.X - a.X;
        double dy = b.Y - a.Y;
        return Math.Sqrt(dx * dx + dy * dy);
    }


    // Touch System.Numerics.Vector 
    // not currently in use
    public static Vector<double> VectorFromCoord(Coord c)
    {
        Vector<double> vector = new Vector<double>(new double[] {c.X, c.Y});
        return vector;
    }
    public static Coord CoordFromVector(Vector<double> v)
    {
        Coord coord = new Coord(v[0], v[1]);
        return coord;
    }

    private static Coord MirrorControlPoint(Coord c, Coord p0, Coord p1)
    {
        double vlinex = p1.X - p0.X;
        double vliney = p1.Y - p0.Y;
        // rotate line vector by 90
        double vrotx = -vliney;
        double vroty = vlinex;

        double midx = (p0.X + p1.X) / 2;
        double midy = (p0.Y + p1.Y) / 2;

        return ReflectPointInLine(c, new Coord(midx, midy), new Coord(midx + vrotx, midy + vroty));
    }

    private static Coord ReflectPointInLine(Coord p, Coord p0, Coord p1)
    {
        double vx = p1.X - p0.X;
        double vy = p1.Y - p0.Y;
        double x = p0.X - p.X;
        double y = p0.Y - p.Y;
        double r = 1 / (vx * vx + vy * vy);
        double rx = p.X + 2 * (x - x * vx * vx * r - y * vx * vy * r);
        double ry = p.Y + 2 * (y - y * vy * vy * r - x * vx * vy * r);
        return new Coord(rx, ry);
    }
}

