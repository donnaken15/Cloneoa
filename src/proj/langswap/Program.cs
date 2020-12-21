//using System;
using System.IO;

namespace langswap
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length > 1)
            {
                if (args[0] == "Japanese")
                    File.AppendAllText(args[1] + "\\settings.ini", "\n\n[General]\nLanguage=1");
                //File.AppendAllText(Path.GetDirectoryName(Environment.GetCommandLineArgs()[0]) + "\\settings.ini", "\n\n[General]\nLanguage=1");
                //File.AppendAllText(Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\settings.ini", "\n\n[General]\nLanguage=1");
                //File.Delete(curDir + "info.chm");
                //File.Move(curDir + "infoj.chm", curDir + "info.chm");
            }
        }
    }
}
