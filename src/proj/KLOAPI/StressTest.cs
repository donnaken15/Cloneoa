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

            Console.WriteLine(header.StartPosition.x + "," + header.StartPosition.y);
            header.StartPosition = new XYU16(2,2);
            Console.WriteLine(header.StartPosition.y + "," + header.StartPosition.y);

            PrintData();
        }
        
        static void PrintData()
        {
            Console.WriteLine(BitConverter.ToString(header.data));
        }
    }
}
