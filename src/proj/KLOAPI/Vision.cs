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
            data = new List<byte>(16);
        }

        /// <summary>
        /// Create level class from file
        /// </summary>
        public Vision(byte[] input)
        {
            //byte[] temp = new byte[0x10];
            //Array.Copy(input, 0, temp, 0, 0x10);
            //header = new Header(temp);
            //temp = new byte[input.Length - 0x10];
            //Array.Copy(input, 0x10, temp, 0, input.Length - 0x10);
            data = new List<byte>(input);
        }

        /*public Vision(byte[] input)
        {
            byte[] temp = new byte[0x10];
            Array.Copy(input, 0, temp, 0, 0x10);
            header = new Header(temp);
            temp = new byte[input.Length - 0x10];
            Array.Copy(input, 0x10, temp, 0, input.Length - 0x10);
            data = new List<byte>();
        }*/

        public Header header
        {
            get
            {
                byte[] temp = new byte[0x10];
                Array.Copy(data.ToArray(), 0, temp, 0, 0x10);
                return new Header(temp);
            }
            set
            {
                header = value;
            }
        }

        public List<byte> data;

        public byte[] tiles
        {
            get
            {
                int sz = header.LevelSize.x* header.LevelSize.y;
                byte[] tile = new byte[sz];
                for (int i = 0; i < sz; i++)
                {
                    tile[i] = data[0x10 + (int)Math.Floor((double)i/2)];
                }
                return tile;
            }
        }

        enum TileType
        {
            Back,
            Fore,
            Overlay,
            Damage
        }

        public Object[] objects
        {
            get
            {
                Object[] newvar = new Object[data.Count / 8];
                for (int i = 0; i < data.Count; i += 8)
                {
                    byte[] a = new byte[10];
                    for (int j = 0; j < 8; j++)
                        a[j] = data[i + j];
                    newvar[i] = new Object(a);
                }
                return newvar;
            }
        }

        //private List<byte> __objects;

        /// <summary>
        /// The level file header
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
                LevelSize = 8,
                LevelSizeX = 8,
                LevelSizeY = 0xA,
                StartPoint = 0xC,
                StartPointX = 0xC,
                StartPointY = 0xE
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
            public XYU16 StartPosition
            {
                get
                {
                    return new XYU16(
                        ByteAccess.MakeWord(data[(int)Addresses.StartPointX], data[(int)Addresses.StartPointX + 1]),
                        ByteAccess.MakeWord(data[(int)Addresses.StartPointY], data[(int)Addresses.StartPointY + 1]));
                }
                set
                {
                    ///TODO: FIX, AM I EVAX OR SOMETHING
                    data[(int)Addresses.StartPoint] = ByteAccess.HiByte(ByteAccess.HiWord(value.x));
                    data[(int)Addresses.StartPoint + 1] = ByteAccess.LoByte(ByteAccess.HiWord(value.x));
                    data[(int)Addresses.StartPoint + 2] = ByteAccess.HiByte(ByteAccess.HiWord(value.y));
                    data[(int)Addresses.StartPoint + 3] = ByteAccess.LoByte(ByteAccess.HiWord(value.y));
                }
            }

            /// <summary>
            /// Level size
            /// </summary>
            [Category("Information"), Description("Level size (x16)")]
            public XYU16 LevelSize
            {
                get
                {
                    return new XYU16(
                        ByteAccess.MakeWord(data[(int)Addresses.StartPointX], data[(int)Addresses.StartPointX + 1]),
                        ByteAccess.MakeWord(data[(int)Addresses.StartPointY], data[(int)Addresses.StartPointY + 1]));
                }
                set
                {
                    ///TODO: FIX, AM I EVAX OR SOMETHING
                    data[(int)Addresses.LevelSize] = ByteAccess.HiByte(ByteAccess.HiWord(value.x));
                    data[(int)Addresses.LevelSize + 1] = ByteAccess.LoByte(ByteAccess.HiWord(value.x));
                    data[(int)Addresses.LevelSize + 2] = ByteAccess.HiByte(ByteAccess.HiWord(value.y));
                    data[(int)Addresses.LevelSize + 3] = ByteAccess.LoByte(ByteAccess.HiWord(value.y));
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
