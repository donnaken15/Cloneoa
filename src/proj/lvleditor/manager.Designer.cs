namespace enVisioner
{
    partial class manager
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(manager));
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.menuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.menuNew = new System.Windows.Forms.ToolStripMenuItem();
            this.menuOpen = new System.Windows.Forms.ToolStripMenuItem();
            this.menuOpenRecent = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSave = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSaveAs = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSepFile1 = new System.Windows.Forms.ToolStripSeparator();
            this.menuExit = new System.Windows.Forms.ToolStripMenuItem();
            this.menuEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.menuUndo = new System.Windows.Forms.ToolStripMenuItem();
            this.menuRedo = new System.Windows.Forms.ToolStripMenuItem();
            this.menuEditSep1 = new System.Windows.Forms.ToolStripSeparator();
            this.menuCut = new System.Windows.Forms.ToolStripMenuItem();
            this.menuCopy = new System.Windows.Forms.ToolStripMenuItem();
            this.menuPaste = new System.Windows.Forms.ToolStripMenuItem();
            this.menuView = new System.Windows.Forms.ToolStripMenuItem();
            this.menuLevel = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjSub = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjNewSub = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjNewItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjNewGem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjNewStar = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjNew5G = new System.Windows.Forms.ToolStripMenuItem();
            this.menuNewObjHeal = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjNewKey = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjNewLife = new System.Windows.Forms.ToolStripMenuItem();
            this.enemyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mooToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.flyingMooToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mooToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.propellerToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mineMooToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.spikeCannonToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.floatingBallToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjProps = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjFind = new System.Windows.Forms.ToolStripMenuItem();
            this.menuObjDel = new System.Windows.Forms.ToolStripMenuItem();
            this.menuLink = new System.Windows.Forms.ToolStripMenuItem();
            this.menuWindows = new System.Windows.Forms.ToolStripMenuItem();
            this.menuHelp = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.guideToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.langSwapTooltree = new System.Windows.Forms.ToolStripMenuItem();
            this.langSwapEng = new System.Windows.Forms.ToolStripMenuItem();
            this.langSwapJpn = new System.Windows.Forms.ToolStripMenuItem();
            this.mainToolbar = new System.Windows.Forms.ToolStrip();
            this.toolNew = new System.Windows.Forms.ToolStripButton();
            this.toolOpen = new System.Windows.Forms.ToolStripButton();
            this.toolSave = new System.Windows.Forms.ToolStripButton();
            this.toolSepFile = new System.Windows.Forms.ToolStripSeparator();
            this.toolUndo = new System.Windows.Forms.ToolStripButton();
            this.toolRedo = new System.Windows.Forms.ToolStripButton();
            this.toolSepEdit = new System.Windows.Forms.ToolStripSeparator();
            this.toolCut = new System.Windows.Forms.ToolStripButton();
            this.toolCopy = new System.Windows.Forms.ToolStripButton();
            this.toolPaste = new System.Windows.Forms.ToolStripButton();
            this.toolSepObject = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.toolNewObj = new System.Windows.Forms.ToolStripButton();
            this.toolObjProp = new System.Windows.Forms.ToolStripButton();
            this.toolObjFind = new System.Windows.Forms.ToolStripButton();
            this.toolLink = new System.Windows.Forms.ToolStripButton();
            this.toolObjRemove = new System.Windows.Forms.ToolStripButton();
            this.toolSepMisc = new System.Windows.Forms.ToolStripSeparator();
            this.toolHelp = new System.Windows.Forms.ToolStripButton();
            this.statusBar = new System.Windows.Forms.StatusStrip();
            this.toolLoadProg = new System.Windows.Forms.ToolStripProgressBar();
            this.toolLoadText = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusSep1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.fileDiagOpen = new System.Windows.Forms.OpenFileDialog();
            this.fileDiagSave = new System.Windows.Forms.SaveFileDialog();
            this.commonUpdater = new System.Windows.Forms.Timer(this.components);
            this.mainMenu.SuspendLayout();
            this.mainToolbar.SuspendLayout();
            this.statusBar.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainMenu
            // 
            resources.ApplyResources(this.mainMenu, "mainMenu");
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuFile,
            this.menuEdit,
            this.menuView,
            this.menuLevel,
            this.menuWindows,
            this.menuHelp});
            this.mainMenu.Name = "mainMenu";
            this.mainMenu.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            // 
            // menuFile
            // 
            this.menuFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuNew,
            this.menuOpen,
            this.menuOpenRecent,
            this.menuSave,
            this.menuSaveAs,
            this.menuSepFile1,
            this.menuExit});
            resources.ApplyResources(this.menuFile, "menuFile");
            this.menuFile.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuFile.Name = "menuFile";
            this.menuFile.Padding = new System.Windows.Forms.Padding(0);
            this.menuFile.DropDownOpening += new System.EventHandler(this.disableUseless1);
            // 
            // menuNew
            // 
            this.menuNew.Image = global::enVisioner.Properties.Resources.MDI_NEW;
            resources.ApplyResources(this.menuNew, "menuNew");
            this.menuNew.Name = "menuNew";
            this.menuNew.Padding = new System.Windows.Forms.Padding(0);
            this.menuNew.Click += new System.EventHandler(this.newVision);
            // 
            // menuOpen
            // 
            this.menuOpen.Image = global::enVisioner.Properties.Resources.MDI_OPEN;
            resources.ApplyResources(this.menuOpen, "menuOpen");
            this.menuOpen.Name = "menuOpen";
            this.menuOpen.Click += new System.EventHandler(this.fileLoad);
            // 
            // menuOpenRecent
            // 
            this.menuOpenRecent.Name = "menuOpenRecent";
            resources.ApplyResources(this.menuOpenRecent, "menuOpenRecent");
            // 
            // menuSave
            // 
            this.menuSave.Image = global::enVisioner.Properties.Resources.MDI_SAVE;
            resources.ApplyResources(this.menuSave, "menuSave");
            this.menuSave.Name = "menuSave";
            // 
            // menuSaveAs
            // 
            this.menuSaveAs.Name = "menuSaveAs";
            resources.ApplyResources(this.menuSaveAs, "menuSaveAs");
            // 
            // menuSepFile1
            // 
            this.menuSepFile1.Name = "menuSepFile1";
            resources.ApplyResources(this.menuSepFile1, "menuSepFile1");
            // 
            // menuExit
            // 
            this.menuExit.Image = global::enVisioner.Properties.Resources.MDI_DELETE;
            resources.ApplyResources(this.menuExit, "menuExit");
            this.menuExit.Name = "menuExit";
            this.menuExit.Click += new System.EventHandler(this.quitProg);
            // 
            // menuEdit
            // 
            this.menuEdit.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuUndo,
            this.menuRedo,
            this.menuEditSep1,
            this.menuCut,
            this.menuCopy,
            this.menuPaste});
            this.menuEdit.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuEdit.Name = "menuEdit";
            this.menuEdit.Padding = new System.Windows.Forms.Padding(0);
            resources.ApplyResources(this.menuEdit, "menuEdit");
            this.menuEdit.DropDownOpening += new System.EventHandler(this.disableUseless1);
            // 
            // menuUndo
            // 
            this.menuUndo.Image = global::enVisioner.Properties.Resources.MDI_UNDO;
            resources.ApplyResources(this.menuUndo, "menuUndo");
            this.menuUndo.Name = "menuUndo";
            // 
            // menuRedo
            // 
            this.menuRedo.Image = global::enVisioner.Properties.Resources.MDI_REDO;
            resources.ApplyResources(this.menuRedo, "menuRedo");
            this.menuRedo.Name = "menuRedo";
            // 
            // menuEditSep1
            // 
            this.menuEditSep1.Name = "menuEditSep1";
            resources.ApplyResources(this.menuEditSep1, "menuEditSep1");
            // 
            // menuCut
            // 
            this.menuCut.Image = global::enVisioner.Properties.Resources.MDI_CUT;
            resources.ApplyResources(this.menuCut, "menuCut");
            this.menuCut.Name = "menuCut";
            // 
            // menuCopy
            // 
            this.menuCopy.Image = global::enVisioner.Properties.Resources.MDI_COPY;
            resources.ApplyResources(this.menuCopy, "menuCopy");
            this.menuCopy.Name = "menuCopy";
            // 
            // menuPaste
            // 
            this.menuPaste.Image = global::enVisioner.Properties.Resources.MDI_PASTE;
            resources.ApplyResources(this.menuPaste, "menuPaste");
            this.menuPaste.Name = "menuPaste";
            // 
            // menuView
            // 
            this.menuView.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuView.Name = "menuView";
            this.menuView.Padding = new System.Windows.Forms.Padding(0);
            resources.ApplyResources(this.menuView, "menuView");
            // 
            // menuLevel
            // 
            this.menuLevel.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuObjSub,
            this.menuLink});
            this.menuLevel.Name = "menuLevel";
            resources.ApplyResources(this.menuLevel, "menuLevel");
            // 
            // menuObjSub
            // 
            this.menuObjSub.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuObjNewSub,
            this.menuObjProps,
            this.menuObjFind,
            this.menuObjDel});
            this.menuObjSub.Name = "menuObjSub";
            resources.ApplyResources(this.menuObjSub, "menuObjSub");
            // 
            // menuObjNewSub
            // 
            this.menuObjNewSub.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuObjNewItem,
            this.enemyToolStripMenuItem});
            this.menuObjNewSub.Image = global::enVisioner.Properties.Resources.MDI_newobj;
            resources.ApplyResources(this.menuObjNewSub, "menuObjNewSub");
            this.menuObjNewSub.Name = "menuObjNewSub";
            // 
            // menuObjNewItem
            // 
            this.menuObjNewItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuObjNewGem,
            this.menuObjNewStar,
            this.menuObjNew5G,
            this.menuNewObjHeal,
            this.menuObjNewKey,
            this.menuObjNewLife});
            this.menuObjNewItem.Name = "menuObjNewItem";
            resources.ApplyResources(this.menuObjNewItem, "menuObjNewItem");
            // 
            // menuObjNewGem
            // 
            this.menuObjNewGem.Image = global::enVisioner.Properties.Resources.spr_gem;
            resources.ApplyResources(this.menuObjNewGem, "menuObjNewGem");
            this.menuObjNewGem.Name = "menuObjNewGem";
            // 
            // menuObjNewStar
            // 
            this.menuObjNewStar.Image = global::enVisioner.Properties.Resources.spr_star;
            resources.ApplyResources(this.menuObjNewStar, "menuObjNewStar");
            this.menuObjNewStar.Name = "menuObjNewStar";
            // 
            // menuObjNew5G
            // 
            this.menuObjNew5G.Image = global::enVisioner.Properties.Resources.spr_5g;
            resources.ApplyResources(this.menuObjNew5G, "menuObjNew5G");
            this.menuObjNew5G.Name = "menuObjNew5G";
            // 
            // menuNewObjHeal
            // 
            this.menuNewObjHeal.Image = global::enVisioner.Properties.Resources.spr_heal;
            resources.ApplyResources(this.menuNewObjHeal, "menuNewObjHeal");
            this.menuNewObjHeal.Name = "menuNewObjHeal";
            // 
            // menuObjNewKey
            // 
            this.menuObjNewKey.Image = global::enVisioner.Properties.Resources.spr_key;
            resources.ApplyResources(this.menuObjNewKey, "menuObjNewKey");
            this.menuObjNewKey.Name = "menuObjNewKey";
            // 
            // menuObjNewLife
            // 
            this.menuObjNewLife.Image = global::enVisioner.Properties.Resources.spr_life;
            resources.ApplyResources(this.menuObjNewLife, "menuObjNewLife");
            this.menuObjNewLife.Name = "menuObjNewLife";
            // 
            // enemyToolStripMenuItem
            // 
            this.enemyToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mooToolStripMenuItem,
            this.flyingMooToolStripMenuItem,
            this.mooToolStripMenuItem1,
            this.propellerToolStripMenuItem,
            this.mineMooToolStripMenuItem,
            this.spikeCannonToolStripMenuItem,
            this.floatingBallToolStripMenuItem});
            this.enemyToolStripMenuItem.Name = "enemyToolStripMenuItem";
            resources.ApplyResources(this.enemyToolStripMenuItem, "enemyToolStripMenuItem");
            // 
            // mooToolStripMenuItem
            // 
            this.mooToolStripMenuItem.Image = global::enVisioner.Properties.Resources.spr_enemy;
            resources.ApplyResources(this.mooToolStripMenuItem, "mooToolStripMenuItem");
            this.mooToolStripMenuItem.Name = "mooToolStripMenuItem";
            // 
            // flyingMooToolStripMenuItem
            // 
            this.flyingMooToolStripMenuItem.Image = global::enVisioner.Properties.Resources.spr_enemy2;
            resources.ApplyResources(this.flyingMooToolStripMenuItem, "flyingMooToolStripMenuItem");
            this.flyingMooToolStripMenuItem.Name = "flyingMooToolStripMenuItem";
            // 
            // mooToolStripMenuItem1
            // 
            this.mooToolStripMenuItem1.Image = global::enVisioner.Properties.Resources.spr_enemy3;
            resources.ApplyResources(this.mooToolStripMenuItem1, "mooToolStripMenuItem1");
            this.mooToolStripMenuItem1.Name = "mooToolStripMenuItem1";
            // 
            // propellerToolStripMenuItem
            // 
            this.propellerToolStripMenuItem.Image = global::enVisioner.Properties.Resources.spr_enemy4;
            resources.ApplyResources(this.propellerToolStripMenuItem, "propellerToolStripMenuItem");
            this.propellerToolStripMenuItem.Name = "propellerToolStripMenuItem";
            // 
            // mineMooToolStripMenuItem
            // 
            this.mineMooToolStripMenuItem.Image = global::enVisioner.Properties.Resources.spr_enemy5;
            resources.ApplyResources(this.mineMooToolStripMenuItem, "mineMooToolStripMenuItem");
            this.mineMooToolStripMenuItem.Name = "mineMooToolStripMenuItem";
            // 
            // spikeCannonToolStripMenuItem
            // 
            this.spikeCannonToolStripMenuItem.Image = global::enVisioner.Properties.Resources.spr_enemy7;
            resources.ApplyResources(this.spikeCannonToolStripMenuItem, "spikeCannonToolStripMenuItem");
            this.spikeCannonToolStripMenuItem.Name = "spikeCannonToolStripMenuItem";
            // 
            // floatingBallToolStripMenuItem
            // 
            this.floatingBallToolStripMenuItem.Image = global::enVisioner.Properties.Resources.spr_enemy8;
            resources.ApplyResources(this.floatingBallToolStripMenuItem, "floatingBallToolStripMenuItem");
            this.floatingBallToolStripMenuItem.Name = "floatingBallToolStripMenuItem";
            // 
            // menuObjProps
            // 
            this.menuObjProps.Image = global::enVisioner.Properties.Resources.MDI_PROP;
            resources.ApplyResources(this.menuObjProps, "menuObjProps");
            this.menuObjProps.Name = "menuObjProps";
            // 
            // menuObjFind
            // 
            this.menuObjFind.Image = global::enVisioner.Properties.Resources.MDI_FIND;
            resources.ApplyResources(this.menuObjFind, "menuObjFind");
            this.menuObjFind.Name = "menuObjFind";
            // 
            // menuObjDel
            // 
            this.menuObjDel.Image = global::enVisioner.Properties.Resources.MDI_DELETE;
            resources.ApplyResources(this.menuObjDel, "menuObjDel");
            this.menuObjDel.Name = "menuObjDel";
            // 
            // menuLink
            // 
            this.menuLink.Image = global::enVisioner.Properties.Resources.MDI_LINK;
            resources.ApplyResources(this.menuLink, "menuLink");
            this.menuLink.Name = "menuLink";
            // 
            // menuWindows
            // 
            resources.ApplyResources(this.menuWindows, "menuWindows");
            this.menuWindows.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuWindows.Name = "menuWindows";
            this.menuWindows.Padding = new System.Windows.Forms.Padding(0);
            this.menuWindows.DropDownOpening += new System.EventHandler(this.getDocList);
            this.menuWindows.DropDownItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.swapWin);
            // 
            // menuHelp
            // 
            this.menuHelp.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem,
            this.guideToolStripMenuItem,
            this.langSwapTooltree});
            this.menuHelp.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuHelp.Name = "menuHelp";
            this.menuHelp.Padding = new System.Windows.Forms.Padding(0);
            resources.ApplyResources(this.menuHelp, "menuHelp");
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Image = global::enVisioner.Properties.Resources.MDI_INFOPAGE;
            resources.ApplyResources(this.aboutToolStripMenuItem, "aboutToolStripMenuItem");
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.showAbout);
            // 
            // guideToolStripMenuItem
            // 
            this.guideToolStripMenuItem.Image = global::enVisioner.Properties.Resources.MDI_BOOK;
            resources.ApplyResources(this.guideToolStripMenuItem, "guideToolStripMenuItem");
            this.guideToolStripMenuItem.Name = "guideToolStripMenuItem";
            this.guideToolStripMenuItem.Click += new System.EventHandler(this.showGuide);
            // 
            // langSwapTooltree
            // 
            this.langSwapTooltree.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.langSwapEng,
            this.langSwapJpn});
            this.langSwapTooltree.Name = "langSwapTooltree";
            resources.ApplyResources(this.langSwapTooltree, "langSwapTooltree");
            // 
            // langSwapEng
            // 
            this.langSwapEng.Checked = true;
            this.langSwapEng.CheckState = System.Windows.Forms.CheckState.Checked;
            this.langSwapEng.Image = global::enVisioner.Properties.Resources.MDI_FLAGUS;
            resources.ApplyResources(this.langSwapEng, "langSwapEng");
            this.langSwapEng.Name = "langSwapEng";
            this.langSwapEng.Click += new System.EventHandler(this.locSwitchEn);
            // 
            // langSwapJpn
            // 
            this.langSwapJpn.Image = global::enVisioner.Properties.Resources.MDI_FLAGJP;
            resources.ApplyResources(this.langSwapJpn, "langSwapJpn");
            this.langSwapJpn.Name = "langSwapJpn";
            this.langSwapJpn.Click += new System.EventHandler(this.locSwitchJp);
            // 
            // mainToolbar
            // 
            resources.ApplyResources(this.mainToolbar, "mainToolbar");
            this.mainToolbar.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.mainToolbar.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolNew,
            this.toolOpen,
            this.toolSave,
            this.toolSepFile,
            this.toolUndo,
            this.toolRedo,
            this.toolSepEdit,
            this.toolCut,
            this.toolCopy,
            this.toolPaste,
            this.toolSepObject,
            this.toolStripSeparator1,
            this.toolNewObj,
            this.toolObjProp,
            this.toolObjFind,
            this.toolLink,
            this.toolObjRemove,
            this.toolSepMisc,
            this.toolHelp});
            this.mainToolbar.Name = "mainToolbar";
            this.mainToolbar.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.mainToolbar.Stretch = true;
            // 
            // toolNew
            // 
            resources.ApplyResources(this.toolNew, "toolNew");
            this.toolNew.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolNew.Image = global::enVisioner.Properties.Resources.MDI_NEW;
            this.toolNew.Margin = new System.Windows.Forms.Padding(0);
            this.toolNew.Name = "toolNew";
            this.toolNew.Click += new System.EventHandler(this.newVision);
            // 
            // toolOpen
            // 
            resources.ApplyResources(this.toolOpen, "toolOpen");
            this.toolOpen.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolOpen.Image = global::enVisioner.Properties.Resources.MDI_OPEN;
            this.toolOpen.Margin = new System.Windows.Forms.Padding(0);
            this.toolOpen.Name = "toolOpen";
            this.toolOpen.Click += new System.EventHandler(this.fileLoad);
            // 
            // toolSave
            // 
            resources.ApplyResources(this.toolSave, "toolSave");
            this.toolSave.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolSave.Image = global::enVisioner.Properties.Resources.MDI_SAVE;
            this.toolSave.Margin = new System.Windows.Forms.Padding(0);
            this.toolSave.Name = "toolSave";
            // 
            // toolSepFile
            // 
            resources.ApplyResources(this.toolSepFile, "toolSepFile");
            this.toolSepFile.Name = "toolSepFile";
            // 
            // toolUndo
            // 
            resources.ApplyResources(this.toolUndo, "toolUndo");
            this.toolUndo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolUndo.Image = global::enVisioner.Properties.Resources.MDI_UNDO;
            this.toolUndo.Margin = new System.Windows.Forms.Padding(0);
            this.toolUndo.Name = "toolUndo";
            // 
            // toolRedo
            // 
            resources.ApplyResources(this.toolRedo, "toolRedo");
            this.toolRedo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolRedo.Image = global::enVisioner.Properties.Resources.MDI_REDO;
            this.toolRedo.Margin = new System.Windows.Forms.Padding(0);
            this.toolRedo.Name = "toolRedo";
            // 
            // toolSepEdit
            // 
            resources.ApplyResources(this.toolSepEdit, "toolSepEdit");
            this.toolSepEdit.Name = "toolSepEdit";
            // 
            // toolCut
            // 
            resources.ApplyResources(this.toolCut, "toolCut");
            this.toolCut.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolCut.Image = global::enVisioner.Properties.Resources.MDI_CUT;
            this.toolCut.Margin = new System.Windows.Forms.Padding(0);
            this.toolCut.Name = "toolCut";
            // 
            // toolCopy
            // 
            resources.ApplyResources(this.toolCopy, "toolCopy");
            this.toolCopy.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolCopy.Image = global::enVisioner.Properties.Resources.MDI_COPY;
            this.toolCopy.Margin = new System.Windows.Forms.Padding(0);
            this.toolCopy.Name = "toolCopy";
            // 
            // toolPaste
            // 
            resources.ApplyResources(this.toolPaste, "toolPaste");
            this.toolPaste.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolPaste.Image = global::enVisioner.Properties.Resources.MDI_PASTE;
            this.toolPaste.Margin = new System.Windows.Forms.Padding(0);
            this.toolPaste.Name = "toolPaste";
            // 
            // toolSepObject
            // 
            resources.ApplyResources(this.toolSepObject, "toolSepObject");
            this.toolSepObject.Name = "toolSepObject";
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            resources.ApplyResources(this.toolStripSeparator1, "toolStripSeparator1");
            // 
            // toolNewObj
            // 
            resources.ApplyResources(this.toolNewObj, "toolNewObj");
            this.toolNewObj.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolNewObj.Image = global::enVisioner.Properties.Resources.MDI_newobj;
            this.toolNewObj.Margin = new System.Windows.Forms.Padding(0);
            this.toolNewObj.Name = "toolNewObj";
            this.toolNewObj.Click += new System.EventHandler(this.newObjBtn);
            // 
            // toolObjProp
            // 
            resources.ApplyResources(this.toolObjProp, "toolObjProp");
            this.toolObjProp.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolObjProp.Image = global::enVisioner.Properties.Resources.MDI_PROP;
            this.toolObjProp.Margin = new System.Windows.Forms.Padding(0);
            this.toolObjProp.Name = "toolObjProp";
            // 
            // toolObjFind
            // 
            resources.ApplyResources(this.toolObjFind, "toolObjFind");
            this.toolObjFind.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolObjFind.Image = global::enVisioner.Properties.Resources.MDI_FIND;
            this.toolObjFind.Margin = new System.Windows.Forms.Padding(0);
            this.toolObjFind.Name = "toolObjFind";
            // 
            // toolLink
            // 
            resources.ApplyResources(this.toolLink, "toolLink");
            this.toolLink.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolLink.Image = global::enVisioner.Properties.Resources.MDI_LINK;
            this.toolLink.Name = "toolLink";
            // 
            // toolObjRemove
            // 
            resources.ApplyResources(this.toolObjRemove, "toolObjRemove");
            this.toolObjRemove.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolObjRemove.Image = global::enVisioner.Properties.Resources.MDI_DELETE;
            this.toolObjRemove.Margin = new System.Windows.Forms.Padding(0);
            this.toolObjRemove.Name = "toolObjRemove";
            // 
            // toolSepMisc
            // 
            resources.ApplyResources(this.toolSepMisc, "toolSepMisc");
            this.toolSepMisc.Name = "toolSepMisc";
            // 
            // toolHelp
            // 
            resources.ApplyResources(this.toolHelp, "toolHelp");
            this.toolHelp.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolHelp.Image = global::enVisioner.Properties.Resources.MDI_HELP;
            this.toolHelp.Margin = new System.Windows.Forms.Padding(0);
            this.toolHelp.Name = "toolHelp";
            this.toolHelp.Click += new System.EventHandler(this.showGuide);
            // 
            // statusBar
            // 
            this.statusBar.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolLoadProg,
            this.toolLoadText,
            this.statusSep1});
            resources.ApplyResources(this.statusBar, "statusBar");
            this.statusBar.Name = "statusBar";
            // 
            // toolLoadProg
            // 
            this.toolLoadProg.Maximum = 1;
            this.toolLoadProg.Name = "toolLoadProg";
            resources.ApplyResources(this.toolLoadProg, "toolLoadProg");
            this.toolLoadProg.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            // 
            // toolLoadText
            // 
            resources.ApplyResources(this.toolLoadText, "toolLoadText");
            this.toolLoadText.Name = "toolLoadText";
            // 
            // statusSep1
            // 
            this.statusSep1.Name = "statusSep1";
            resources.ApplyResources(this.statusSep1, "statusSep1");
            // 
            // fileDiagOpen
            // 
            this.fileDiagOpen.DefaultExt = "klo";
            resources.ApplyResources(this.fileDiagOpen, "fileDiagOpen");
            this.fileDiagOpen.Multiselect = true;
            this.fileDiagOpen.RestoreDirectory = true;
            // 
            // fileDiagSave
            // 
            this.fileDiagSave.DefaultExt = "klo";
            resources.ApplyResources(this.fileDiagSave, "fileDiagSave");
            this.fileDiagSave.RestoreDirectory = true;
            // 
            // commonUpdater
            // 
            this.commonUpdater.Enabled = true;
            this.commonUpdater.Interval = 13;
            this.commonUpdater.Tick += new System.EventHandler(this.commonTick);
            // 
            // manager
            // 
            this.AllowDrop = true;
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.statusBar);
            this.Controls.Add(this.mainToolbar);
            this.Controls.Add(this.mainMenu);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.mainMenu;
            this.Name = "manager";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.attemptClose);
            this.LocationChanged += new System.EventHandler(this.updateWinSettings);
            this.SizeChanged += new System.EventHandler(this.updateWinSettings);
            this.mainMenu.ResumeLayout(false);
            this.mainMenu.PerformLayout();
            this.mainToolbar.ResumeLayout(false);
            this.mainToolbar.PerformLayout();
            this.statusBar.ResumeLayout(false);
            this.statusBar.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip mainMenu;
        private System.Windows.Forms.ToolStrip mainToolbar;
        private System.Windows.Forms.ToolStripMenuItem menuFile;
        private System.Windows.Forms.ToolStripMenuItem menuEdit;
        private System.Windows.Forms.ToolStripMenuItem menuView;
        private System.Windows.Forms.ToolStripButton toolNew;
        private System.Windows.Forms.ToolStripButton toolOpen;
        private System.Windows.Forms.ToolStripButton toolSave;
        private System.Windows.Forms.ToolStripSeparator toolSepFile;
        private System.Windows.Forms.ToolStripButton toolUndo;
        private System.Windows.Forms.ToolStripButton toolRedo;
        private System.Windows.Forms.ToolStripSeparator toolSepEdit;
        private System.Windows.Forms.ToolStripButton toolCut;
        private System.Windows.Forms.ToolStripButton toolCopy;
        private System.Windows.Forms.ToolStripButton toolPaste;
        private System.Windows.Forms.StatusStrip statusBar;
        private System.Windows.Forms.ToolStripProgressBar toolLoadProg;
        private System.Windows.Forms.ToolStripSeparator toolSepObject;
        private System.Windows.Forms.ToolStripButton toolObjProp;
        private System.Windows.Forms.ToolStripButton toolObjFind;
        private System.Windows.Forms.ToolStripButton toolObjRemove;
        private System.Windows.Forms.ToolStripSeparator toolSepMisc;
        private System.Windows.Forms.ToolStripButton toolHelp;
        private System.Windows.Forms.ToolStripButton toolNewObj;
        private System.Windows.Forms.ToolStripStatusLabel toolLoadText;
        private System.Windows.Forms.ToolStripMenuItem menuHelp;
        private System.Windows.Forms.ToolStripMenuItem menuNew;
        private System.Windows.Forms.ToolStripMenuItem menuOpen;
        private System.Windows.Forms.ToolStripMenuItem menuSave;
        private System.Windows.Forms.ToolStripMenuItem menuSaveAs;
        private System.Windows.Forms.ToolStripSeparator menuSepFile1;
        private System.Windows.Forms.ToolStripMenuItem menuUndo;
        private System.Windows.Forms.ToolStripMenuItem menuRedo;
        private System.Windows.Forms.ToolStripSeparator menuEditSep1;
        private System.Windows.Forms.ToolStripMenuItem menuCut;
        private System.Windows.Forms.ToolStripMenuItem menuCopy;
        private System.Windows.Forms.ToolStripMenuItem menuPaste;
        private System.Windows.Forms.ToolStripMenuItem menuOpenRecent;
        private System.Windows.Forms.ToolStripMenuItem menuExit;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem guideToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem menuWindows;
        private System.Windows.Forms.OpenFileDialog fileDiagOpen;
        private System.Windows.Forms.SaveFileDialog fileDiagSave;
        private System.Windows.Forms.Timer commonUpdater;
        private System.Windows.Forms.ToolStripStatusLabel statusSep1;
        private System.Windows.Forms.ToolStripButton toolLink;
        private System.Windows.Forms.ToolStripMenuItem menuLevel;
        private System.Windows.Forms.ToolStripMenuItem menuObjSub;
        private System.Windows.Forms.ToolStripMenuItem menuObjNewSub;
        private System.Windows.Forms.ToolStripMenuItem menuObjProps;
        private System.Windows.Forms.ToolStripMenuItem menuObjFind;
        private System.Windows.Forms.ToolStripMenuItem menuObjDel;
        private System.Windows.Forms.ToolStripMenuItem menuLink;
        private System.Windows.Forms.ToolStripMenuItem menuObjNewItem;
        private System.Windows.Forms.ToolStripMenuItem menuObjNewGem;
        private System.Windows.Forms.ToolStripMenuItem menuObjNewStar;
        private System.Windows.Forms.ToolStripMenuItem menuObjNew5G;
        private System.Windows.Forms.ToolStripMenuItem menuNewObjHeal;
        private System.Windows.Forms.ToolStripMenuItem menuObjNewKey;
        private System.Windows.Forms.ToolStripMenuItem menuObjNewLife;
        private System.Windows.Forms.ToolStripMenuItem enemyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mooToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem flyingMooToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mooToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem propellerToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mineMooToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem spikeCannonToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem floatingBallToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem langSwapTooltree;
        private System.Windows.Forms.ToolStripMenuItem langSwapEng;
        private System.Windows.Forms.ToolStripMenuItem langSwapJpn;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
    }
}

