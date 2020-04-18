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
        }

        public Header header;
        
        /// <summary>
        /// The level file header.
        /// </summary>
        public class Header
        {
            public byte[] raw;

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
                    return (ushort)((raw[(int)Addresses.FileVersion] * 256) + raw[(int)Addresses.FileVersion + 1]);
                }
                set
                {
                    raw[(int)Addresses.FileVersion] = ByteAccess.HiByte(value);
                    raw[(int)Addresses.FileVersion + 1] = ByteAccess.LoByte(value);
                    //(byte)System.Math.Floor((double)value / 256);
                }
            }

            /// <summary>
            /// 0 - Standard, 1 - Autoscroll, 2 - 
            /// </summary>
            public byte LevelType
            {
                get
                {
                    return raw[(int)Addresses.LevelType];
                }
                set
                {
                    raw[(int)Addresses.LevelType] = value;
                }
            }

            /// <summary>
            /// Choose music track based on world number, 0 means nothing will play
            /// </summary>
            public byte MusicID
            {
                get
                {
                    return ByteAccess.LoBit(raw[(int)Addresses.MusicThemeID]);
                    //(byte)System.Math.Floor((double)(raw[(int)Addresses.MusicThemeID] / 16));
                }
                set
                {
                    raw[(int)Addresses.MusicThemeID] = (byte)(ByteAccess.HiBit(raw[(int)Addresses.MusicThemeID]) + (value));//(byte)(System.Math.Floor((double)(raw[(int)Addresses.MusicThemeID] / 16)) + value);
                }
            }

            /// <summary>
            /// Chooses scenery and graphics of the level based on world number, 0 means solid colors will be displayed
            /// </summary>
            public byte ThemeID
            {
                get
                {
                    return ByteAccess.HiBit(raw[(int)Addresses.MusicThemeID]);
                }
                set
                {
                    raw[(int)Addresses.MusicThemeID] = (byte)(ByteAccess.LoBit(raw[(int)Addresses.MusicThemeID]) + (value * 16));//(byte)(System.Math.Floor((double)(raw[(int)Addresses.MusicThemeID] / 16)) + value);
                }
            }

            /// <summary>
            /// Player's start position
            /// </summary>
            public Point StartPosition
            {
                get
                {
                    return new Point((int)ByteAccess.MakeLong(ByteAccess.MakeWord(raw[(int)Addresses.StartPointX], raw[(int)Addresses.StartPointX + 1]), ByteAccess.MakeWord(raw[(int)Addresses.StartPointX + 2], raw[(int)Addresses.StartPointX + 3])),
                        (int)ByteAccess.MakeLong(ByteAccess.MakeWord(raw[(int)Addresses.StartPointY], raw[(int)Addresses.StartPointY + 1]), ByteAccess.MakeWord(raw[(int)Addresses.StartPointY + 2], raw[(int)Addresses.StartPointY + 3])));
                }
                set
                {
                    raw[(int)Addresses.StartPoint] = ByteAccess.HiByte(ByteAccess.HiWord((uint)value.X));
                    raw[(int)Addresses.StartPoint + 1] = ByteAccess.LoByte(ByteAccess.HiWord((uint)value.X));
                    raw[(int)Addresses.StartPoint + 2] = ByteAccess.HiByte(ByteAccess.LoWord((uint)value.X));
                    raw[(int)Addresses.StartPoint + 3] = ByteAccess.LoByte(ByteAccess.LoWord((uint)value.X));
                    raw[(int)Addresses.StartPoint + 4] = ByteAccess.HiByte(ByteAccess.HiWord((uint)value.Y));
                    raw[(int)Addresses.StartPoint + 5] = ByteAccess.LoByte(ByteAccess.HiWord((uint)value.Y));
                    raw[(int)Addresses.StartPoint + 6] = ByteAccess.HiByte(ByteAccess.LoWord((uint)value.Y));
                    raw[(int)Addresses.StartPoint + 7] = ByteAccess.LoByte(ByteAccess.LoWord((uint)value.Y));
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
                raw = new byte[0x10];
                raw[0] = MagicNumber[0];
                raw[1] = MagicNumber[1];
            }

            public Header(byte[] input)
            {
                if (input[0] != MagicNumber[0] && input[1] != MagicNumber[1])
                {
                    throw new System.Exception("Invalid header signature.");
                }
                raw = input;
            }
        }
    }
}
