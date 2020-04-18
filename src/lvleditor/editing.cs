using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using KLOAPI;

namespace enVisioner
{
    public partial class editing : Form
    {
        PropEdit_NULL PropEdit_NULL_Subst = new PropEdit_NULL();
        PropEdit_Level PropEdit_Level_Subst = new PropEdit_Level();
        static int PropEdit_Selector = 0;

        static byte[] header = { 0xAC, 0x1E, 0, 0, 0, 0x11,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, shifter = new byte[10];

        static List<byte> data = new List<byte>(header);

        static Vision vision;

        public editing(bool newFile = true)
        {
            InitializeComponent();
            vision = new Vision();
            objlister.Nodes[0].Expand();
        }

        private void selectObj(object sender, TreeViewEventArgs e)
        {
            switch (e.Node.Name)
            {
                case "vision":
                    PropEdit_Level_Subst.LevelType = data[4];
                    PropEdit_Level_Subst.ThemeID = ByteAccess.HiBit(data[5]);
                    PropEdit_Level_Subst.MusicID = ByteAccess.LoBit(data[5]);
                    objectEditorPanel.SelectedObject = PropEdit_Level_Subst;
                    PropEdit_Selector = 1;
                    break;
                default:
                    objectEditorPanel.SelectedObject = PropEdit_NULL_Subst;
                    PropEdit_Selector = 0;
                    break;
            }
        }

        private void changeByPropEdit(object s, PropertyValueChangedEventArgs e)
        {
            switch (PropEdit_Selector)
            {
                case 1:
                    data[4] = PropEdit_Level_Subst.LevelType;
                    ByteAccess.Is4Bits(PropEdit_Level_Subst.MusicID);
                    ByteAccess.Is4Bits(PropEdit_Level_Subst.ThemeID);    
                    data[5] = (byte)(PropEdit_Level_Subst.MusicID + (PropEdit_Level_Subst.ThemeID * 16));
                    break;
            }
        }

        private void updateDataDisplay(object sender, PaintEventArgs e)
        {
            hextext.Text = BitConverter.ToString(data.ToArray()).Replace("-",string.Empty);
        }

        /*private void editrawdatatbox(object sender, KeyEventArgs e)
        {
            e.Handled = ((e.KeyCode >= Keys.D0 && e.KeyCode <= Keys.D9) ||
                e.KeyCode == Keys.Space || (e.KeyCode >= Keys.A && e.KeyCode <= Keys.Z));
        }*/
    }

    public enum objtype
    {
        Item,
        Entity,
        Door,
        Sign,
        Fore = 0xF,
        Back = 0xE
    };

    public enum item
    {
        Gem,
        Diamond,
        Heart,
        Star,
        Life
    };

    public enum entity
    {
        Mu,
        Mufly,
        Box,
        Ball
    };

    public enum door
    {
        Goal,
        Locked0,
        Locked1,
        Warp
    };

    [DefaultProperty("StartPosition")]
    public class PropEdit_Level
    {
        [Category("Information"), Description("0 - Normal, 1 - Autoscroll, 2 - Board")]
        public byte LevelType { get; set; }

        [Category("Information"), Description("0 - No music, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom music")]
        public byte MusicID { get { return _MusicID; } set { if (value < 16) _MusicID = value; } }
        private byte _MusicID { get; set; }

        [Category("Information"), Description("0 - Solid color objects, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom assets")]
        public byte ThemeID { get { return _ThemeID; } set { if (value < 16) _ThemeID = value; } }
        private byte _ThemeID { get; set; }

        [Category("Information"), Description("Player's starting position")]
        public Point StartPosition { get; set; }
    }

    [DefaultProperty("Type")]
    public class PropEdit_Item
    {
        [Category("Identifier")]
        //[Description("")]
        public objtype Type { get; set; }

        [Category("Identifier")]
        //[Description("")]
        public item Subtype { get; set; }

        [Category("Information")]
        //[Description("")]
        public Point Position { get; set; }
    }

    public class PropEdit_NULL
    {
    }

    /*[DefaultProperty("Type")]
    public class CustomObject
    {
        [Category("Identifier")]
        //[Description("")]
        public objtype Type { get; set; }

        [Category("Identifier")]
        //[Description("")]
        public item Subtype { get; set; }

        [Category("Information")]
        //[Description("")]
        public Point Position { get; set; }
    }*/
}