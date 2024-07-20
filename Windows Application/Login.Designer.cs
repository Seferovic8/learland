
namespace Learland
{
    partial class Login
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.shapeContainer1 = new Microsoft.VisualBasic.PowerPacks.ShapeContainer();
            this.rectangleShape1 = new Microsoft.VisualBasic.PowerPacks.RectangleShape();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.minimize_box = new System.Windows.Forms.PictureBox();
            this.exit_box = new System.Windows.Forms.PictureBox();
            this.mail_panel = new System.Windows.Forms.Panel();
            this.email_textbox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.shapeContainer2 = new Microsoft.VisualBasic.PowerPacks.ShapeContainer();
            this.lineShape1 = new Microsoft.VisualBasic.PowerPacks.LineShape();
            this.password_panel = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.password_txtbox = new System.Windows.Forms.TextBox();
            this.shapeContainer3 = new Microsoft.VisualBasic.PowerPacks.ShapeContainer();
            this.lineShape2 = new Microsoft.VisualBasic.PowerPacks.LineShape();
            this.prijavise_btn = new Learland.RoundButton();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.minimize_box)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.exit_box)).BeginInit();
            this.mail_panel.SuspendLayout();
            this.password_panel.SuspendLayout();
            this.SuspendLayout();
            // 
            // shapeContainer1
            // 
            this.shapeContainer1.Location = new System.Drawing.Point(0, 0);
            this.shapeContainer1.Margin = new System.Windows.Forms.Padding(0);
            this.shapeContainer1.Name = "shapeContainer1";
            this.shapeContainer1.Shapes.AddRange(new Microsoft.VisualBasic.PowerPacks.Shape[] {
            this.rectangleShape1});
            this.shapeContainer1.Size = new System.Drawing.Size(1300, 700);
            this.shapeContainer1.TabIndex = 0;
            this.shapeContainer1.TabStop = false;
            // 
            // rectangleShape1
            // 
            this.rectangleShape1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.rectangleShape1.BackColor = System.Drawing.Color.White;
            this.rectangleShape1.BackStyle = Microsoft.VisualBasic.PowerPacks.BackStyle.Opaque;
            this.rectangleShape1.BorderColor = System.Drawing.Color.Transparent;
            this.rectangleShape1.Location = new System.Drawing.Point(0, 0);
            this.rectangleShape1.Name = "rectangleShape1";
            this.rectangleShape1.Size = new System.Drawing.Size(1300, 432);
            this.rectangleShape1.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Login_KeyDown);
            this.rectangleShape1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.login_MouseDown);
            this.rectangleShape1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.login_MouseMove);
            this.rectangleShape1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.login_MouseUp);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.White;
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Image = global::Learland.Properties.Resources.logooooo;
            this.pictureBox1.Location = new System.Drawing.Point(461, -34);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(373, 348);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 3;
            this.pictureBox1.TabStop = false;
            // 
            // minimize_box
            // 
            this.minimize_box.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.minimize_box.BackColor = System.Drawing.Color.White;
            this.minimize_box.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.minimize_box.Image = global::Learland.Properties.Resources.icons8_subtract_50;
            this.minimize_box.InitialImage = global::Learland.Properties.Resources.icons8_close_48;
            this.minimize_box.Location = new System.Drawing.Point(1220, 12);
            this.minimize_box.Name = "minimize_box";
            this.minimize_box.Size = new System.Drawing.Size(30, 30);
            this.minimize_box.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.minimize_box.TabIndex = 2;
            this.minimize_box.TabStop = false;
            this.minimize_box.Click += new System.EventHandler(this.minimize_box_Click);
            this.minimize_box.MouseEnter += new System.EventHandler(this.minimize_box_MouseEnter);
            this.minimize_box.MouseLeave += new System.EventHandler(this.minimize_box_MouseLeave);
            // 
            // exit_box
            // 
            this.exit_box.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.exit_box.BackColor = System.Drawing.Color.White;
            this.exit_box.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.exit_box.Image = global::Learland.Properties.Resources.icons8_close_48;
            this.exit_box.InitialImage = global::Learland.Properties.Resources.icons8_close_48;
            this.exit_box.Location = new System.Drawing.Point(1258, 12);
            this.exit_box.Name = "exit_box";
            this.exit_box.Size = new System.Drawing.Size(30, 30);
            this.exit_box.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.exit_box.TabIndex = 1;
            this.exit_box.TabStop = false;
            this.exit_box.Click += new System.EventHandler(this.exit_box_Click);
            this.exit_box.MouseEnter += new System.EventHandler(this.exit_box_MouseEnter);
            this.exit_box.MouseLeave += new System.EventHandler(this.exit_box_MouseLeave);
            // 
            // mail_panel
            // 
            this.mail_panel.BackColor = System.Drawing.Color.White;
            this.mail_panel.Controls.Add(this.email_textbox);
            this.mail_panel.Controls.Add(this.label1);
            this.mail_panel.Controls.Add(this.shapeContainer2);
            this.mail_panel.ForeColor = System.Drawing.Color.Black;
            this.mail_panel.Location = new System.Drawing.Point(461, 277);
            this.mail_panel.Name = "mail_panel";
            this.mail_panel.Size = new System.Drawing.Size(377, 67);
            this.mail_panel.TabIndex = 4;
            // 
            // email_textbox
            // 
            this.email_textbox.BackColor = System.Drawing.Color.White;
            this.email_textbox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.email_textbox.Font = new System.Drawing.Font("Roboto Slab", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.email_textbox.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(102)))), ((int)(((byte)(242)))));
            this.email_textbox.Location = new System.Drawing.Point(7, 30);
            this.email_textbox.Name = "email_textbox";
            this.email_textbox.Size = new System.Drawing.Size(356, 22);
            this.email_textbox.TabIndex = 1;
            this.email_textbox.Text = "salihseferovic05@gmail.com";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label1.Font = new System.Drawing.Font("Roboto Slab", 15F);
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(2, 2);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(80, 26);
            this.label1.TabIndex = 0;
            this.label1.Text = "E-mail:";
            // 
            // shapeContainer2
            // 
            this.shapeContainer2.Location = new System.Drawing.Point(0, 0);
            this.shapeContainer2.Margin = new System.Windows.Forms.Padding(0);
            this.shapeContainer2.Name = "shapeContainer2";
            this.shapeContainer2.Shapes.AddRange(new Microsoft.VisualBasic.PowerPacks.Shape[] {
            this.lineShape1});
            this.shapeContainer2.Size = new System.Drawing.Size(377, 67);
            this.shapeContainer2.TabIndex = 2;
            this.shapeContainer2.TabStop = false;
            // 
            // lineShape1
            // 
            this.lineShape1.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(196)))), ((int)(((byte)(196)))));
            this.lineShape1.BorderWidth = 3;
            this.lineShape1.Name = "lineShape1";
            this.lineShape1.X1 = 5;
            this.lineShape1.X2 = 372;
            this.lineShape1.Y1 = 56;
            this.lineShape1.Y2 = 56;
            // 
            // password_panel
            // 
            this.password_panel.BackColor = System.Drawing.Color.White;
            this.password_panel.Controls.Add(this.label2);
            this.password_panel.Controls.Add(this.password_txtbox);
            this.password_panel.Controls.Add(this.shapeContainer3);
            this.password_panel.ForeColor = System.Drawing.Color.Black;
            this.password_panel.Location = new System.Drawing.Point(461, 361);
            this.password_panel.Name = "password_panel";
            this.password_panel.Size = new System.Drawing.Size(377, 67);
            this.password_panel.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label2.Font = new System.Drawing.Font("Roboto Slab", 15F);
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(2, 6);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(108, 26);
            this.label2.TabIndex = 0;
            this.label2.Text = "Password:";
            // 
            // password_txtbox
            // 
            this.password_txtbox.BackColor = System.Drawing.Color.White;
            this.password_txtbox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.password_txtbox.Font = new System.Drawing.Font("Roboto Slab", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.password_txtbox.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(102)))), ((int)(((byte)(242)))));
            this.password_txtbox.Location = new System.Drawing.Point(7, 30);
            this.password_txtbox.Name = "password_txtbox";
            this.password_txtbox.PasswordChar = '*';
            this.password_txtbox.Size = new System.Drawing.Size(356, 22);
            this.password_txtbox.TabIndex = 1;
            this.password_txtbox.Text = "testtest123";
            // 
            // shapeContainer3
            // 
            this.shapeContainer3.Location = new System.Drawing.Point(0, 0);
            this.shapeContainer3.Margin = new System.Windows.Forms.Padding(0);
            this.shapeContainer3.Name = "shapeContainer3";
            this.shapeContainer3.Shapes.AddRange(new Microsoft.VisualBasic.PowerPacks.Shape[] {
            this.lineShape2});
            this.shapeContainer3.Size = new System.Drawing.Size(377, 67);
            this.shapeContainer3.TabIndex = 2;
            this.shapeContainer3.TabStop = false;
            // 
            // lineShape2
            // 
            this.lineShape2.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(196)))), ((int)(((byte)(196)))));
            this.lineShape2.BorderWidth = 3;
            this.lineShape2.Name = "lineShape1";
            this.lineShape2.X1 = 5;
            this.lineShape2.X2 = 372;
            this.lineShape2.Y1 = 56;
            this.lineShape2.Y2 = 56;
            // 
            // prijavise_btn
            // 
            this.prijavise_btn.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(102)))), ((int)(((byte)(242)))));
            this.prijavise_btn.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(102)))), ((int)(((byte)(242)))));
            this.prijavise_btn.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(92)))), ((int)(((byte)(143)))), ((int)(((byte)(38)))));
            this.prijavise_btn.BorderRadius = 19;
            this.prijavise_btn.BorderSize = 1;
            this.prijavise_btn.FlatAppearance.BorderSize = 0;
            this.prijavise_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.prijavise_btn.Font = new System.Drawing.Font("Roboto Black", 21F, System.Drawing.FontStyle.Bold);
            this.prijavise_btn.ForeColor = System.Drawing.Color.White;
            this.prijavise_btn.Location = new System.Drawing.Point(495, 474);
            this.prijavise_btn.Name = "prijavise_btn";
            this.prijavise_btn.Size = new System.Drawing.Size(300, 57);
            this.prijavise_btn.TabIndex = 6;
            this.prijavise_btn.Text = "Prijavi se";
            this.prijavise_btn.TextColor = System.Drawing.Color.White;
            this.prijavise_btn.UseVisualStyleBackColor = false;
            this.prijavise_btn.Click += new System.EventHandler(this.prijavise_btn_Click);
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(92)))), ((int)(((byte)(143)))), ((int)(((byte)(38)))));
            this.ClientSize = new System.Drawing.Size(1300, 700);
            this.Controls.Add(this.mail_panel);
            this.Controls.Add(this.prijavise_btn);
            this.Controls.Add(this.password_panel);
            this.Controls.Add(this.minimize_box);
            this.Controls.Add(this.exit_box);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.shapeContainer1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Learland login";
            this.Load += new System.EventHandler(this.Login_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Login_KeyDown);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.login_MouseDown);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.login_MouseMove);
            this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.login_MouseUp);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.minimize_box)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.exit_box)).EndInit();
            this.mail_panel.ResumeLayout(false);
            this.mail_panel.PerformLayout();
            this.password_panel.ResumeLayout(false);
            this.password_panel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.VisualBasic.PowerPacks.ShapeContainer shapeContainer1;
        private Microsoft.VisualBasic.PowerPacks.RectangleShape rectangleShape1;
        private System.Windows.Forms.PictureBox exit_box;
        private System.Windows.Forms.PictureBox minimize_box;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel mail_panel;
        private System.Windows.Forms.TextBox email_textbox;
        private System.Windows.Forms.Label label1;
        private Microsoft.VisualBasic.PowerPacks.ShapeContainer shapeContainer2;
        private Microsoft.VisualBasic.PowerPacks.LineShape lineShape1;
        private System.Windows.Forms.Panel password_panel;
        private System.Windows.Forms.TextBox password_txtbox;
        private System.Windows.Forms.Label label2;
        private Microsoft.VisualBasic.PowerPacks.ShapeContainer shapeContainer3;
        private Microsoft.VisualBasic.PowerPacks.LineShape lineShape2;
        private RoundButton prijavise_btn;
    }
}

