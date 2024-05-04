using System;
namespace OnionTopologySuite
{
    public struct Coord
    {
        public Coord(double x, double y)
        {
            X = x;
            Y = y;
        }

        public double X;
        public double Y;

    }
    public static class CoordFun
    {

        public static double Distance(Coord a, Coord b)
        {
            double dx = b.X - a.X;
            double dy = b.Y - a.Y;
            return Math.Sqrt(dx * dx + dy * dy);
        }

    }

}