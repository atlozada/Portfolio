using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab3.scripts.DBAccess;
using System.Data;

namespace Lab3.Views
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void toggleVisible(object sender, EventArgs e)
        {
            if (orderControl.Visible == true)
            {
                orderControl.Visible = false;
            } else
            {
                orderControl.Visible = true;
            }
        }

        protected void addComment(object sender, EventArgs e)
        {
            Comment comment = new Comment();
            comment.insertNewComment(commentTextBox.Text);
        }

        protected void loadComments(object sender, EventArgs e)
        {

            Comment comment = new Comment();

            commentGrid.DataSource = comment.selectAllComments().Tables[0];
            commentGrid.DataBind();
        }
    }
}