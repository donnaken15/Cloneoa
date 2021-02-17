namespace enVisioner
{
    partial class editing
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
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("Level (0x00)");
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(editing));
            this.editorLC = new System.Windows.Forms.SplitContainer();
            this.editorLeft = new System.Windows.Forms.SplitContainer();
            this.objlabel = new System.Windows.Forms.Label();
            this.objlister = new System.Windows.Forms.TreeView();
            this.ctxtObjSel = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.insertObjectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.removeObjectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.propertiesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.jumpToToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.props_hexedit = new System.Windows.Forms.TabControl();
            this.propEditWrap = new System.Windows.Forms.TabPage();
            this.objectEditorPanel = new System.Windows.Forms.PropertyGrid();
            this.rawedit = new System.Windows.Forms.TabPage();
            this.textwrapper = new System.Windows.Forms.Panel();
            this.hextext = new System.Windows.Forms.TextBox();
            this.hexaddrlabels = new System.Windows.Forms.Label();
            this.hexlabelkey = new System.Windows.Forms.Label();
            this.editorCR = new System.Windows.Forms.SplitContainer();
            this.editTest1 = new enVisioner.components.editTest();
            this.listView1 = new System.Windows.Forms.ListView();
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.editorLC.Panel1.SuspendLayout();
            this.editorLC.Panel2.SuspendLayout();
            this.editorLC.SuspendLayout();
            this.editorLeft.Panel1.SuspendLayout();
            this.editorLeft.Panel2.SuspendLayout();
            this.editorLeft.SuspendLayout();
            this.ctxtObjSel.SuspendLayout();
            this.props_hexedit.SuspendLayout();
            this.propEditWrap.SuspendLayout();
            this.rawedit.SuspendLayout();
            this.textwrapper.SuspendLayout();
            this.editorCR.Panel1.SuspendLayout();
            this.editorCR.Panel2.SuspendLayout();
            this.editorCR.SuspendLayout();
            this.SuspendLayout();
            // 
            // editorLC
            // 
            this.editorLC.Dock = System.Windows.Forms.DockStyle.Fill;
            this.editorLC.Location = new System.Drawing.Point(0, 0);
            this.editorLC.Name = "editorLC";
            // 
            // editorLC.Panel1
            // 
            this.editorLC.Panel1.Controls.Add(this.editorLeft);
            // 
            // editorLC.Panel2
            // 
            this.editorLC.Panel2.Controls.Add(this.editorCR);
            this.editorLC.Size = new System.Drawing.Size(625, 432);
            this.editorLC.SplitterDistance = 133;
            this.editorLC.TabIndex = 0;
            // 
            // editorLeft
            // 
            this.editorLeft.Dock = System.Windows.Forms.DockStyle.Fill;
            this.editorLeft.Location = new System.Drawing.Point(0, 0);
            this.editorLeft.Name = "editorLeft";
            this.editorLeft.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // editorLeft.Panel1
            // 
            this.editorLeft.Panel1.Controls.Add(this.objlabel);
            this.editorLeft.Panel1.Controls.Add(this.objlister);
            // 
            // editorLeft.Panel2
            // 
            this.editorLeft.Panel2.Controls.Add(this.props_hexedit);
            this.editorLeft.Size = new System.Drawing.Size(133, 432);
            this.editorLeft.SplitterDistance = 187;
            this.editorLeft.SplitterWidth = 2;
            this.editorLeft.TabIndex = 6;
            // 
            // objlabel
            // 
            this.objlabel.Dock = System.Windows.Forms.DockStyle.Top;
            this.objlabel.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.objlabel.Location = new System.Drawing.Point(0, 0);
            this.objlabel.Name = "objlabel";
            this.objlabel.Size = new System.Drawing.Size(133, 13);
            this.objlabel.TabIndex = 3;
            this.objlabel.Text = "Objects:";
            // 
            // objlister
            // 
            this.objlister.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.objlister.ContextMenuStrip = this.ctxtObjSel;
            this.objlister.Location = new System.Drawing.Point(3, 16);
            this.objlister.Name = "objlister";
            treeNode1.Name = "vision";
            treeNode1.Text = "Level (0x00)";
            this.objlister.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode1});
            this.objlister.ShowNodeToolTips = true;
            this.objlister.Size = new System.Drawing.Size(124, 168);
            this.objlister.TabIndex = 2;
            this.objlister.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.selectObj);
            // 
            // ctxtObjSel
            // 
            this.ctxtObjSel.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.insertObjectToolStripMenuItem,
            this.removeObjectToolStripMenuItem,
            this.toolStripSeparator1,
            this.propertiesToolStripMenuItem,
            this.jumpToToolStripMenuItem});
            this.ctxtObjSel.Name = "ctxtObjSel";
            this.ctxtObjSel.Size = new System.Drawing.Size(175, 106);
            // 
            // insertObjectToolStripMenuItem
            // 
            this.insertObjectToolStripMenuItem.Name = "insertObjectToolStripMenuItem";
            this.insertObjectToolStripMenuItem.Size = new System.Drawing.Size(174, 24);
            this.insertObjectToolStripMenuItem.Text = "Insert Object";
            // 
            // removeObjectToolStripMenuItem
            // 
            this.removeObjectToolStripMenuItem.Name = "removeObjectToolStripMenuItem";
            this.removeObjectToolStripMenuItem.Size = new System.Drawing.Size(174, 24);
            this.removeObjectToolStripMenuItem.Text = "Remove Object";
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(171, 6);
            // 
            // propertiesToolStripMenuItem
            // 
            this.propertiesToolStripMenuItem.Name = "propertiesToolStripMenuItem";
            this.propertiesToolStripMenuItem.Size = new System.Drawing.Size(174, 24);
            this.propertiesToolStripMenuItem.Text = "Properties";
            // 
            // jumpToToolStripMenuItem
            // 
            this.jumpToToolStripMenuItem.Name = "jumpToToolStripMenuItem";
            this.jumpToToolStripMenuItem.Size = new System.Drawing.Size(174, 24);
            this.jumpToToolStripMenuItem.Text = "Jump to...";
            // 
            // props_hexedit
            // 
            this.props_hexedit.Controls.Add(this.propEditWrap);
            this.props_hexedit.Controls.Add(this.rawedit);
            this.props_hexedit.Dock = System.Windows.Forms.DockStyle.Fill;
            this.props_hexedit.Location = new System.Drawing.Point(0, 0);
            this.props_hexedit.Name = "props_hexedit";
            this.props_hexedit.SelectedIndex = 0;
            this.props_hexedit.Size = new System.Drawing.Size(133, 243);
            this.props_hexedit.TabIndex = 0;
            // 
            // propEditWrap
            // 
            this.propEditWrap.Controls.Add(this.objectEditorPanel);
            this.propEditWrap.Location = new System.Drawing.Point(4, 22);
            this.propEditWrap.Name = "propEditWrap";
            this.propEditWrap.Padding = new System.Windows.Forms.Padding(3);
            this.propEditWrap.Size = new System.Drawing.Size(125, 217);
            this.propEditWrap.TabIndex = 0;
            this.propEditWrap.Text = "Properties";
            this.propEditWrap.UseVisualStyleBackColor = true;
            // 
            // objectEditorPanel
            // 
            this.objectEditorPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.objectEditorPanel.Location = new System.Drawing.Point(3, 3);
            this.objectEditorPanel.Name = "objectEditorPanel";
            this.objectEditorPanel.Size = new System.Drawing.Size(119, 211);
            this.objectEditorPanel.TabIndex = 0;
            this.objectEditorPanel.PropertyValueChanged += new System.Windows.Forms.PropertyValueChangedEventHandler(this.changeByPropEdit);
            this.objectEditorPanel.Layout += new System.Windows.Forms.LayoutEventHandler(this.updatePropEdit);
            // 
            // rawedit
            // 
            this.rawedit.Controls.Add(this.textwrapper);
            this.rawedit.Controls.Add(this.hexaddrlabels);
            this.rawedit.Controls.Add(this.hexlabelkey);
            this.rawedit.Location = new System.Drawing.Point(4, 22);
            this.rawedit.Name = "rawedit";
            this.rawedit.Padding = new System.Windows.Forms.Padding(3);
            this.rawedit.Size = new System.Drawing.Size(125, 217);
            this.rawedit.TabIndex = 1;
            this.rawedit.Text = "Raw Data";
            this.rawedit.UseVisualStyleBackColor = true;
            this.rawedit.Paint += new System.Windows.Forms.PaintEventHandler(this.updateDataDisplay);
            // 
            // textwrapper
            // 
            this.textwrapper.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.textwrapper.BackColor = System.Drawing.SystemColors.Window;
            this.textwrapper.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.textwrapper.Controls.Add(this.hextext);
            this.textwrapper.Location = new System.Drawing.Point(38, 12);
            this.textwrapper.Name = "textwrapper";
            this.textwrapper.Size = new System.Drawing.Size(202, 198);
            this.textwrapper.TabIndex = 3;
            // 
            // hextext
            // 
            this.hextext.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.hextext.Dock = System.Windows.Forms.DockStyle.Fill;
            this.hextext.Font = new System.Drawing.Font("MS Gothic", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.hextext.Location = new System.Drawing.Point(0, 0);
            this.hextext.Margin = new System.Windows.Forms.Padding(0);
            this.hextext.MaxLength = 65535;
            this.hextext.Multiline = true;
            this.hextext.Name = "hextext";
            this.hextext.ReadOnly = true;
            this.hextext.Size = new System.Drawing.Size(198, 194);
            this.hextext.TabIndex = 1;
            this.hextext.Text = "00000000000000000000000000000000";
            this.hextext.WordWrap = false;
            this.hextext.TextChanged += new System.EventHandler(this.updateData);
            this.hextext.KeyDown += new System.Windows.Forms.KeyEventHandler(this.hextextKeys);
            this.hextext.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.hextextKeys);
            // 
            // hexaddrlabels
            // 
            this.hexaddrlabels.AutoSize = true;
            this.hexaddrlabels.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.hexaddrlabels.Font = new System.Drawing.Font("MS Gothic", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.hexaddrlabels.Location = new System.Drawing.Point(-3, 15);
            this.hexaddrlabels.Name = "hexaddrlabels";
            this.hexaddrlabels.Size = new System.Drawing.Size(41, 11);
            this.hexaddrlabels.TabIndex = 2;
            this.hexaddrlabels.Text = "000000";
            this.hexaddrlabels.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // hexlabelkey
            // 
            this.hexlabelkey.AutoSize = true;
            this.hexlabelkey.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.hexlabelkey.Font = new System.Drawing.Font("MS Gothic", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.hexlabelkey.Location = new System.Drawing.Point(43, 1);
            this.hexlabelkey.Name = "hexlabelkey";
            this.hexlabelkey.Size = new System.Drawing.Size(197, 11);
            this.hexlabelkey.TabIndex = 0;
            this.hexlabelkey.Text = "000102030405060708090A0B0C0D0E0F";
            // 
            // editorCR
            // 
            this.editorCR.Dock = System.Windows.Forms.DockStyle.Fill;
            this.editorCR.Location = new System.Drawing.Point(0, 0);
            this.editorCR.Name = "editorCR";
            // 
            // editorCR.Panel1
            // 
            this.editorCR.Panel1.Controls.Add(this.editTest1);
            // 
            // editorCR.Panel2
            // 
            this.editorCR.Panel2.Controls.Add(this.listView1);
            this.editorCR.Size = new System.Drawing.Size(488, 432);
            this.editorCR.SplitterDistance = 318;
            this.editorCR.TabIndex = 0;
            // 
            // editTest1
            // 
            this.editTest1.Location = new System.Drawing.Point(35, 158);
            this.editTest1.Name = "editTest1";
            this.editTest1.Size = new System.Drawing.Size(150, 244);
            this.editTest1.TabIndex = 0;
            this.editTest1.Text = "editTest1";
            // 
            // listView1
            // 
            this.listView1.Location = new System.Drawing.Point(14, 123);
            this.listView1.Name = "listView1";
            this.listView1.Size = new System.Drawing.Size(121, 97);
            this.listView1.TabIndex = 0;
            this.listView1.UseCompatibleStateImageBehavior = false;
            // 
            // imageList1
            // 
            this.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit;
            this.imageList1.ImageSize = new System.Drawing.Size(16, 16);
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            // 
            // editing
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(625, 432);
            this.Controls.Add(this.editorLC);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "editing";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Tag = "k";
            this.Text = "<new file>";
            this.editorLC.Panel1.ResumeLayout(false);
            this.editorLC.Panel2.ResumeLayout(false);
            this.editorLC.ResumeLayout(false);
            this.editorLeft.Panel1.ResumeLayout(false);
            this.editorLeft.Panel2.ResumeLayout(false);
            this.editorLeft.ResumeLayout(false);
            this.ctxtObjSel.ResumeLayout(false);
            this.props_hexedit.ResumeLayout(false);
            this.propEditWrap.ResumeLayout(false);
            this.rawedit.ResumeLayout(false);
            this.rawedit.PerformLayout();
            this.textwrapper.ResumeLayout(false);
            this.textwrapper.PerformLayout();
            this.editorCR.Panel1.ResumeLayout(false);
            this.editorCR.Panel2.ResumeLayout(false);
            this.editorCR.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer editorLC;
        private System.Windows.Forms.SplitContainer editorCR;
        private System.Windows.Forms.SplitContainer editorLeft;
        private System.Windows.Forms.TreeView objlister;
        private System.Windows.Forms.PropertyGrid objectEditorPanel;
        private System.Windows.Forms.TabControl props_hexedit;
        private System.Windows.Forms.TabPage propEditWrap;
        private System.Windows.Forms.TabPage rawedit;
        private System.Windows.Forms.Label objlabel;
        private System.Windows.Forms.Label hexaddrlabels;
        private System.Windows.Forms.TextBox hextext;
        private System.Windows.Forms.Label hexlabelkey;
        private System.Windows.Forms.Panel textwrapper;
        private components.editTest editTest1;
        private System.Windows.Forms.ContextMenuStrip ctxtObjSel;
        private System.Windows.Forms.ToolStripMenuItem insertObjectToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem removeObjectToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem propertiesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem jumpToToolStripMenuItem;
        private System.Windows.Forms.ListView listView1;
        private System.Windows.Forms.ImageList imageList1;
    }
}
