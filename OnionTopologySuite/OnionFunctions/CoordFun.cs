using System;
// System.Numerics.Vector2 is like FLOAT32x2
using System.Numerics;
// Coord2 is like Manifold FLOAT64X2
using Coord2 = Manifold.Point<double>;
//using Vector2 = System.Numerics.Vector<double>;

public partial class Script
{

    // Vector2 from Origin to Coord2
    public static Vector2 v2(Coord2 c) => new Vector2((float)c.X, (float)c.Y);
    
    // Vector2 from Coord2 to Coord2
    // Subtract first and then cast double to float.
    public static Vector2 ab2(Coord2 c0, Coord2 c1) => new Vector2((float)(c1.X - c0.X), (float)(c1.Y - c0.Y));

    // Coord2 from Vector2
    public static Coord2 c2(Vector2 v) => new Coord2(v.X, v.Y);
    // Coord2 from two floats
    public static Coord2 c2(float x, float y) => new Coord2(x, y);
    // Coord2 from two doubles
    public static Coord2 c2(double x, double y) => new Coord2(x, y);

    // Coord2 shifted by Vector2
    public static Coord2 shift2(Coord2 c, Vector2 v) => new Coord2(c.X + (double)v.X, c.Y + (double)v.Y);


    public static double Distance(Coord2 a, Coord2 b)
    {
        double dx = b.X - a.X;
        double dy = b.Y - a.Y;
        return Math.Sqrt(dx * dx + dy * dy);
    }

    /// <summary>
    /// Finds the reflection of c as if baseline is flipped
    /// </summary>
    /// <param name="c"></param>
    /// <param name="p0"></param>
    /// <param name="p1"></param>
    /// <returns></returns>
    private static Coord2 MirrorTriangle(Coord2 c, Coord2 p0, Coord2 p1)
    {
        Vector2 baseline = ab2(p0, p1);
        Vector2 v1 = ab2(p0, c);
        Vector2 v2 = FlipX(AlongAcross(v1, baseline));
        return shift2(p1, v2);
    }

}

