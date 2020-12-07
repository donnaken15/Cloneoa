using System;
using System.Drawing;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using KLOAPI;

namespace enVisioner
{
    public partial class manager : Form
    {

        static int progresssize = 128;

        static IniFile settings = new IniFile();

        static string lang = "EN";

        string MultilangText(string param)
        {
            return Properties.Resources.ResourceManager.GetString(lang + '_' + param);
        }

        void Localize()
        {
            string prefix = "Root_";
            Text = MultilangText(prefix + "Title");
            {
                prefix += "Menu_";
                menuFile.Text = MultilangText(prefix + "File");
                menuEdit.Text = MultilangText(prefix + "Edit");
                menuView.Text = MultilangText(prefix + "View");
                menuLevel.Text = MultilangText(prefix + "Level");
                menuWindows.Text = MultilangText(prefix + "Windows");
                menuHelp.Text = MultilangText(prefix + "Help");
                menuNew.Text = MultilangText(prefix + "File_New");
                menuOpen.Text = MultilangText(prefix + "File_Open");
                menuOpenRecent.Text = MultilangText(prefix + "File_RF");
                menuSave.Text = MultilangText(prefix + "File_Save");
                menuSaveAs.Text = MultilangText(prefix + "File_SaveAs");
                menuExit.Text = MultilangText(prefix + "File_Exit");
            }
        }

        public manager()
        {
            //splash loadsign = new splash();
            //loadsign.Show();
            InitializeComponent();
            toolLoadProg.Maximum = progresssize;
            toolLoadProg.Value = progresssize;
            toolLoadProg.Size = new Size(progresssize, 18);
            toolLoadText.Width = progresssize;
            if (File.Exists("settings.ini"))
            {
                settings.Load("settings.ini");
                //settings_editor = new IniFile.IniSection(settings, "Editor");
                if (settings.GetKeyValue("Editor", "ResX") != string.Empty ||
                    settings.GetKeyValue("Editor", "ResY") != string.Empty)
                    Size = new Size(
                    Convert.ToInt32(settings.GetKeyValue("Editor", "ResX")),
                    Convert.ToInt32(settings.GetKeyValue("Editor", "ResY")));
                if (settings.GetKeyValue("Editor", "PosX") != string.Empty ||
                    settings.GetKeyValue("Editor", "PosY") != string.Empty)
                {
                    StartPosition = FormStartPosition.Manual;
                    Location = new Point(
                        Convert.ToInt32(settings.GetKeyValue("Editor", "PosX")),
                        Convert.ToInt32(settings.GetKeyValue("Editor", "PosY")));
                }
                switch (settings.GetKeyValue("General","Language"))
                {
                    case "0":
                        lang = "EN";
                        break;
                    case "1":
                        lang = "JP";
                        break;
                }
            }
            //loadsign.Close();
            Localize();
        }

        bool QuitProg()
        {
            settings.SetKeyValue("Editor", "ResX", Size.Width.ToString());
            settings.SetKeyValue("Editor", "ResY", Size.Height.ToString());
            settings.SetKeyValue("Editor", "PosX", Location.X.ToString());
            settings.SetKeyValue("Editor", "PosY", Location.Y.ToString());
            settings.Save("settings.ini");
            return true;
        }

        private void quitProg(object sender, EventArgs e)
        {
            if (QuitProg())
                Application.Exit();
        }
        
        private void attemptClose(object sender, FormClosingEventArgs e)
        {
            //base.OnFormClosing(e);
            if (e.CloseReason == CloseReason.WindowsShutDown) return;
            if (!QuitProg())
                e.Cancel = true;
        }

        #region event stuff clogging lines
        private void newVision(object sender, EventArgs e)
        {
            editing newlvl = new editing();
            newlvl.MdiParent = this;
            newlvl.Show();
        }

        #region this looks wasteful
        private void mdiArrange(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.ArrangeIcons);
        }

        private void mdiCascade(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.Cascade);
        }

        private void mdiTileH(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileHorizontal);
        }

        private void mdiTileV(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileVertical);
        }
        #endregion

        private void swapWin(object sender, ToolStripItemClickedEventArgs e)
        {
            //ActivateMdiChild(MdiChildren[Convert.ToInt32(e.ClickedItem.Name)]);
            if (menuWindows.DropDownItems.IndexOf(e.ClickedItem) > 6)
                MdiChildren[Convert.ToInt32(e.ClickedItem.Name.Substring(8))].Focus();
        }

        private void getDocList(object sender, EventArgs e)
        {
            menuWindows.DropDownItems.Clear();
            menuWindows.DropDownItems.Add("Arrange", null, mdiArrange);
            menuWindows.DropDownItems.Add("Cascade", null, mdiCascade);
            menuWindows.DropDownItems.Add("-");
            menuWindows.DropDownItems.Add("Tile Horizontally", null, mdiTileH);
            menuWindows.DropDownItems.Add("Tile Vertically", null, mdiTileV);
            menuWindows.DropDownItems.Add("-");
            ToolStripDropDownItem wnd;
            for (int i = 0; i < MdiChildren.Length; i++) {
                wnd = new ToolStripMenuItem(MdiChildren[i].Text/*.Substring(9)*/,null,null,"mdiChild"+i.ToString());
                menuWindows.DropDownItems.Add(wnd);
            }
        }

        private void disableUseless1(object sender, EventArgs e)
        {
            
        }

        private void showAbout(object sender, EventArgs e)
        {
            new about().ShowDialog();
        }

        private void fileLoad(object sender, EventArgs e)
        {
            if (fileDiagOpen.ShowDialog() == DialogResult.OK)
            {
                editing newlvl = new editing(File.ReadAllBytes(fileDiagOpen.FileName));
                newlvl.MdiParent = this;
                newlvl.Show();
            }
        }

        private void commonTick(object sender, EventArgs e)
        {
            bool enableOrNot = MdiChildren.Length > 0 || ActiveMdiChild != null;
            menuSave.Enabled = enableOrNot;
            menuSaveAs.Enabled = enableOrNot;
            menuUndo.Enabled = enableOrNot;
            menuRedo.Enabled = enableOrNot;
            menuCut.Enabled = enableOrNot;
            menuCopy.Enabled = enableOrNot;
            menuPaste.Enabled = enableOrNot;
            menuWindows.Enabled = enableOrNot;
            toolSave.Enabled = enableOrNot;
            toolUndo.Enabled = enableOrNot;
            toolRedo.Enabled = enableOrNot;
            toolCut.Enabled = enableOrNot;
            toolCopy.Enabled = enableOrNot;
            toolPaste.Enabled = enableOrNot;
            toolUndo.Enabled = enableOrNot;
            toolNewObj.Enabled = enableOrNot;
            toolObjFind.Enabled = enableOrNot;
            toolObjProp.Enabled = enableOrNot;
            toolObjRemove.Enabled = enableOrNot;
            toolLink.Enabled = enableOrNot;
        }
        #endregion

        private void updateWinSettings(object sender, EventArgs e)
        {
            // used to be ini writing pos and res, check QuitProg
        }

        private void newObjBtn(object sender, EventArgs e)
        {
            KLOAPI.Object test = new KLOAPI.Object();
            for (int i = 0; i < 10; i++)
                ((editing)ActiveMdiChild).vision.data.Add(0);
            //MdiChildren[0] = new editing() { vision = new Vision() { header = { MusicID = 5 } } };
        }

        private void locSwitchEn(object sender, EventArgs e)
        {
            lang = "EN";
            Localize();
        }

        private void locSwitchJp(object sender, EventArgs e)
        {
            lang = "JP";
            Localize();
        }

        private void showGuide(object sender, EventArgs e)
        {
            Help.ShowHelp(this, "info.chm");
        }
    }
}
