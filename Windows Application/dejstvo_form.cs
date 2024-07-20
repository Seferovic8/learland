using Firebase.Database;
using Firebase.Database.Query;
using Request;
using System;
using System.Drawing;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Learland
{
    public partial class dejstvo_form : Form
    {
        #region - Varijable
        string naziv;
        String uid;
        string path;
        Other home;
        Upravljanje upravljanje_check = new Upravljanje();
        private FirebaseClient firebaseClient = new FirebaseClient(firebaseString, new FirebaseOptions { AuthTokenAsyncFactory = () => Task.FromResult(FrebaseSecret) });
        Parametri parametri = new Parametri();
        Upravljanje upravljanje = new Upravljanje();
        #endregion
        public dejstvo_form(String id, string ime, Other homee)
        {
            InitializeComponent();
            uid = id;
            naziv = ime;
            home = homee;
            path = uid + "/" + naziv;
            this.label1.Text = naziv;


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
            home.Remove_dejstvo_form(naziv);
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
            home.WindowState = FormWindowState.Minimized;
        }
        private void pam_odrz_tg_btn_CheckedChanged(object sender, EventArgs e)
        {
            if (this.periodicno_panel.Enabled == true)
            {
                this.periodicno_panel.Enabled = false;
                this.periodično_tg_btn.Checked = false;
            }
            this.pametno_odrz_panel.Enabled = this.pam_odrz_tg_btn.Checked;

        }

        private void periodično_tg_btn_CheckedChanged(object sender, EventArgs e)
        {
            if (this.pametno_odrz_panel.Enabled == true)
            {
                this.pametno_odrz_panel.Enabled = false;
                this.pam_odrz_tg_btn.Checked = false;
            }
            this.periodicno_panel.Enabled = this.periodično_tg_btn.Checked;

        }

        #endregion
        private async void dejstvo_form_Load(object sender, EventArgs e)
        {
            Task tt = new Task(GetParametre);
            tt.Start();
            await Task.Delay(10);
            upravljanje_check = await firebaseClient.Child(path + "/Upravljanje").OnceSingleAsync<Upravljanje>();
            UpdateUpravljanje(upravljanje_check);
        }

        private async void GetParametre()
        {
            while (true)
            {
                try
                {

                    parametri = await firebaseClient.Child(path + "/Parametri").OnceSingleAsync<Parametri>();
                    UpdateParametre(parametri);
                    await Task.Delay(10);

                }
                catch
                { }
            }
        }
        private void UpdateParametre(Parametri paremtri)
        {
            if (vlaz_zemlje.InvokeRequired == true)
            {
                vlaz_zemlje.Invoke((MethodInvoker)delegate { vlaz_zemlje.Text = paremtri.vlaznost_zemlje.ToString(); });
            }
            else
            {
                this.vlaz_zemlje.Text = paremtri.vlaznost_zemlje.ToString();
            }
            if (vlaz_zraka.InvokeRequired == true)
            {
                vlaz_zraka.Invoke((MethodInvoker)delegate { vlaz_zraka.Text = paremtri.vlaznost_zraka.ToString(); });
            }
            else
            {
                this.vlaz_zraka.Text = paremtri.vlaznost_zraka.ToString();
            }
            if (nivo_co2.InvokeRequired == true)
            {
                nivo_co2.Invoke((MethodInvoker)delegate { nivo_co2.Text = paremtri.nivo_co2.ToString() + "%"; });
            }
            else
            {
                this.nivo_co2.Text = paremtri.nivo_co2.ToString() + "%";
            }
            if (temp_zemlje.InvokeRequired == true)
            {
                temp_zemlje.Invoke((MethodInvoker)delegate { temp_zemlje.Text = paremtri.temperatura_zemlje.ToString(); });
            }
            else
            {
                this.temp_zemlje.Text = paremtri.temperatura_zemlje.ToString();
            }

            if (temp_zraka.InvokeRequired == true)
            {

                temp_zraka.Invoke((MethodInvoker)delegate { temp_zraka.Text = paremtri.temperatura_zraka.ToString(); });

            }
            else
            {
                this.temp_zraka.Text = paremtri.temperatura_zraka.ToString();
            }

            if (jakostsvjetla_krug.InvokeRequired == true)
            {
                int jak_svjet =Convert.ToInt32(paremtri.jakost_svjetla / 7);
                int jak_svje = Convert.ToInt32(jak_svjet * 2.55);
                if(jak_svjet > 100)
                {
                    jak_svjet = Convert.ToInt32(paremtri.jakost_svjetla / 9);
                }
                jakostsvjetla_krug.Invoke((MethodInvoker)delegate { jakostsvjetla_krug.Text = jak_svjet.ToString() + "%"; });
                jakostsvjetla_krug.Invoke((MethodInvoker)delegate { jakostsvjetla_krug.BackgroundColor = Color.FromArgb(jak_svje, Color.Yellow); });
            }
            else
            {
                int jak_svje = Convert.ToInt32((paremtri.jakost_svjetla/7) * 2.55);
                jakostsvjetla_krug.Text = parametri.jakost_svjetla.ToString() + "%";
                jakostsvjetla_krug.BackgroundColor = Color.FromArgb(jak_svje, Color.Yellow);
            }

        }
        private void UpdateUpravljanje(Upravljanje upravljanje)
        {
            if (navodnjavanje_tg_btn.InvokeRequired == true)
            {
                navodnjavanje_tg_btn.Invoke((MethodInvoker)delegate { navodnjavanje_tg_btn.Checked = upravljanje.navodnjavanje; });
            }
            else
            {
                navodnjavanje_tg_btn.Checked = upravljanje.navodnjavanje;
            }
            if (provjetravanje_tg_btn.InvokeRequired == true)
            {
                provjetravanje_tg_btn.Invoke((MethodInvoker)delegate { provjetravanje_tg_btn.Checked = upravljanje.provjetravanje; });
            }
            else
            {
                provjetravanje_tg_btn.Checked = upravljanje.provjetravanje;
            }
            if (grijanje_tg_btn.InvokeRequired == true)
            {
                grijanje_tg_btn.Invoke((MethodInvoker)delegate { grijanje_tg_btn.Checked = upravljanje.grijanje; });
            }
            else
            {
                grijanje_tg_btn.Checked = upravljanje.grijanje;
            }
            if (svjetiljke_tg_btn.InvokeRequired == true)
            {
                svjetiljke_tg_btn.Invoke((MethodInvoker)delegate { svjetiljke_tg_btn.Checked = upravljanje.svjetiljke; });
            }
            else
            {
                svjetiljke_tg_btn.Checked = upravljanje.svjetiljke;
            }

            if (vrata_tg_btn.InvokeRequired == true)
            {
                vrata_tg_btn.Invoke((MethodInvoker)delegate { vrata_tg_btn.Checked = upravljanje.vrata; });
            }
            else
            {
                vrata_tg_btn.Checked = upravljanje.vrata;
            }

        }
        private Upravljanje Get_tg_btn()
        {
            Upravljanje upravljanje_get = new Upravljanje()
            {
                navodnjavanje = navodnjavanje_tg_btn.Checked,
                provjetravanje = provjetravanje_tg_btn.Checked,
                grijanje = grijanje_tg_btn.Checked,
                svjetiljke = svjetiljke_tg_btn.Checked,
                vrata = vrata_tg_btn.Checked
            };
            return upravljanje_get;
        }
        private void navodnjavanje_tg_btn_CheckedChanged(object sender, EventArgs e)
        {
            firebaseClient.Child(path + "/Upravljanje").PutAsync(Get_tg_btn());
        }

        private void provjetravanje_tg_btn_CheckedChanged(object sender, EventArgs e)
        {
            firebaseClient.Child(path + "/Upravljanje").PutAsync(Get_tg_btn());
        }

        private void grijanje_tg_btn_CheckedChanged(object sender, EventArgs e)
        {
            firebaseClient.Child(path + "/Upravljanje").PutAsync(Get_tg_btn());
        }

        private void svjetiljke_tg_btn_CheckedChanged(object sender, EventArgs e)
        {
            firebaseClient.Child(path + "/Upravljanje").PutAsync(Get_tg_btn());
        }

        private void vrata_tg_btn_CheckedChanged(object sender, EventArgs e)
        {
            firebaseClient.Child(path + "/Upravljanje").PutAsync(Get_tg_btn());
        }
    }
}



















