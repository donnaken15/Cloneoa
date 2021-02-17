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
        public Vision vision;

        PropEdit_NULL PropEdit_NULL_Subst = new PropEdit_NULL();
        PropEdit_Header PropEdit_Level_Subst;
        PropEdit_Obj PropEdit_Object = new PropEdit_Obj();
        int PropEdit_Selector = 1,
            hextext_selstart, hextext_sellen, hextext_fix = 0;
        public string fname = "";
        
        public editing()
        {
            InitializeComponent();
            vision = new Vision();
            PropEdit_Level_Subst = new PropEdit_Header(vision.header, vision);
            objlister.Nodes[0].Expand();
            objectEditorPanel.SelectedObject = vision.header;
            Text = manager.MultilangText("Editor_NewFile");
        }

        public editing(byte[] input, string fname)
        {
            InitializeComponent();
            vision = new Vision(input);
            PropEdit_Level_Subst = new PropEdit_Header(vision.header, vision);
            objlister.Nodes[0].Expand();
            objectEditorPanel.SelectedObject = vision.header;
            vision.File = input;
            Text = fname;
        }

        private void selectObj(object sender, TreeViewEventArgs e)
        {
            if (e.Node.Name == "vision")
            {
                objectEditorPanel.SelectedObject = PropEdit_Level_Subst;
                PropEdit_Selector = 1;

            }
            else if (e.Node.Name.StartsWith("obj"))
            {
                objectEditorPanel.SelectedObject = PropEdit_Object;
                PropEdit_Selector = 0;

            }
            else
            {
                objectEditorPanel.SelectedObject = PropEdit_NULL_Subst;
                PropEdit_Selector = 0;
            }
        }

        public void updateTree()
        {
            objlister.Nodes[0].Nodes.Clear();
            for (int i = 0; i < vision.objects.Count; i++)
                objlister.Nodes[0].Nodes.Add("obj"+i.ToString(),"Object");
            objlister.Nodes[0].Expand();
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
                    //vision.header = PropEdit_Level_Subst.Exchange();
                    //vision.header.StartPosition.x = 100;
                    //vision.header.LevelType = 100;
                    //vision.header.LevelSize.y = 100;
                    vision.header = PropEdit_Level_Subst.__header;
                    break;
            }
        }

        private void updateData(object sender, EventArgs e)
        {
            /*if (hextext_fix == 0)
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
                hextext.Text = BitConverter.ToString(vision.File).Replace("-", string.Empty);
                hextext_fix = 0;
                hextext.SelectionStart = hextext_selstart;
            }*/
            //hextext.Select(hextext_selstart, 0);
            //MessageBox.Show(byte.Parse(hextext.Text.Substring(0, 2), System.Globalization.NumberStyles.HexNumber).ToString("X"));
        }
        
        private void updatePropEdit(object sender, LayoutEventArgs e)
        {
            objectEditorPanel.SelectedObject = PropEdit_Level_Subst;
        }

        private void updateDataDisplay(object sender, PaintEventArgs e)
        {
            /*hextext.Text = BitConverter.ToString(vision.File).Replace("-", string.Empty) + '\n';
            if (vision.File.Length > 10)
                hextext.Text += BitConverter.ToString(vision.File).Replace("-", string.Empty);
            for (int i = 16; i < hextext.Text.Length; i += 16)
            {
                hextext.Text.Insert(i, "\n");
            }*/
        }

        /*private void editrawdatatbox(object sender, KeyEventArgs e)
        {
            e.Handled = ((e.KeyCode >= Keys.D0 && e.KeyCode <= Keys.D9) ||
                e.KeyCode == Keys.Space || (e.KeyCode >= Keys.A && e.KeyCode <= Keys.Z));
        }*/
    }

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
    public class PropEdit_Obj
    {
        [Category("Identifier")]
        [Description("Defines an object type")]
        public ObjectType Type { get; set; }

        [Category("Identifier")]
        [Description("A type of the type of object")]
        public byte Subtype { get; set; }
        //figure out how to switch enums

        [Category("Information")]
        [Description("The placement of the object")]
        public XYU16 Position { get; set; }
    }

    public class PropEdit_NULL
    {
    }

    /// <summary>
    /// The level file header.
    /// </summary>
    public class PropEdit_Header
    {
        public Vision.Header __header;
        public Vision __parent;

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
                return __header.FileVersion;
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
                return __header.LevelType;
            }
            set
            {
                __header.LevelType = value;
            }
        }

        /// <summary>
        /// Choose music track based on world number, 0 means nothing will play
        /// </summary>
        [Category("Style"), Description("0 - No music, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom music")]
        public byte MusicID
        {
            get
            {
                return __header.MusicID;
                //(byte)System.Math.Floor((double)(raw[(int)Addresses.MusicThemeID] / 16));
            }
            set
            {
                __header.MusicID = value;
            }
        }

        /// <summary>
        /// Chooses scenery and graphics of the level based on world number, 0 means solid colors will be displayed
        /// </summary>
        [Category("Style"), Description("0 - Solid color objects, 1 - Ghazzaland, 2 - Piramill, etc, rest of the unused can be replaced with custom assets")]
        public byte ThemeID
        {
            get
            {
                return __header.ThemeID;
            }
            set
            {
                __header.ThemeID = value;
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
                return new Point(__header.StartPosition.x, __header.StartPosition.y);
            }
            set
            {
                __header.StartPosition = new XYU16(value.X, value.Y);
                //if (value.X < ushort.MaxValue && value.Y < ushort.MaxValue &&
                //value.X >= 0 && value.Y >= 0)
                //__header.StartPosition = new XYU16(value.X, value.Y);
                //__header.StartPosition.x = 100;
            }
        }

        /// <summary>
        /// Level size (x16)
        /// </summary>
        [Category("Information"), Description("Level size (x16)")]
        public Point LevelSize
        {
            get
            {
                return new Point(__header.LevelSize.x, __header.LevelSize.y);
            }
            set
            {
                __header.LevelSize = new XYU16(value.X, value.Y);
                __parent.tiles = new byte[value.X * value.Y];
            }
        }

        public PropEdit_Header(Vision.Header curheader, Vision vis)
        {
            __header = curheader;
            __parent = vis;
        }
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