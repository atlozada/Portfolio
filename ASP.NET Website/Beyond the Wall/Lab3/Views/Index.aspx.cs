using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3.Views
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Response.Cookies["admin"];

            if(cookie["admin"] == null)
            {
                cookie["admin"] = "false";
                Response.Cookies.Add(cookie);
            }
        }
    }
}