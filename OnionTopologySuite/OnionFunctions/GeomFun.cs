using System;
using Manifold;
using Coord = Manifold.Point<double>;

public partial class Script
{

    static void AddBranches(GeomBuilder builder, Geom g)
    {
        //only allowed when build started and any previous branches closed.
        for (int branch = 0; branch < g.Branches.Count; branch++)
        {
            AddBranch(builder, g.Branches[branch].Coords);
        }
    }


    static void AddBranch(GeomBuilder builder, Geom.CoordSet coords)
    {
        //only allowed when build started and any previous branches closed.
        builder.AddBranch();
        for (int i = 0; i < coords.Count; i++)
        {
            builder.AddCoord(coords[i]);
        }
        builder.EndBranch();
    }

    static void AddBranch(GeomBuilder builder, Coord[] coords)
    {
        //only allowed when build started and any previous branches closed.
        builder.AddBranch();
        foreach (var p in coords)
        {
            builder.AddCoord(p);
        }
        builder.EndBranch();
    }

    static void AddCoords(GeomBuilder builder, Coord[] coords)
    {
        //only allowed when build started and a branch opened.
        foreach (var p in coords)
        {
            builder.AddCoord(p);
        }
    }


}

