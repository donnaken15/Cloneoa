
using Ionic.Zip;
using System.IO;
using System.Diagnostics;

namespace VUEx
{
    class Program
    {
        static void Main(string[] args)
        {
            new ZipFile("l.zip").ExtractAll(
                Path.Combine(Directory.GetCurrentDirectory(),"..\\"),
                ExtractExistingFileAction.OverwriteSilently);
            Process sd = new Process();
            //sd.StartInfo = new ProcessStartInfo("cmd.exe", "/c del * /F/Q && cd .. && rmdir tmp");
            sd.StartInfo = new ProcessStartInfo("cmd.exe", "/c del tmp\\* /F/Q && rmdir tmp");
            sd.StartInfo.CreateNoWindow = true;
            sd.StartInfo.UseShellExecute = false;
            sd.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            //sd.StartInfo.WorkingDirectory = Path.GetPathRoot(System.Environment.GetCommandLineArgs()[0]);
            sd.Start();
        }
    }
}
