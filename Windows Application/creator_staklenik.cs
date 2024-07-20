using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Learland
{
    class creator_staklenik
    {
        
        public static void create_staklenik(String naziv, Dictionary<string,RoundPanel> dict_staklenik)
        {
            Color boja = Color.FromArgb(162, 191, 131);
            dict_staklenik[naziv] = new RoundPanel();
            dict_staklenik[naziv].BackColor = boja;
            dict_staklenik[naziv].ForeColor = Color.White;
            dict_staklenik[naziv].BorderRadius = 24;
            dict_staklenik[naziv].Size = new Size(230, 207);
            dict_staklenik[naziv].Cursor = Cursors.Hand;
        }
        public static void create_label_staklenik(String naziv, Dictionary<string, Label> dict_label_staklenici)
        {
            Color boja = Color.FromArgb(162, 191, 131);
            dict_label_staklenici[naziv] = new Label();
            dict_label_staklenici[naziv].ForeColor = Color.White;
            dict_label_staklenici[naziv].Text = naziv;
            dict_label_staklenici[naziv].AutoSize = false;
            dict_label_staklenici[naziv].Cursor = Cursors.Hand;
            dict_label_staklenici[naziv].Font = new Font("Roboto Slab", 14, FontStyle.Bold);
            dict_label_staklenici[naziv].Size = new Size(224, 99);
            dict_label_staklenici[naziv].Location = new Point(3, 58);
            dict_label_staklenici[naziv].TextAlign = ContentAlignment.MiddleCenter;
          //  naziv_staklenici.

        }
        public static void create_RoundButton(string naziv, Dictionary<string, RoundButton> dict_RoundButton)
        {
            dict_RoundButton[naziv] = new RoundButton();
            dict_RoundButton[naziv].BackColor = Color.White;
            dict_RoundButton[naziv].BorderRadius = 12;
            dict_RoundButton[naziv].BorderSize = 2;
            dict_RoundButton[naziv].BorderColor = Color.FromArgb(92, 143, 38);
            dict_RoundButton[naziv].ForeColor = Color.FromArgb(92, 143, 38);
            dict_RoundButton[naziv].Font = new Font("Roboto Slab", 18, FontStyle.Bold);
            dict_RoundButton[naziv].Margin = new Padding(19,3,3,3);
            dict_RoundButton[naziv].Image = Properties.Resources.dejstvo_zelena;
            dict_RoundButton[naziv].ImageAlign = ContentAlignment.MiddleLeft;
            dict_RoundButton[naziv].Padding = new Padding(30, 0, 0, 0);
            dict_RoundButton[naziv].Text = naziv;
            dict_RoundButton[naziv].Size = new Size(248, 50);
        }
        public static void create_tabpage(string naziv, Dictionary<string, TabPage> dict_tabpage)
        {
            dict_tabpage[naziv] = new TabPage();
            dict_tabpage[naziv].BackColor = Color.FromArgb(92, 143, 38);
        }
        public static void create_dejstvo_form(String uid, string naziv, Dictionary<string, dejstvo_form> dict_dejstvo_form, Other other)
        {
            dict_dejstvo_form[naziv] = new dejstvo_form(uid,naziv, other);
            dict_dejstvo_form[naziv].Location = new Point(0, 0);
            dict_dejstvo_form[naziv].TopLevel = false;
            dict_dejstvo_form[naziv].Tag = naziv;

            dict_dejstvo_form[naziv].Visible = true;
        }
    }
}
