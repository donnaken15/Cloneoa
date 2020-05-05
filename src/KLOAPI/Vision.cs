using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;

namespace KLOAPI
{
    public class Vision
    {
        /// <summary>
        /// This value is assigned in the header file in case
        /// of patches that require changing of data structures.
        /// </summary>
        public static readonly ushort FileVersion = 0;

        /// <summary>
        /// Construct a new level class.
        /// </summary>
        public Vision()
        {
            header = new Header();
            data = new List<byte>();
        }

        /// <summary>
        /// Create level class from file
        /// </summary>
        public Vision(byte[] input)
        {
            byte[] temp = new byte[0x10];
            Array.Copy(input, 0, temp, 0, 0x10);
            header = new Header(temp);
            temp = new byte[input.Length - 0x10];
            Array.Copy(input, 0x10, temp, 0, input.Length - 0x10);
            data = new List<byte>();
        }

        public Header header;

        public List<byte> data;

        public Object[] objects
        {
            get
            {
                Object[] newvar = new Object[data.Count / 10];
                for (int i = 0; i < data.Count; i += 10)
                {
                    byte[] a = new byte[10];
                    for (int j = 0; j < 10; j++)
                        a[j] = data[i + j];
                    newvar[i] = new Object(a);
                }
                return newvar;
            }
        }

        //private List<byte> __objects;

        /// <summary>
        /// The level file header.
        /// </summary>
        public class Header
        {
            public byte[] data;

            /// <summary>
            /// List of addresses for each piece of data in this object
            /// </summary>
            public enum Addresses
            {
                MagicNumber = 0,
                FileVersion = 2,
                LevelType = 4,
                MusicThemeID,
                StartPoint = 8,
                StartPointX = 8,
                StartPointY = 0xC
            }

            public ushort FileVersion
            {
                get
                {
                    return (ushort)((data[(int)Addresses.FileVersion] * 256) + data[(int)Addresses.FileVersion + 1]);
                }
                set
                {
                    data[(int)Addresses.FileVersion] = ByteAccess.HiByte(value);
                    data[(int)Addresses.FileVersion + 1] = ByteAccess.LoByte(value);
                    //(byte)System.Math.Floor((double)value / 256);
                }
            }

            /// <summary>
            /// 0 - Standard, 1 - Autoscroll, 2 - 
            /// </summary>
            [Category("Information"), Description("0 - Normal, 1 - Autoscroll, 2 - Board")]
            public byte LevelType
            {
                get
                {
                    return data[(int)Addresses.LevelType];
                }
                set
                {
                    data[(int)Addresses.LevelType] = value;
                }
            }

            /// <summary>
            /// Choose music track based on world number, 0 means nothing will play
            /// </summary>
            [Category("Information"), Description("0 - No music, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom music")]
            public byte MusicID
            {
                get
                {
                    return ByteAccess.LoBit(data[(int)Addresses.MusicThemeID]);
                    //(byte)System.Math.Floor((double)(raw[(int)Addresses.MusicThemeID] / 16));
                }
                set
                {
                    data[(int)Addresses.MusicThemeID] = (byte)(ByteAccess.HiBit(data[(int)Addresses.MusicThemeID]) + (value));//(byte)(System.Math.Floor((double)(raw[(int)Addresses.MusicThemeID] / 16)) + value);
                }
            }

            /// <summary>
            /// Chooses scenery and graphics of the level based on world number, 0 means solid colors will be displayed
            /// </summary>
            [Category("Information"), Description("0 - Solid color objects, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom assets")]
            public byte ThemeID
            {
                get
                {
                    return ByteAccess.HiBit(data[(int)Addresses.MusicThemeID]);
                }
                set
                {
                    data[(int)Addresses.MusicThemeID] = (byte)(ByteAccess.LoBit(data[(int)Addresses.MusicThemeID]) + (value * 16));//(byte)(System.Math.Floor((double)(raw[(int)Addresses.MusicThemeID] / 16)) + value);
                }
            }

            /// <summary>
            /// Player's start position
            /// </summary>
            [Category("Information"), Description("Player's starting position")]
            public Point StartPosition
            {
                get
                {
                    return new Point((int)ByteAccess.MakeLong(ByteAccess.MakeWord(data[(int)Addresses.StartPointX], data[(int)Addresses.StartPointX + 1]), ByteAccess.MakeWord(data[(int)Addresses.StartPointX + 2], data[(int)Addresses.StartPointX + 3])),
                        (int)ByteAccess.MakeLong(ByteAccess.MakeWord(data[(int)Addresses.StartPointY], data[(int)Addresses.StartPointY + 1]), ByteAccess.MakeWord(data[(int)Addresses.StartPointY + 2], data[(int)Addresses.StartPointY + 3])));
                }
                set
                {
                    ///TODO: FIX, AM I EVAX OR SOMETHING
                    data[(int)Addresses.StartPoint] = ByteAccess.HiByte(ByteAccess.HiWord((uint)value.X));
                    data[(int)Addresses.StartPoint + 1] = ByteAccess.LoByte(ByteAccess.HiWord((uint)value.X));
                    data[(int)Addresses.StartPoint + 2] = ByteAccess.HiByte(ByteAccess.LoWord((uint)value.X));
                    data[(int)Addresses.StartPoint + 3] = ByteAccess.LoByte(ByteAccess.LoWord((uint)value.X));
                    data[(int)Addresses.StartPoint + 4] = ByteAccess.HiByte(ByteAccess.HiWord((uint)value.Y));
                    data[(int)Addresses.StartPoint + 5] = ByteAccess.LoByte(ByteAccess.HiWord((uint)value.Y));
                    data[(int)Addresses.StartPoint + 6] = ByteAccess.HiByte(ByteAccess.LoWord((uint)value.Y));
                    data[(int)Addresses.StartPoint + 7] = ByteAccess.LoByte(ByteAccess.LoWord((uint)value.Y));
                }
            }

            /// <summary>
            /// File signature/identifier, must always be 0xAC1E
            /// </summary>
            public static readonly byte[] MagicNumber = { 0xAC, 0x1E };

            /*public static Header ParseHeader(byte[] input)
            {
                Header myvar = new Header();
                if (input[0] != MagicNumber[0] && input[1] != MagicNumber[1])
                {
                    throw new System.Exception("Invalid header signature.");
                }
                return myvar;
            }*/

            public Header()
            {
                data = new byte[0x10];
                data[0] = MagicNumber[0];
                data[1] = MagicNumber[1];
            }

            public Header(byte[] input)
            {
                if (input[0] != MagicNumber[0] && input[1] != MagicNumber[1])
                {
                    throw new Exception("Invalid header signature.");
                }
                data = input;
            }
        }
    }
}
