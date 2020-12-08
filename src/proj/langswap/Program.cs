using System.IO;

namespace langswap
{
    class Program
    {
        static string newIni = "\n\n[General]\nLanguage=";

        static char langToggle = '0';

        static void Main(string[] args)
        {
            if (args.Length > 0)
            {
                if (args[0] == "日本人")
                {
                    langToggle++;
                }
                newIni += langToggle;
                File.AppendAllText(Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\settings.ini",newIni);
            }
        }
    }
}
