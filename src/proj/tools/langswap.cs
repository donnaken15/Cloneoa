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
            }
        }
    }
}
