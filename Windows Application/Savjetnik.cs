using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Learland
{
    public partial class Savjetnik : Form
    {
        #region - Varijable
        string naziv;
        Other home;
        #endregion
        public Savjetnik(string ime, Other homee)
        {
            InitializeComponent();
            naziv = ime;
            home = homee;
            this.slika.LoadAsync("https://i.postimg.cc/QMjkRDcQ/rajcica.png");
        }
        #region -Form Controls
        private void exit_box_mouseenter(object sender, EventArgs e)
        {
            this.exit_box.Size = new Size(34, 34);
        }

        private void exit_box_mouseleave(object sender, EventArgs e)
        {
            this.exit_box.Size = new Size(30, 30);
        }

        private void exit_box_click(object sender, EventArgs e)
        {
            home.zatvori_savjetnik_dejstvo();
            this.Close();
        }

        private void minimize_box_mouseenter(object sender, EventArgs e)
        {
            this.minimize_box.Size = new Size(34, 34);
        }

        private void minimize_box_mouseleave(object sender, EventArgs e)
        {
            this.minimize_box.Size = new Size(30, 30);
        }

        private void minimize_box_click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }
        #endregion

        private void time_timer_Tick(object sender, EventArgs e)
        {
            this.time_label1.Text = DateTime.Now.ToString();
        }

  
    }
}
