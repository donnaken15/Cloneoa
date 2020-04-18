using System;

namespace KLOAPI
{
    /// <summary>
    /// Test classes and structures to make sure everything works.
    /// </summary>
    public class StressTest
    {
        static Vision.Header header;

        static void Main()
        {
            Vision vis = new Vision();
            header = new Vision.Header();
            PrintData();
            header.FileVersion = 1;
            PrintData();
            header.LevelType = 1;
            PrintData();
            header.MusicID = 14;
            PrintData();
            header.ThemeID = 15;
            PrintData();

            Console.WriteLine(header.FileVersion);
            Console.WriteLine(header.LevelType);
            Console.WriteLine(header.ThemeID);
            Console.WriteLine(header.MusicID);

            Console.WriteLine(header.StartPosition.X + "," + header.StartPosition.Y);
            header.StartPosition = new System.Drawing.Point(100,-100);
            Console.WriteLine(header.StartPosition.X + "," + header.StartPosition.Y);

            PrintData();
        }
        
        static void PrintData()
        {
            Console.WriteLine(BitConverter.ToString(header.raw));
        }
    }
}
