using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Lab3.scripts.DBAccess
{
    public class Comment
    {
        public Comment() {}

        public int insertNewComment(string text)
        {
            DataAccess dataAccess = new DataAccess();
            SqlParameter parameters = new SqlParameter("comment", text);

            string query = "spInsertNewComment";
            int rows = dataAccess.nonQuery(query, parameters);
            return rows;
        }

        public DataSet selectAllComments()
        {
            DataAccess dataAccess = new DataAccess();
            string query = "spGetComments";
            DataSet commentDS = dataAccess.getQuery(query);
            return commentDS;
        }
    
    }
}