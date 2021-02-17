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
            Console.Write(header.FileVersion);
            header.FileVersion = 1;
            Console.Write(header.FileVersion);
            header.LevelType = 1;
            Console.Write(header.LevelType);
            header.MusicID = 14;
            Console.Write(header.MusicID);
            header.ThemeID = 15;
            Console.Write(header.ThemeID);

            Console.WriteLine(header.FileVersion);
            Console.WriteLine(header.LevelType);
            Console.WriteLine(header.ThemeID);
            Console.WriteLine(header.MusicID);

            //Console.WriteLine(header.StartPosition.x + "," + header.StartPosition.y);
            //header.StartPosition = new XYU16(2,2);
            //Console.WriteLine(header.StartPosition.y + "," + header.StartPosition.y);

            vis = new Vision(System.IO.File.ReadAllBytes("E:\\Cloneoa\\lvl\\TEST_LEVEL_00A.klo"));

            PrintData(vis.File);

            Console.WriteLine(header.LevelSize.x);
            Console.WriteLine((header.LevelSize.x * header.LevelSize.y) + 0x10);
            //Console.WriteLine(vis.objects.Length);
        }
        
        static void PrintData(byte[] array)
        {
            Console.WriteLine(BitConverter.ToString(array));
        }
    }
}
