using System;
using System.Drawing;
using System.Windows.Forms;
using System.Collections.Generic;

namespace enVisioner
{
    public partial class manager : Form
    {
        public manager()
        {
            InitializeComponent();
        }

        bool QuitProg()
        {
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

        private void newVision(object sender, EventArgs e)
        {
            editing newlvl = new editing();
            newlvl.MdiParent = this;
            newlvl.Show();
            menuWindows.Enabled = true;
            toolSave.Enabled = true;
            toolUndo.Enabled = true;
            toolRedo.Enabled = true;
            toolCut.Enabled = true;
            toolCopy.Enabled = true;
            toolPaste.Enabled = true;
            toolUndo.Enabled = true;
            toolNewObj.Enabled = true;
            toolObjFind.Enabled = true;
            toolObjProp.Enabled = true;
            toolObjRemove.Enabled = true;
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
            MdiChildren[Convert.ToInt32(e.ClickedItem.Name)].Focus();
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
                wnd = new ToolStripMenuItem(MdiChildren[i].Text.Substring(9),null,null,i.ToString());
                menuWindows.DropDownItems.Add(wnd);
            }
        }

        private void disableUseless1(object sender, EventArgs e)
        {
            bool enableOrNot = MdiChildren.Length > 0;
            menuSave.Enabled = enableOrNot;
            menuSaveAs.Enabled = enableOrNot;
            menuUndo.Enabled = enableOrNot;
            menuRedo.Enabled = enableOrNot;
            menuCut.Enabled = enableOrNot;
            menuCopy.Enabled = enableOrNot;
            menuPaste.Enabled = enableOrNot;
        }

        private void showAbout(object sender, EventArgs e)
        {
            new about().ShowDialog();
        }
    }
}
