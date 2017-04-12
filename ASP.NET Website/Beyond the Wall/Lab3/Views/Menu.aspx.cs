using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab3.scripts.DBAccess;

namespace Lab3.Views
{
    public partial class Menu : System.Web.UI.UserControl
    {
        private string[] menuItems = 
        {
                "tamales",
                "carnitas",
                "frijoles",
                "rellenos",
                "chilaquiles",
                "horchata",
                "jugo"
        };

        static HttpCookie[] cookie = new HttpCookie[7];
        int cookieCount;
        int n;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (n = 0; n < menuItems.Length; n++)
                {
                    cookie[n] = Request.Cookies[menuItems[n]];
                }
                int itemCount = 0;

                if (cookie[0] == null)
                {
                    for (n = 0; n < menuItems.Length; n++)
                    {
                        cookie[n] = new HttpCookie(menuItems[n], itemCount.ToString());
                    }
                }
            }
        }

        public void addItem(int n)
        {
            cookieCount = Convert.ToInt32(cookie[n].Value) + 1;
            cookie[n].Value = cookieCount.ToString();
        }

        public void removeItem(int n)
        {
            if (Convert.ToInt32(cookie[n].Value) != 0)
            {
                cookieCount = Convert.ToInt32(cookie[n].Value) - 1;               
                cookie[n].Value = cookieCount.ToString();
            }
        }

        protected void addItem(object sender, EventArgs e)
        {
            switch (((Button) sender).ID)
            {
                case "addTamales":
                    addItem(0);
                    numTamales.Text = cookie[0].Value;
                    break;
                case "addCarnitas":
                    addItem(1);
                    numCarnitas.Text = cookie[1].Value;
                    break;
                case "addFrijoles":
                    addItem(2);
                    numFrijoles.Text = cookie[2].Value;
                    break;
                case "addChile":
                    addItem(3);
                    numChile.Text = cookie[3].Value;
                    break;
                case "addChilaquiles":
                    addItem(4);
                    numChilaquiles.Text = cookie[4].Value;
                    break;
                case "addHorchata":
                    addItem(5);
                    numHorchata.Text = cookie[5].Value;
                    break;
                case "addJugo":
                    addItem(6);
                    numJugo.Text = cookie[6].Value;
                    break;
                default:
                    break;
            }
        }

        protected void removeItem(object sender, EventArgs e)
        {
            switch (((Button)sender).ID)
            {
                case "removeTamales":
                    removeItem(0);
                    numTamales.Text = cookie[0].Value;
                    break;
                case "removeCarnitas":
                    removeItem(1);
                    numCarnitas.Text = cookie[1].Value;
                    break;
                case "removeFrijoles":
                    removeItem(2);
                    numFrijoles.Text = cookie[2].Value;
                    break;
                case "removeChile":
                    removeItem(3);
                    numChile.Text = cookie[3].Value;
                    break;
                case "removeChilaquiles":
                    removeItem(4);
                    numChilaquiles.Text = cookie[4].Value;
                    break;
                case "removeHorchata":
                    removeItem(5);
                    numHorchata.Text = cookie[5].Value;
                    break;
                case "removeJugo":
                    removeItem(6);
                    numJugo.Text = cookie[6].Value;
                    break;
                default:
                    break;
            }
        }

        protected void changePage(object sender, EventArgs e)
        {
            User user = new User();

            user.InsertNewUser(userName.Text, cookie, menuItems);

            for (n=0;n<7;n++)
            {
                Response.Cookies.Add(cookie[n]);
            }
            Response.Redirect("Checkout.aspx");
        }
    }
}