using System;
using System.IO;

namespace OnionTopologySuiteTest
{
    class Program
    {

        [STAThread] // important
        static void Main(string[] args)
        {

            String extdll = @"C:\Program Files\Manifold\v9.0\bin64\ext.dll";
            using (Manifold.Root root = new Manifold.Root(extdll))
            {
                Manifold.Application app = root.Application;
                Console.WriteLine(app.Name);
                String mapfile = Path.GetFullPath(@"m9_OnionTopologySuiteTest.map");

                using (Manifold.Database db = app.CreateDatabaseForFile(mapfile, true))
                {
                    Console.WriteLine(db.Technology);

                    Script.DisplayHelp();
                    Console.WriteLine();

                    using (Manifold.Table table = db.Search("mfd_root"))
                    {
                        Console.WriteLine("Fields in mfd_root:");
                        Manifold.Schema schema = table.GetSchema();
                        foreach (Manifold.Schema.Field field in schema.Fields)
                            Console.WriteLine(field.Name);
                    }
                }
            }
        }
    }
}
