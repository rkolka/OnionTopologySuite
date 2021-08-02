using System;
using System.Diagnostics;
using System.IO;
using System.Reflection;

public class Script
{

    private static Manifold.Context Manifold;

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


}

