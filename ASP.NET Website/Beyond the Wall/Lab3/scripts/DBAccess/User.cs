using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;

namespace Lab3.scripts.DBAccess
{
    public class User
    {
        public User() { }

        public int InsertNewUser(string name, HttpCookie[] cookies, String[] menu)
        {
            DataAccess dataAccess = new DataAccess();
            SqlParameter[] parameters = new SqlParameter[menu.Length+1];
            parameters[0] = new SqlParameter("Name", name);
            for (int i = 0; i < cookies.Length; i++)
            {
                parameters[i+1] = new SqlParameter(menu[i], Convert.ToInt32(cookies[i].Value));
            }

            string query = "spInsertNewUser";
            int rows = dataAccess.nonQuery(query, parameters);
            return rows;
        }
    }
}