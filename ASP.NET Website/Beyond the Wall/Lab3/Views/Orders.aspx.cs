using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using Lab3.scripts.DBAccess;

namespace Lab3.Views
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            HttpCookie cookie = Response.Cookies["admin"];
            try
            {
                if (cookie["admin"] == "true")
                {
                    fillOrders();
                }
                else
                {
                    notAdmin();
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("EnableCookies.html");
            }
        }
        public void fillOrders()
        {
            Admin admin = new Admin();
            dgOrders.DataSource = admin.selectAllOrders().Tables[0];
            dgOrders.DataBind();
        }

        public void notAdmin()
        {
            errorLabel.Text = "Only admins can view orders!";
        }
    }
}