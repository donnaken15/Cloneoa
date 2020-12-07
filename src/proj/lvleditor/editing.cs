using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using KLOAPI;
using System.Text;

namespace enVisioner
{
    public partial class editing : Form
    {
        PropEdit_NULL PropEdit_NULL_Subst = new PropEdit_NULL();
        Vision.Header PropEdit_Level_Subst;
        static int PropEdit_Selector = 0,
            hextext_selstart, hextext_sellen, hextext_fix = 0;

        static byte[] header = { 0xAC, 0x1E, 0, 0, 0, 0x11,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, shifter = new byte[10];

        //static List<byte> data = new List<byte>(header);

        public Vision vision;

        public editing()
        {
            InitializeComponent();
            vision = new Vision();
            objlister.Nodes[0].Expand();
        }

        public editing(byte[] input)
        {
            InitializeComponent();
            vision = new Vision(input);
            objlister.Nodes[0].Expand();
        }

        private void selectObj(object sender, TreeViewEventArgs e)
        {
            switch (e.Node.Name)
            {
                case "vision":
                    PropEdit_Level_Subst = vision.header;
                    //PropEdit_Level_Subst.LevelType = vision.header.LevelType;
                    //PropEdit_Level_Subst.ThemeID = vision.header.ThemeID;//ByteAccess.HiBit(vision.header.data[5]);
                    //PropEdit_Level_Subst.MusicID = ;//ByteAccess.LoBit(vision.header.data[5]);
                    objectEditorPanel.SelectedObject = PropEdit_Level_Subst;
                    PropEdit_Selector = 1;
                    break;
                default:
                    objectEditorPanel.SelectedObject = PropEdit_NULL_Subst;
                    PropEdit_Selector = 0;
                    break;
            }
        }

        private void hextextKeys(object sender, KeyPressEventArgs e)
        {
            if (!(e.KeyChar >= '0' && e.KeyChar <= '9') || !(e.KeyChar > 'A' && e.KeyChar <= 'F'))
                e.Handled = false;
        }

        private void hextextKeys(object sender, KeyEventArgs e)
        {
            
        }

        /*private Point MouseDownLocation;

        private void testDrag(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Left)
            {
                MouseDownLocation = e.Location;
            }
        }

        private void testDrag2(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Left)
            {
                panel1.Cursor = Cursors.SizeAll;
                panel1.Left = e.X + panel1.Left - MouseDownLocation.X;
                panel1.Top = e.Y + panel1.Top - MouseDownLocation.Y;
            }
        }

        private void testDrag3(object sender, MouseEventArgs e)
        {
            panel1.Cursor = Cursors.Hand;
        }*/

        private void changeByPropEdit(object s, PropertyValueChangedEventArgs e)
        {
            switch (PropEdit_Selector)
            {
                case 1:
                    vision.header.data[4] = PropEdit_Level_Subst.LevelType;
                    ByteAccess.Is4Bits(PropEdit_Level_Subst.MusicID);
                    ByteAccess.Is4Bits(PropEdit_Level_Subst.ThemeID);
                    vision.header.data[5] = (byte)(PropEdit_Level_Subst.MusicID + (PropEdit_Level_Subst.ThemeID * 16));
                    break;
            }
        }

        private void updateData(object sender, EventArgs e)
        {
            if (hextext_fix == 0)
            {
                if (hextext.SelectionStart != 0)
                {
                    hextext_selstart = hextext.SelectionStart;
                    //hextext.Text.Remove(hextext_selstart, 2);
                }
                hextext_fix = 1;
                //hextext_sellen = hextext.SelectionLength;
                //if (hextext.Text.Replace("\n", "").Replace("\r", "").Length % 2 != 0)
                //hextext.Text += "0";
                if (hextext.Text.Length < 32)
                {
                    hextext.Text = BitConverter.ToString(vision.header.data).Replace("-", string.Empty);
                }
                else
                {
                    //vision.header.data = Encoding.ASCII.GetBytes(hextext.Text.Substring(32));
                    for (int i = 2; i < vision.header.data.Length; i++)
                        vision.header.data[i] = byte.Parse(hextext.Text.Substring(i * 2, 2), System.Globalization.NumberStyles.HexNumber);
                }
                hextext.Text.Remove(5, 1);
                hextext_fix = 0;
                hextext.SelectionStart = hextext_selstart;
            }
            //hextext.Select(hextext_selstart, 0);
            //MessageBox.Show(byte.Parse(hextext.Text.Substring(0, 2), System.Globalization.NumberStyles.HexNumber).ToString("X"));
        }
        
        private void updatePropEdit(object sender, LayoutEventArgs e)
        {
            objectEditorPanel.SelectedObject = PropEdit_Level_Subst;
        }

        private void updateDataDisplay(object sender, PaintEventArgs e)
        {
            hextext.Text = BitConverter.ToString(vision.header.data).Replace("-", string.Empty) + '\n';
            if (vision.data.ToArray().Length > 10)
                hextext.Text += BitConverter.ToString(vision.data.ToArray()).Replace("-", string.Empty);
            for (int i = 16; i < hextext.Text.Length; i += 16)
            {
                hextext.Text.Insert(i, "\n");
            }
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

    /*[DefaultProperty("StartPosition")]
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
    }*/

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