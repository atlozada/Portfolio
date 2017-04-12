using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3.Views
{
    public partial class Checkout : System.Web.UI.Page
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
        int n;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (n = 0; n < menuItems.Length; n++)
                {
                    cookie[n] = Request.Cookies[menuItems[n]];
                }

                if (cookie[0] == null)
                {
                    Response.Redirect("EnableCookies.html");
                }
                FillLabels();
            }
        }

        protected void FillLabels()
        {
            try
            {
                Label1.Text = cookie[0].Value;
                Label2.Text = cookie[1].Value;
                Label3.Text = cookie[2].Value;
                Label4.Text = cookie[3].Value;
                Label5.Text = cookie[4].Value;
                Label6.Text = cookie[5].Value;
                Label7.Text = cookie[6].Value;
            } catch (NullReferenceException)
            {
                Label1.Text = "Error displaying order, do not worry, your order has been successfully filled!";
                Label2.Text = "";
                Label3.Text = "";
                Label4.Text = "";
                Label5.Text = "";
                Label6.Text = "";
                Label7.Text = "";
            }

            for (n=0; n < menuItems.Length; n++)
            {
                cookie[n].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie[n]);
            }
        }
    }
}