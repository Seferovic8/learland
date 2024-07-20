using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Firebase.Database;
using Firebase.Auth;
namespace Learland
{
    public partial class Login : Form
    {
        System.Drawing.Image img;
        string celsius;
        HttpClient client = new HttpClient();
        WebClient wc = new WebClient();
        public Login()
        {
            InitializeComponent();
            
        }
        #region prozor funkcije
        private bool dragging = false;
        private bool showpass_bool = false;
        private Point dragCursorPoint;
        private Point dragFormPoint;
        private void login_MouseDown(object sender, MouseEventArgs e)
        {
            dragging = true;
            dragCursorPoint = Cursor.Position;
            dragFormPoint = this.Location;
        }

        private void login_MouseMove(object sender, MouseEventArgs e)
        {
            if (dragging)
            {
                Point dif = Point.Subtract(Cursor.Position, new Size(dragCursorPoint));
                this.Location = Point.Add(dragFormPoint, new Size(dif));
            }
        }

        private void login_MouseUp(object sender, MouseEventArgs e)
        {
            dragging = false;
        }
        private void Login_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                prijavise_btn_Click(sender, e);
                e.SuppressKeyPress = true;
                e.Handled = true;
            }
        }
        private void exit_box_MouseEnter(object sender, EventArgs e)
        {
            this.exit_box.Size = new Size(34, 34);
        }

        private void exit_box_MouseLeave(object sender, EventArgs e)
        {
            this.exit_box.Size = new Size(30, 30);
        }

        private void exit_box_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }

        private void minimize_box_MouseEnter(object sender, EventArgs e)
        {
            this.minimize_box.Size = new Size(34, 34);
        }

        private void minimize_box_MouseLeave(object sender, EventArgs e)
        {
            this.minimize_box.Size = new Size(30, 30);
        }

        private void minimize_box_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }
        #endregion
        private async void prijavise_btn_Click(object sender, EventArgs e)
        {
            try
            {
                var auth = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDxcncouksdBAZPLsu8acN4WOCzVbJKLx8"));
                var firebaseUsername = this.email_textbox.Text;
                var firebasePassword = this.password_txtbox.Text;

                // this grabs a one-off token using the username and password combination
                var token = await auth.SignInWithEmailAndPasswordAsync(firebaseUsername, firebasePassword);
                this.Hide();
                Other other = new Other(img, celsius, token.User.LocalId);

                other.Show();

            }
            catch (FirebaseAuthException ex)
            {
                if (ex.Reason.ToString() == "WrongPassword")
                {
                    string tt = "Pogrešna lozinka. Pokušajte ponovno";
                    MessageBox.Show(tt, "Greška", MessageBoxButtons.OKCancel, MessageBoxIcon.Error);
                    return;

                }

                if (ex.Reason.ToString() == "UnknownEmailAddress")
                {
                    string tt = "Nempznati email. Pokušajte ponovno.";
                    MessageBox.Show(tt, "Greška", MessageBoxButtons.OKCancel, MessageBoxIcon.Error);
                    return;

                }

                if (ex.Reason.ToString() == "InvalidEmailAddress")
                {
                    string tt = "Nevažeći email. Pokušajte ponovno.";
                    MessageBox.Show(tt, "Greška", MessageBoxButtons.OKCancel, MessageBoxIcon.Error);
                    return;

                }
                MessageBox.Show("Hoce");
            }
            catch
            {
                MessageBox.Show("Greška pri prijavljivanju", "Greška", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public async Task GetWeatherAsync()
        {
            try { 
            var request = new HttpRequestMessage(HttpMethod.Get, "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Tomislavgrad?unitGroup=metric&key=6T2RE2NEEQ3FXHNYPW2JRJZ82&contentType=json");

            var response = await client.SendAsync(request);
            response.EnsureSuccessStatusCode(); // Throw an exception if error

            var body = await response.Content.ReadAsStringAsync();
            dynamic weather = JsonConvert.DeserializeObject(body);
            celsius = weather.currentConditions.temp;
            string link_to_img = "https://github.com/visualcrossing/WeatherIcons/blob/main/PNG/1st%20Set%20-%20Color/" + weather.currentConditions.icon + ".png?raw=true";

            byte[] bytes = wc.DownloadData("https://github.com/visualcrossing/WeatherIcons/blob/main/PNG/1st%20Set%20-%20Color/partly-cloudy-day.png?raw=true");
            MemoryStream ms = new MemoryStream(bytes);
            img = System.Drawing.Image.FromStream(ms);
            }
            catch
            {
                MessageBox.Show("Greška pri očitavanju vremena", "Greška", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        
        private async void Login_Load(object sender, EventArgs e)
        {
            await GetWeatherAsync();
            
        }

    }
}
