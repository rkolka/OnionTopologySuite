using System;
using Manifold;
// Coord2 is like Manifold FLOAT64X2
using Coord2 = Manifold.Point<double>;

/// <summary>
/// Everything static goes into one happy class Script
/// </summary>
public partial class Script
{
    /// <summary>
    /// Add branches from Geom to "open" builder. Close branches. Leave builder open.
    /// </summary>
    /// <param name="builder"></param>
    /// <param name="g"></param>
    static void AddBranches(GeomBuilder builder, Geom g)
    {
        // only allowed when build started and any previous branches closed.
        for (int branch = 0; branch < g.Branches.Count; branch++)
        {
            AddBranch(builder, g.Branches[branch].Coords);
        }
    }

    /// <summary>
    /// Add CoordSet as a new branch to "open" builder. Close branch. Leave builder open.
    /// </summary>
    /// <param name="builder"></param>
    /// <param name="coords"></param>
    static void AddBranch(GeomBuilder builder, Geom.CoordSet coords)
    {
        // only allowed when build started and any previous branches closed.
        builder.AddBranch();
        for (int i = 0; i < coords.Count; i++)
        {
            builder.AddCoord(coords[i]);
        }
        builder.EndBranch();
    }

    /// <summary>
    /// Add Coord2 array as a new branch to "open" builder. Close branch. Leave builder open.
    /// </summary>
    /// <param name="builder"></param>
    /// <param name="coords"></param>
    static void AddBranch(GeomBuilder builder, Coord2[] coords)
    {
        // only allowed when build started and any previous branches closed.
        builder.AddBranch();
        foreach (var p in coords)
        {
            builder.AddCoord(p);
        }
        builder.EndBranch();
    }

    /// <summary>
    /// Add Coord2 array to "open" branch in "open" builder. Leave branch open. Leave builder open.
    /// </summary>
    /// <param name="builder"></param>
    /// <param name="coords"></param>
    static void AddCoords(GeomBuilder builder, Coord2[] coords)
    {
        // only allowed when build started and a branch opened.
        foreach (var p in coords)
        {
            builder.AddCoord(p);
        }
    }


}

