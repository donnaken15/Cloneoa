using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace KLOAPI
{
    public class Vision
    {
        /// <summary>
        /// File signature/identifier, must always be 0xAC1E
        /// </summary>
        public static readonly byte[] MagicNumber = { 0xAC, 0x1E };

        /// <summary>
        /// This value is assigned in the header file in case
        /// of patches that require changing of data structures.
        /// </summary>
        public const ushort FileVersion = 0;

        static public void ContestVersionNumber(Vision vis)
        {
            if (vis.header.FileVersion != FileVersion)
                throw new NotSupportedException("Vision has mismatching vision version number.");
        }

        /// <summary>
        /// Construct a new level class.
        /// </summary>
        public Vision()
        {
            header = new Header();
            header.LevelSize = new XYU16(16, 16);
            header.StartPosition = new XYU16(4, 4);
            header.FileVersion = FileVersion;
            tiles = new byte[256];
            objects = new List<Object>();
        }

        /// <summary>
        /// Create level class from file.
        /// </summary>
        public Vision(byte[] input)
        {
            File = input;
            //data = new List<byte>();
            // TODO: implement validator
            //data.AddRange(input);

        }

        public Header header;

        public byte[] tiles;

        public List<Object> objects;

        enum TileType
        {
            Block,
            Noclip,
            Damage
        }

        /// <summary>
        /// Use when saving or loading a file's data.
        /// </summary>
        public byte[] File
        {
            get
            {
                int TileSZ = header.LevelSize.x * header.LevelSize.y;
                byte[] myFile = new byte[
                    16 + TileSZ + (objects.Count * 8)
                ];

                myFile[0] = 0xAC;
                myFile[1] = 0x1E;
                myFile[2] = ByteAccess.HiByte(header.FileVersion);
                myFile[3] = ByteAccess.LoByte(header.FileVersion);
                myFile[4] = header.LevelType;
                myFile[5] = (byte)((header.MusicID << 8) + header.ThemeID);
                myFile[8] = ByteAccess.HiByte(header.LevelSize.x);
                myFile[9] = ByteAccess.LoByte(header.LevelSize.x);
                myFile[10] = ByteAccess.HiByte(header.LevelSize.y);
                myFile[11] = ByteAccess.LoByte(header.LevelSize.y);
                myFile[12] = ByteAccess.HiByte(header.StartPosition.x);
                myFile[13] = ByteAccess.LoByte(header.StartPosition.x);
                myFile[14] = ByteAccess.HiByte(header.StartPosition.y);
                myFile[15] = ByteAccess.LoByte(header.StartPosition.y);
                int afterTileCursor = 0;
                /*for (int i = 0; i < TileSZ; i++)
                {
                    if (i < tiles.Length)
                        myFile[i + 16] = tiles[i];
                    else
                        myFile[i + 16] = 0;
                    afterTileCursor = i;
                }*/
                Array.Copy(tiles, 0, myFile, 0x10, TileSZ);
                afterTileCursor += TileSZ;
                while (afterTileCursor % 8 != 0)
                    afterTileCursor++;
                afterTileCursor += 16;
                for (int i = 0; i < objects.Count; i++)
                {
                    myFile[afterTileCursor + (i * 8)] = objects[0].type;
                    myFile[afterTileCursor + (i * 8) + 1] = objects[0].subtype;
                    myFile[afterTileCursor + (i * 8) + 2] = objects[0].props[0];
                    myFile[afterTileCursor + (i * 8) + 3] = objects[0].props[1];
                    myFile[afterTileCursor + (i * 8) + 4] = ByteAccess.HiByte(objects[0].pos.x);
                    myFile[afterTileCursor + (i * 8) + 5] = ByteAccess.LoByte(objects[0].pos.x);
                    myFile[afterTileCursor + (i * 8) + 6] = ByteAccess.HiByte(objects[0].pos.y);
                    myFile[afterTileCursor + (i * 8) + 7] = ByteAccess.LoByte(objects[0].pos.y);
                }

                return myFile;
            }
            set
            {
                if (value[0] == 0xAC && value[1] == 0x1E)
                {
                    header = new Header();
                    header.FileVersion = ByteAccess.MakeWord(value[2], value[3]);
                    ContestVersionNumber(this);
                    header.LevelType = value[4];
                    header.MusicID = ByteAccess.HiBit(value[5]);
                    header.ThemeID = ByteAccess.LoBit(value[6]);
                    header.LevelSize = new XYU16(
                        ByteAccess.MakeWord(value[8], value[9]),
                        ByteAccess.MakeWord(value[10], value[11])
                        );
                    header.StartPosition = new XYU16(
                        ByteAccess.MakeWord(value[12], value[13]),
                        ByteAccess.MakeWord(value[14], value[15])
                        );
                    int lvSz = header.LevelSize.x * header.LevelSize.y;
                    tiles = new byte[lvSz];
                    Array.Copy(value, 0, tiles, 0, lvSz);
                    objects = new List<Object>();
                    byte[] __obj = new byte[8];
                    for (int i = lvSz + 0x10; i < value.Length; i += 8)
                    {
                        //Array.Copy(value, i, __obj, 0, 8);
                        //objects.Add(new Object(__obj));
                        objects.Add(new Object());
                    }
                        /*new Object(value[i], value[i + 2],
                            new byte[] { value[i + 3], value[i + 4], value[1 + 5] },
                            new XYU16(
                        ByteAccess.MakeWord(value[12], value[13]),
                        ByteAccess.MakeWord(value[14], value[15])
                        )
                            );*/
                }
            }
        }

        /// <summary>
        /// The level file header.
        /// </summary>
        public class Header
        {
            // figure out tile resizing
            //public Vision __parent;
            //private XYU16 lvSzRaw;

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

            public ushort FileVersion;

            /// <summary>
            /// 0 - Standard, 1 - Autoscroll, 2 - Board
            /// </summary>
            [Category("Information"), Description("0 - Normal, 1 - Autoscroll, 2 - Board")]
            public byte LevelType;

            /// <summary>
            /// Choose music track based on world number, 0 means nothing will play
            /// </summary>
            [Category("Style"), Description("0 - No music, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom music")]
            public byte MusicID;

            /// <summary>
            /// Chooses scenery and graphics of the level based on world number, 0 means solid colors will be displayed
            /// </summary>
            [Category("Style"), Description("0 - Solid color objects, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom assets")]
            public byte ThemeID;

            /// <summary>
            /// Player's start position
            /// </summary>
            [Category("Information"), Description("Player's starting position")]
            public XYU16 StartPosition;

            /// <summary>
            /// Level size (x16)
            /// </summary>
            [Category("Information"), Description("Level size (x16)")]
            public XYU16 LevelSize;
            /*{
                get
                {
                    return lvSzRaw;
                }
                set
                {
                    LevelSize = value;
                    __parent.tiles = new byte[lvSzRaw.x * lvSzRaw.y];
                }
            }*/

            public Header()
            {
                
            }

            public Header(byte[] input)
            {
                if (input[0] != MagicNumber[0] && input[1] != MagicNumber[1])
                {
                    throw new Exception("Invalid header signature.");
                }
            }
        }
    }
}
