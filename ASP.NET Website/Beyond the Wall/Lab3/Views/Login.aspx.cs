using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab3.scripts.DBAccess;

namespace Lab3.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitLogin_Click(object sender, EventArgs e)
        {
            string name = loginName.Text;
            string pwd = password.Text;

                Admin admin = new Admin();
                if (admin.getLogin(name, pwd))
                {
                    HttpCookie cookie = new HttpCookie("admin");
                    cookie["admin"] = "true";
                    Response.Cookies.Add(cookie);
                }
        }

        protected void submitRegister_Click(object sender, EventArgs e)
        {
            string name = loginName.Text;
            string pwd = password.Text;


            if (pwd != "")
            {
                Admin admin = new Admin();
                admin.InsertNewAdmin(name, pwd);
            }

        }
    }
}