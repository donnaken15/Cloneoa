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
            PrintData(header.data);
            header.FileVersion = 1;
            PrintData(header.data);
            header.LevelType = 1;
            PrintData(header.data);
            header.MusicID = 14;
            PrintData(header.data);
            header.ThemeID = 15;
            PrintData(header.data);

            Console.WriteLine(header.FileVersion);
            Console.WriteLine(header.LevelType);
            Console.WriteLine(header.ThemeID);
            Console.WriteLine(header.MusicID);

            //Console.WriteLine(header.StartPosition.x + "," + header.StartPosition.y);
            //header.StartPosition = new XYU16(2,2);
            //Console.WriteLine(header.StartPosition.y + "," + header.StartPosition.y);

            PrintData(header.data);

            vis = new Vision(System.IO.File.ReadAllBytes("E:\\Cloneoa\\lvl\\TEST_LEVEL_00A.klo"));

            PrintData(vis.data.ToArray());

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
