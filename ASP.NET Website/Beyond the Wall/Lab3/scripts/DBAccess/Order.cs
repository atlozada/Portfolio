using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Lab3.scripts.DBAccess
{
    public class Order
    {
        public Order() { }

        public int InsertNewOrder(HttpCookie[] cookies, String[] menu)
        {
            DataAccess dataAccess = new DataAccess();
            SqlParameter[] parameters = new SqlParameter[menu.Length];

            for (int i = 0; i < cookies.Length; i++)
            {
                parameters[i] = new SqlParameter(menu[i], Convert.ToInt32(cookies[i].Value));
            }

            string query = "spInsertNewOrder";
            int rows = dataAccess.nonQuery(query, parameters);
            return rows;
        }

        public DataSet getLastOrderID()
        {
            DataAccess dataAccess = new DataAccess();
            string query = "spGetLastOrder";
            DataSet order = dataAccess.getQuery(query);
            return order;
        }
    }
}