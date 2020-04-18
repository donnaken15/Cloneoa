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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(manager));
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.menuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.menuOpenRecent = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSaveAs = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSepFile1 = new System.Windows.Forms.ToolStripSeparator();
            this.menuEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.menuEditSep1 = new System.Windows.Forms.ToolStripSeparator();
            this.menuView = new System.Windows.Forms.ToolStripMenuItem();
            this.menuWindows = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mainToolbar = new System.Windows.Forms.ToolStrip();
            this.toolSepFile = new System.Windows.Forms.ToolStripSeparator();
            this.toolSepEdit = new System.Windows.Forms.ToolStripSeparator();
            this.toolSepObject = new System.Windows.Forms.ToolStripSeparator();
            this.toolSepMisc = new System.Windows.Forms.ToolStripSeparator();
            this.statusBar = new System.Windows.Forms.StatusStrip();
            this.toolLoadProg = new System.Windows.Forms.ToolStripProgressBar();
            this.toolLoadText = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolNew = new System.Windows.Forms.ToolStripButton();
            this.toolOpen = new System.Windows.Forms.ToolStripButton();
            this.toolSave = new System.Windows.Forms.ToolStripButton();
            this.toolUndo = new System.Windows.Forms.ToolStripButton();
            this.toolRedo = new System.Windows.Forms.ToolStripButton();
            this.toolCut = new System.Windows.Forms.ToolStripButton();
            this.toolCopy = new System.Windows.Forms.ToolStripButton();
            this.toolPaste = new System.Windows.Forms.ToolStripButton();
            this.toolNewObj = new System.Windows.Forms.ToolStripButton();
            this.toolObjProp = new System.Windows.Forms.ToolStripButton();
            this.toolObjFind = new System.Windows.Forms.ToolStripButton();
            this.toolObjRemove = new System.Windows.Forms.ToolStripButton();
            this.toolHelp = new System.Windows.Forms.ToolStripButton();
            this.menuNew = new System.Windows.Forms.ToolStripMenuItem();
            this.menuOpen = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSave = new System.Windows.Forms.ToolStripMenuItem();
            this.menuExit = new System.Windows.Forms.ToolStripMenuItem();
            this.menuUndo = new System.Windows.Forms.ToolStripMenuItem();
            this.menuRedo = new System.Windows.Forms.ToolStripMenuItem();
            this.menuCut = new System.Windows.Forms.ToolStripMenuItem();
            this.menuCopy = new System.Windows.Forms.ToolStripMenuItem();
            this.menuPaste = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.guideToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mainMenu.SuspendLayout();
            this.mainToolbar.SuspendLayout();
            this.statusBar.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainMenu
            // 
            this.mainMenu.AutoSize = false;
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuFile,
            this.menuEdit,
            this.menuView,
            this.menuWindows,
            this.helpToolStripMenuItem});
            this.mainMenu.Location = new System.Drawing.Point(0, 0);
            this.mainMenu.Name = "mainMenu";
            this.mainMenu.Padding = new System.Windows.Forms.Padding(2, 2, 2, 5);
            this.mainMenu.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.mainMenu.Size = new System.Drawing.Size(792, 28);
            this.mainMenu.TabIndex = 1;
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
            this.menuFile.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuFile.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuFile.Name = "menuFile";
            this.menuFile.Padding = new System.Windows.Forms.Padding(0);
            this.menuFile.Size = new System.Drawing.Size(35, 23);
            this.menuFile.Text = "File";
            this.menuFile.DropDownOpening += new System.EventHandler(this.disableUseless1);
            // 
            // menuOpenRecent
            // 
            this.menuOpenRecent.Name = "menuOpenRecent";
            this.menuOpenRecent.ShortcutKeyDisplayString = "Alt+F+R+...";
            this.menuOpenRecent.Size = new System.Drawing.Size(237, 24);
            this.menuOpenRecent.Text = "Recent Files";
            // 
            // menuSaveAs
            // 
            this.menuSaveAs.Name = "menuSaveAs";
            this.menuSaveAs.ShortcutKeyDisplayString = "Ctrl+Shift+S";
            this.menuSaveAs.Size = new System.Drawing.Size(237, 24);
            this.menuSaveAs.Text = "Save As...";
            // 
            // menuSepFile1
            // 
            this.menuSepFile1.Name = "menuSepFile1";
            this.menuSepFile1.Size = new System.Drawing.Size(234, 6);
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
            this.menuEdit.Size = new System.Drawing.Size(37, 23);
            this.menuEdit.Text = "Edit";
            this.menuEdit.DropDownOpening += new System.EventHandler(this.disableUseless1);
            // 
            // menuEditSep1
            // 
            this.menuEditSep1.Name = "menuEditSep1";
            this.menuEditSep1.Size = new System.Drawing.Size(161, 6);
            // 
            // menuView
            // 
            this.menuView.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuView.Name = "menuView";
            this.menuView.Padding = new System.Windows.Forms.Padding(0);
            this.menuView.Size = new System.Drawing.Size(44, 23);
            this.menuView.Text = "View";
            // 
            // menuWindows
            // 
            this.menuWindows.Enabled = false;
            this.menuWindows.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.menuWindows.Name = "menuWindows";
            this.menuWindows.Padding = new System.Windows.Forms.Padding(0);
            this.menuWindows.Size = new System.Drawing.Size(70, 23);
            this.menuWindows.Text = "Windows";
            this.menuWindows.DropDownOpening += new System.EventHandler(this.getDocList);
            this.menuWindows.DropDownItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.swapWin);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem,
            this.guideToolStripMenuItem});
            this.helpToolStripMenuItem.Margin = new System.Windows.Forms.Padding(0, 0, 0, -2);
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Padding = new System.Windows.Forms.Padding(0);
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(42, 23);
            this.helpToolStripMenuItem.Text = "Help";
            // 
            // mainToolbar
            // 
            this.mainToolbar.AutoSize = false;
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
            this.toolNewObj,
            this.toolObjProp,
            this.toolObjFind,
            this.toolObjRemove,
            this.toolSepMisc,
            this.toolHelp});
            this.mainToolbar.Location = new System.Drawing.Point(0, 28);
            this.mainToolbar.Name = "mainToolbar";
            this.mainToolbar.Padding = new System.Windows.Forms.Padding(0, 0, 0, 3);
            this.mainToolbar.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.mainToolbar.Size = new System.Drawing.Size(792, 22);
            this.mainToolbar.Stretch = true;
            this.mainToolbar.TabIndex = 2;
            // 
            // toolSepFile
            // 
            this.toolSepFile.AutoSize = false;
            this.toolSepFile.Name = "toolSepFile";
            this.toolSepFile.Size = new System.Drawing.Size(3, 19);
            // 
            // toolSepEdit
            // 
            this.toolSepEdit.AutoSize = false;
            this.toolSepEdit.Name = "toolSepEdit";
            this.toolSepEdit.Size = new System.Drawing.Size(3, 19);
            // 
            // toolSepObject
            // 
            this.toolSepObject.AutoSize = false;
            this.toolSepObject.Name = "toolSepObject";
            this.toolSepObject.Size = new System.Drawing.Size(3, 19);
            // 
            // toolSepMisc
            // 
            this.toolSepMisc.AutoSize = false;
            this.toolSepMisc.Name = "toolSepMisc";
            this.toolSepMisc.Size = new System.Drawing.Size(3, 19);
            // 
            // statusBar
            // 
            this.statusBar.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolLoadProg,
            this.toolLoadText});
            this.statusBar.Location = new System.Drawing.Point(0, 660);
            this.statusBar.Name = "statusBar";
            this.statusBar.Size = new System.Drawing.Size(792, 24);
            this.statusBar.TabIndex = 3;
            // 
            // toolLoadProg
            // 
            this.toolLoadProg.Name = "toolLoadProg";
            this.toolLoadProg.Size = new System.Drawing.Size(100, 18);
            // 
            // toolLoadText
            // 
            this.toolLoadText.AutoSize = false;
            this.toolLoadText.Name = "toolLoadText";
            this.toolLoadText.Size = new System.Drawing.Size(100, 19);
            this.toolLoadText.Text = "Ready";
            this.toolLoadText.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // toolNew
            // 
            this.toolNew.AutoSize = false;
            this.toolNew.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolNew.Image = global::enVisioner.Properties.Resources.NEW;
            this.toolNew.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolNew.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolNew.Margin = new System.Windows.Forms.Padding(0);
            this.toolNew.Name = "toolNew";
            this.toolNew.Size = new System.Drawing.Size(20, 20);
            this.toolNew.ToolTipText = "New Level";
            this.toolNew.Click += new System.EventHandler(this.newVision);
            // 
            // toolOpen
            // 
            this.toolOpen.AutoSize = false;
            this.toolOpen.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolOpen.Image = global::enVisioner.Properties.Resources.OPEN;
            this.toolOpen.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolOpen.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolOpen.Margin = new System.Windows.Forms.Padding(0);
            this.toolOpen.Name = "toolOpen";
            this.toolOpen.Size = new System.Drawing.Size(20, 20);
            this.toolOpen.ToolTipText = "Open File";
            // 
            // toolSave
            // 
            this.toolSave.AutoSize = false;
            this.toolSave.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolSave.Enabled = false;
            this.toolSave.Image = global::enVisioner.Properties.Resources.SAVE;
            this.toolSave.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolSave.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolSave.Margin = new System.Windows.Forms.Padding(0);
            this.toolSave.Name = "toolSave";
            this.toolSave.Size = new System.Drawing.Size(20, 20);
            this.toolSave.ToolTipText = "Save File";
            // 
            // toolUndo
            // 
            this.toolUndo.AutoSize = false;
            this.toolUndo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolUndo.Enabled = false;
            this.toolUndo.Image = global::enVisioner.Properties.Resources.UNDO;
            this.toolUndo.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolUndo.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolUndo.Margin = new System.Windows.Forms.Padding(0);
            this.toolUndo.Name = "toolUndo";
            this.toolUndo.Size = new System.Drawing.Size(20, 20);
            this.toolUndo.ToolTipText = "Undo";
            // 
            // toolRedo
            // 
            this.toolRedo.AutoSize = false;
            this.toolRedo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolRedo.Enabled = false;
            this.toolRedo.Image = global::enVisioner.Properties.Resources.REDO;
            this.toolRedo.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolRedo.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolRedo.Margin = new System.Windows.Forms.Padding(0);
            this.toolRedo.Name = "toolRedo";
            this.toolRedo.Size = new System.Drawing.Size(20, 20);
            this.toolRedo.Text = "Redo";
            // 
            // toolCut
            // 
            this.toolCut.AutoSize = false;
            this.toolCut.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolCut.Enabled = false;
            this.toolCut.Image = global::enVisioner.Properties.Resources.CUT;
            this.toolCut.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolCut.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolCut.Margin = new System.Windows.Forms.Padding(0);
            this.toolCut.Name = "toolCut";
            this.toolCut.Size = new System.Drawing.Size(20, 20);
            this.toolCut.Text = "Cut";
            // 
            // toolCopy
            // 
            this.toolCopy.AutoSize = false;
            this.toolCopy.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolCopy.Enabled = false;
            this.toolCopy.Image = global::enVisioner.Properties.Resources.COPY;
            this.toolCopy.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolCopy.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolCopy.Margin = new System.Windows.Forms.Padding(0);
            this.toolCopy.Name = "toolCopy";
            this.toolCopy.Size = new System.Drawing.Size(20, 20);
            this.toolCopy.Text = "Copy";
            // 
            // toolPaste
            // 
            this.toolPaste.AutoSize = false;
            this.toolPaste.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolPaste.Enabled = false;
            this.toolPaste.Image = global::enVisioner.Properties.Resources.PASTE;
            this.toolPaste.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolPaste.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolPaste.Margin = new System.Windows.Forms.Padding(0);
            this.toolPaste.Name = "toolPaste";
            this.toolPaste.Size = new System.Drawing.Size(20, 20);
            this.toolPaste.Text = "Paste";
            // 
            // toolNewObj
            // 
            this.toolNewObj.AutoSize = false;
            this.toolNewObj.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolNewObj.Enabled = false;
            this.toolNewObj.Image = global::enVisioner.Properties.Resources.newobj;
            this.toolNewObj.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolNewObj.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolNewObj.Margin = new System.Windows.Forms.Padding(0);
            this.toolNewObj.Name = "toolNewObj";
            this.toolNewObj.Size = new System.Drawing.Size(20, 20);
            this.toolNewObj.Text = "New Object";
            // 
            // toolObjProp
            // 
            this.toolObjProp.AutoSize = false;
            this.toolObjProp.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolObjProp.Enabled = false;
            this.toolObjProp.Image = global::enVisioner.Properties.Resources.PROP;
            this.toolObjProp.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolObjProp.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolObjProp.Margin = new System.Windows.Forms.Padding(0);
            this.toolObjProp.Name = "toolObjProp";
            this.toolObjProp.Size = new System.Drawing.Size(20, 20);
            this.toolObjProp.Text = "Object Properties";
            // 
            // toolObjFind
            // 
            this.toolObjFind.AutoSize = false;
            this.toolObjFind.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolObjFind.Enabled = false;
            this.toolObjFind.Image = global::enVisioner.Properties.Resources.FIND;
            this.toolObjFind.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolObjFind.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolObjFind.Margin = new System.Windows.Forms.Padding(0);
            this.toolObjFind.Name = "toolObjFind";
            this.toolObjFind.Size = new System.Drawing.Size(20, 20);
            this.toolObjFind.Text = "Find Object";
            // 
            // toolObjRemove
            // 
            this.toolObjRemove.AutoSize = false;
            this.toolObjRemove.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolObjRemove.Enabled = false;
            this.toolObjRemove.Image = global::enVisioner.Properties.Resources.DELETE;
            this.toolObjRemove.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolObjRemove.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolObjRemove.Margin = new System.Windows.Forms.Padding(0);
            this.toolObjRemove.Name = "toolObjRemove";
            this.toolObjRemove.Size = new System.Drawing.Size(20, 20);
            // 
            // toolHelp
            // 
            this.toolHelp.AutoSize = false;
            this.toolHelp.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolHelp.Image = global::enVisioner.Properties.Resources.HELP;
            this.toolHelp.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolHelp.ImageTransparentColor = System.Drawing.Color.Silver;
            this.toolHelp.Margin = new System.Windows.Forms.Padding(0);
            this.toolHelp.Name = "toolHelp";
            this.toolHelp.Size = new System.Drawing.Size(20, 20);
            this.toolHelp.Text = "Help";
            this.toolHelp.ToolTipText = "Help";
            this.toolHelp.Click += new System.EventHandler(this.showAbout);
            // 
            // menuNew
            // 
            this.menuNew.Image = global::enVisioner.Properties.Resources.NEW;
            this.menuNew.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuNew.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuNew.Name = "menuNew";
            this.menuNew.Padding = new System.Windows.Forms.Padding(0);
            this.menuNew.ShortcutKeyDisplayString = "Ctrl+N";
            this.menuNew.Size = new System.Drawing.Size(237, 22);
            this.menuNew.Text = "New";
            this.menuNew.Click += new System.EventHandler(this.newVision);
            // 
            // menuOpen
            // 
            this.menuOpen.Image = global::enVisioner.Properties.Resources.OPEN;
            this.menuOpen.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuOpen.Name = "menuOpen";
            this.menuOpen.ShortcutKeyDisplayString = "Ctrl+O";
            this.menuOpen.Size = new System.Drawing.Size(237, 24);
            this.menuOpen.Text = "Open";
            // 
            // menuSave
            // 
            this.menuSave.Image = global::enVisioner.Properties.Resources.SAVE;
            this.menuSave.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuSave.Name = "menuSave";
            this.menuSave.ShortcutKeyDisplayString = "Ctrl+S";
            this.menuSave.Size = new System.Drawing.Size(237, 24);
            this.menuSave.Text = "Save";
            // 
            // menuExit
            // 
            this.menuExit.Image = global::enVisioner.Properties.Resources.DELETE;
            this.menuExit.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuExit.Name = "menuExit";
            this.menuExit.Size = new System.Drawing.Size(237, 24);
            this.menuExit.Text = "Exit";
            this.menuExit.Click += new System.EventHandler(this.quitProg);
            // 
            // menuUndo
            // 
            this.menuUndo.Image = global::enVisioner.Properties.Resources.UNDO;
            this.menuUndo.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuUndo.Name = "menuUndo";
            this.menuUndo.ShortcutKeyDisplayString = "Ctrl+Z";
            this.menuUndo.Size = new System.Drawing.Size(164, 24);
            this.menuUndo.Text = "Undo";
            // 
            // menuRedo
            // 
            this.menuRedo.Image = global::enVisioner.Properties.Resources.REDO;
            this.menuRedo.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuRedo.Name = "menuRedo";
            this.menuRedo.ShortcutKeyDisplayString = "Ctrl+Y";
            this.menuRedo.Size = new System.Drawing.Size(164, 24);
            this.menuRedo.Text = "Redo";
            // 
            // menuCut
            // 
            this.menuCut.Image = global::enVisioner.Properties.Resources.CUT;
            this.menuCut.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuCut.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuCut.Name = "menuCut";
            this.menuCut.ShortcutKeyDisplayString = "Ctrl+X";
            this.menuCut.Size = new System.Drawing.Size(164, 24);
            this.menuCut.Text = "Cut";
            // 
            // menuCopy
            // 
            this.menuCopy.Image = global::enVisioner.Properties.Resources.COPY;
            this.menuCopy.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuCopy.Name = "menuCopy";
            this.menuCopy.ShortcutKeyDisplayString = "Ctrl+C";
            this.menuCopy.Size = new System.Drawing.Size(164, 24);
            this.menuCopy.Text = "Copy";
            // 
            // menuPaste
            // 
            this.menuPaste.Image = global::enVisioner.Properties.Resources.PASTE;
            this.menuPaste.ImageTransparentColor = System.Drawing.Color.Silver;
            this.menuPaste.Name = "menuPaste";
            this.menuPaste.ShortcutKeyDisplayString = "Ctrl+V";
            this.menuPaste.Size = new System.Drawing.Size(164, 24);
            this.menuPaste.Text = "Paste";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Image = global::enVisioner.Properties.Resources.hh11;
            this.aboutToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.ShortcutKeyDisplayString = "F9";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(152, 24);
            this.aboutToolStripMenuItem.Text = "About";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.showAbout);
            // 
            // guideToolStripMenuItem
            // 
            this.guideToolStripMenuItem.Image = global::enVisioner.Properties.Resources.hh0;
            this.guideToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.guideToolStripMenuItem.Name = "guideToolStripMenuItem";
            this.guideToolStripMenuItem.ShortcutKeyDisplayString = "F10";
            this.guideToolStripMenuItem.Size = new System.Drawing.Size(152, 24);
            this.guideToolStripMenuItem.Text = "Guide";
            // 
            // manager
            // 
            this.AllowDrop = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(792, 684);
            this.Controls.Add(this.statusBar);
            this.Controls.Add(this.mainToolbar);
            this.Controls.Add(this.mainMenu);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.mainMenu;
            this.Name = "manager";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "enViSiONer_v0.04";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.attemptClose);
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
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
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
    }
}

