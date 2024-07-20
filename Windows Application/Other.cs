using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using Request;
using System.Text;
using Firebase.Database;
using Firebase.Database.Query;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;
using System.Linq;
namespace Learland
{
    public partial class Other : Form
    {
        #region - Varijable
        Color zelena = Color.FromArgb(92, 143, 38);
        bool isWeatherLoad = false;
        string temperatura;
        String uid;
        Dictionary<string, RoundPanel> dict_staklenici = new Dictionary<string, RoundPanel>();
        Dictionary<string, Label> dict_label_staklenici = new Dictionary<string, Label>();
        Dictionary<string, RoundButton> dict_RoundButton = new Dictionary<string, RoundButton>();
        Dictionary<string, TabPage> dict_tabpage = new Dictionary<string, TabPage>();
        Dictionary<string, dejstvo_form> dict_dejstvo_form = new Dictionary<string, dejstvo_form>();
        private static string firebaseString = "https://learland-31bf9-default-rtdb.europe-west1.firebasedatabase.app/";
        private static string FrebaseSecret = "YvACmqx90hCG0MnciEufB17YZXVll4CYXY7RfxYY";
        private FirebaseClient firebaseClient = new FirebaseClient(firebaseString, new FirebaseOptions { AuthTokenAsyncFactory = () => Task.FromResult(FrebaseSecret) });

        int lokacija_staklenika_X = 41;
        int staklenici_razmak_X = 40;
        int lokacija_staklenika_Y = 115;
        int staklenici_razmak_Y = 20;
        #endregion

        public Other(System.Drawing.Image img, string cels, String id)
        {
            InitializeComponent();
            menu_fly_panel.HorizontalScroll.Enabled = false;
            menu_fly_panel.HorizontalScroll.Visible = false;
            uid = id;
            if (img != null)
            {
                isWeatherLoad = true;
                vrijemepicturebox.Image = img;
                temperatura = cels;
                this.Temp_label.Text = temperatura;
            }
            else
            {
                isWeatherLoad = false;
            }
            ocitaj_staklenike("Staklenik1");
            ocitaj_staklenike("Staklenik2");
            ocitaj_staklenike("Staklenik3");
            ocitaj_staklenike("Staklenik4");
            ocitaj_staklenike("Staklenik5");
            ocitaj_staklenike("Staklenik6");
            ocitaj_staklenike("Staklenik7");
            this.time_label1.Text = DateTime.Now.ToString();
            this.time_label2.Text = DateTime.Now.ToString();
            search_txt.GotFocus += RemoveText;
            search_txt.LostFocus += AddText;
        }

        #region - Prozor Funkcije
        //--------------------------------Minimize/exit box-----------------------------------
        private void exit_box_mouseenter(object sender, EventArgs e)
        {
            this.exit_box.Size = new Size(34, 34);
            this.exit_box2.Size = new Size(34, 34);
            this.exit_box3.Size = new Size(34, 34);
            this.exit_box4.Size = new Size(34, 34);
        }

        private void exit_box_mouseleave(object sender, EventArgs e)
        {
            this.exit_box.Size = new Size(30, 30);
            this.exit_box2.Size = new Size(30, 30);
            this.exit_box3.Size = new Size(30, 30);
            this.exit_box4.Size = new Size(30, 30);
        }

        private void exit_box_click(object sender, EventArgs e)
        {

            Login login = new Login();
            login.Show();
            this.Close();
        }

        private void minimize_box_mouseenter(object sender, EventArgs e)
        {
            this.minimize_box.Size = new Size(34, 34);
            this.minimize_box2.Size = new Size(34, 34);
            this.minimize_box3.Size = new Size(34, 34);
            this.minimize_box4.Size = new Size(34, 34);
        }

        private void minimize_box_mouseleave(object sender, EventArgs e)
        {
            this.minimize_box.Size = new Size(30, 30);
            this.minimize_box2.Size = new Size(30, 30);
            this.minimize_box3.Size = new Size(30, 30);
            this.minimize_box4.Size = new Size(30, 30);
        }

        private void minimize_box_click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }
        //-------------------------------------------------------------------------------------
        private void Time_timer_Tick(object sender, EventArgs e)
        {
            this.time_label1.Text = DateTime.Now.ToString();
            this.time_label2.Text = DateTime.Now.ToString();
        }

        private void FormatButtonColors(int broj)
        {
            if(broj == 1)
            {
                //-----------------------------------------------------
                this.pocetna_btn.BackColor = Color.White;
                this.pocetna_btn.ForeColor = zelena;
                this.pocetna_btn.Image = Properties.Resources.Home_zelene;
                //-----------------------------------------------------
                this.staklenici_btn.BackColor = zelena;
                this.staklenici_btn.ForeColor = Color.White;
                this.staklenici_btn.Image = Properties.Resources.staklenici_bijele;
                //-----------------------------------------------------
                this.savjetnik_btn.BackColor = zelena;
                this.savjetnik_btn.ForeColor = Color.White;
                this.savjetnik_btn.Image = Properties.Resources.Idea_bijele;
                //-----------------------------------------------------
                this.postavke_btn.BackColor = zelena;
                this.postavke_btn.ForeColor = Color.White;
                this.postavke_btn.Image = Properties.Resources.settings_bijele;
            }
            else if (broj == 2)
            {
                //-----------------------------------------------------
                this.pocetna_btn.BackColor = zelena;
                this.pocetna_btn.ForeColor = Color.White;
                this.pocetna_btn.Image = Properties.Resources.Home_bijele;
                //-----------------------------------------------------
                this.staklenici_btn.BackColor = Color.White;
                this.staklenici_btn.ForeColor = zelena;
                this.staklenici_btn.Image = Properties.Resources.staklenici_zelene;
                //-----------------------------------------------------
                this.savjetnik_btn.BackColor = zelena;
                this.savjetnik_btn.ForeColor = Color.White;
                this.savjetnik_btn.Image = Properties.Resources.Idea_bijele;
                //-----------------------------------------------------
                this.postavke_btn.BackColor = zelena;
                this.postavke_btn.ForeColor = Color.White;
                this.postavke_btn.Image = Properties.Resources.settings_bijele;
            }
            else if (broj == 3)
            {
                //-----------------------------------------------------
                this.pocetna_btn.BackColor = zelena;
                this.pocetna_btn.ForeColor = Color.White;
                this.pocetna_btn.Image = Properties.Resources.Home_bijele;
                //-----------------------------------------------------
                this.staklenici_btn.BackColor = zelena;
                this.staklenici_btn.ForeColor = Color.White;
                this.staklenici_btn.Image = Properties.Resources.staklenici_bijele;
                //-----------------------------------------------------
                this.savjetnik_btn.BackColor = Color.White;
                this.savjetnik_btn.ForeColor = zelena;
                this.savjetnik_btn.Image = Properties.Resources.Idea_zelene;
                //-----------------------------------------------------
                this.postavke_btn.BackColor = zelena;
                this.postavke_btn.ForeColor = Color.White;
                this.postavke_btn.Image = Properties.Resources.settings_bijele;
            }
            else if (broj == 4)
            {
                //-----------------------------------------------------
                this.pocetna_btn.BackColor = zelena;
                this.pocetna_btn.ForeColor = Color.White;
                this.pocetna_btn.Image = Properties.Resources.Home_bijele;
                //-----------------------------------------------------
                this.staklenici_btn.BackColor = zelena;
                this.staklenici_btn.ForeColor = Color.White;
                this.staklenici_btn.Image = Properties.Resources.staklenici_bijele;
                //-----------------------------------------------------
                this.savjetnik_btn.BackColor = zelena;
                this.savjetnik_btn.ForeColor = Color.White;
                this.savjetnik_btn.Image = Properties.Resources.Idea_bijele;
                //-----------------------------------------------------
                this.postavke_btn.BackColor = Color.White;
                this.postavke_btn.ForeColor = zelena;
                this.postavke_btn.Image = Properties.Resources.settings_zelene;
            }
            else if (broj == 5)
            {
                //-----------------------------------------------------
                this.pocetna_btn.BackColor = zelena;
                this.pocetna_btn.ForeColor = Color.White;
                this.pocetna_btn.Image = Properties.Resources.Home_bijele;
                //-----------------------------------------------------
                this.staklenici_btn.BackColor = zelena;
                this.staklenici_btn.ForeColor = Color.White;
                this.staklenici_btn.Image = Properties.Resources.staklenici_bijele;
                //-----------------------------------------------------
                this.savjetnik_btn.BackColor = zelena;
                this.savjetnik_btn.ForeColor = Color.White;
                this.savjetnik_btn.Image = Properties.Resources.Idea_bijele;
                //-----------------------------------------------------
                this.postavke_btn.BackColor = zelena;
                this.postavke_btn.ForeColor = Color.White;
                this.postavke_btn.Image = Properties.Resources.settings_bijele;
                //-----------------------------------------------------
                
            }
            try
            {
                if (dict_RoundButton.Count != 0)
                {
                    string[] keys = dict_RoundButton.Keys.ToArray();
                    for (int i = 0; i < keys.Length; i++)
                    {
                        this.dict_RoundButton[keys[i]].BackColor = zelena;
                        this.dict_RoundButton[keys[i]].ForeColor = Color.White;
                        this.dict_RoundButton[keys[i]].Image = Properties.Resources.dejstvo_bijela;
                    }

                }
            }
            catch
            {

            }
        }

        private async void Other_Load(object sender, EventArgs e)
        {
            if (isWeatherLoad == false)
            {
                await GetWeatherAsync();
            }
            //try
            //{
            //   var ttt = await firebaseClient.Child(uid + "/").OnceSingleAsync<List<object>>();
            //}
            //catch(FirebaseException ex)
            //{
            //    MessageBox.Show(ex.ResponseData);
            //    Staklenici_fr_naziv stak = new Staklenici_fr_naziv();
            //    var staka = JsonConvert.DeserializeObject<Staklenici_fr_naziv>(ex.ResponseData);
            //    MessageBox.Show(staka.ime.ToString());
            //}

        }

        public async Task GetWeatherAsync()
        {
            try
            {
                var client = new HttpClient();

                var request = new HttpRequestMessage(HttpMethod.Get, "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Tomislavgrad?unitGroup=metric&key=6T2RE2NEEQ3FXHNYPW2JRJZ82&contentType=json");

                var response = await client.SendAsync(request);
                response.EnsureSuccessStatusCode(); // Throw an exception if error

                var body = await response.Content.ReadAsStringAsync();
                dynamic weather = JsonConvert.DeserializeObject(body);
                temperatura = weather.currentConditions.temp;
                this.Temp_label.Text = temperatura;
                string link_to_img = "https://github.com/visualcrossing/WeatherIcons/blob/main/PNG/1st%20Set%20-%20Color/" + weather.currentConditions.icon + ".png?raw=true";
                vrijemepicturebox.LoadAsync(link_to_img);
            }
            catch
            {
                MessageBox.Show("Greška pri očitavanju vremena", "Greška", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void RemoveText(object sender, EventArgs e)
        {
            if (search_txt.Text == "Upišite ime kulutre:")
            {
                search_txt.Text = "";
            }
        }

        public void AddText(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(search_txt.Text))
                search_txt.Text = "Upišite ime kulutre:";
        }
        #endregion

        #region - Menu Buttons
        private void pocetna_btn_Click(object sender, EventArgs e)
        {
            this.TabControl.SelectedTab = Pocetna_tab;
            FormatButtonColors(1);
        }

        private void staklenici_btn_Click(object sender, EventArgs e)
        {
            this.TabControl.SelectedTab = staklenici_tab;
            FormatButtonColors(2);
        }

        private void savjetnik_btn_Click(object sender, EventArgs e)
        {
            this.TabControl.SelectedTab = savjetnik_tab;
            FormatButtonColors(3);
        }

        private void postavke_btn_Click(object sender, EventArgs e)
        {
            this.TabControl.SelectedTab = postavke_tab;
            FormatButtonColors(4);
        }
        #endregion

        #region - Dejstvo form opcije
        private async Task ocitaj_staklenike(string naziv)
        {
            try
            {
                create_staklenici(naziv);
                if (lokacija_staklenika_X > 853)
                {
                    lokacija_staklenika_Y += 207 + staklenici_razmak_Y;
                    lokacija_staklenika_X = 41;
                }
                dict_staklenici[naziv].Location = new Point(lokacija_staklenika_X, lokacija_staklenika_Y);
                lokacija_staklenika_X += staklenici_razmak_X + 230;
            }
            catch
            {
                MessageBox.Show("Greška pri kreiranju staklenika", "Greška", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void create_staklenici(string naziv)
        {
            creator_staklenik.create_staklenik(naziv, dict_staklenici);
            this.staklenicipanel.Controls.Add(dict_staklenici[naziv]);

            creator_staklenik.create_label_staklenik(naziv, dict_label_staklenici);
            this.dict_staklenici[naziv].Controls.Add(dict_label_staklenici[naziv]);
            create_event_click(naziv);
        }
        private void create_event_click(string naziv)
        {
            dict_staklenici[naziv].Click += (sender, EventArgs) => { dejstvo_Click(sender, EventArgs, naziv); };
            dict_label_staklenici[naziv].Click += (sender, EventArgs) => { dejstvo_Click(sender, EventArgs, naziv); };
        }
        private void otvori_dejstvo_form(string naziv)
        {
            
            if (!dict_tabpage.ContainsKey(naziv) && !dict_RoundButton.ContainsKey(naziv) && !dict_dejstvo_form.ContainsKey(naziv))
            {
                FormatButtonColors(5);
                creator_staklenik.create_dejstvo_form(uid, naziv, dict_dejstvo_form, this);
                creator_staklenik.create_RoundButton(naziv, dict_RoundButton);
                creator_staklenik.create_tabpage(naziv, dict_tabpage);
                dict_RoundButton[naziv].Click += (sender, EventArgs) => { Round_staklenik_Click(sender, EventArgs, naziv); };
                this.menu_fly_panel.Controls.Add(dict_RoundButton[naziv]);
                this.TabControl.TabPages.Add(dict_tabpage[naziv]);
                dict_tabpage[naziv].Controls.Add(dict_dejstvo_form[naziv]);
                this.TabControl.SelectedTab = dict_tabpage[naziv];
                dict_dejstvo_form[naziv].Visible = true;
            }
            else
            {
                FormatButtonColors(5);
                dict_RoundButton[naziv].BackColor = Color.White;
                dict_RoundButton[naziv].ForeColor = zelena;
                dict_RoundButton[naziv].Image = Properties.Resources.dejstvo_zelena;
                this.TabControl.SelectedTab = dict_tabpage[naziv];
            }
        }
        private void otvori_savjetnik_dejstvo(string naziv)
        {
            Savjetnik savjetnik = new Savjetnik(naziv, this);
            savjetnik.Location = new Point(0, 0);
            savjetnik.TopLevel = false;
            savjetnik.Tag = naziv;

            savjetnik.Visible = true;
            this.savjetnik_dejstvo_tab.Controls.Add(savjetnik);
            this.TabControl.SelectedTab = savjetnik_dejstvo_tab;
        }
        public void zatvori_savjetnik_dejstvo()
        {
            this.TabControl.SelectedTab = savjetnik_tab;
        }
        public void Remove_dejstvo_form(string naziv)
        {
            try
            {
                this.dict_tabpage[naziv].Controls.Remove(dict_dejstvo_form[naziv]);
                dict_dejstvo_form.Remove(naziv);
                this.TabControl.TabPages.Remove(dict_tabpage[naziv]);
                dict_tabpage.Remove(naziv);
                this.menu_fly_panel.Controls.Remove(dict_RoundButton[naziv]);
                dict_RoundButton.Remove(naziv);
                this.TabControl.SelectedTab = staklenici_tab;
                FormatButtonColors(2);
            }
            catch
            {
                MessageBox.Show("Greška pri brisanju staklenika", "Greška", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void Round_staklenik_Click(object sender, EventArgs e, String naziv)
        {
            try
            {
                this.TabControl.SelectedTab = dict_tabpage[naziv];
                FormatButtonColors(5);
                dict_RoundButton[naziv].BackColor = Color.White;
                dict_RoundButton[naziv].ForeColor = zelena;
                dict_RoundButton[naziv].Image = Properties.Resources.dejstvo_zelena;
            }
            catch
            {
                MessageBox.Show("Greška pri otvaranjau staklenika", "Greška", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        #endregion

        private void dejstvo_Click(object sender, EventArgs e, String naziv)
        {
            try
            {
                otvori_dejstvo_form(naziv);            
            }
            catch
            {
                MessageBox.Show("Greška pri otvaranjau staklenika", "Greška", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            otvori_savjetnik_dejstvo(this.search_txt.Text);
        }
    }
}
