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
    public class Admin
    {

        public Admin()
        {

        }
        public int InsertNewAdmin(string name, string password)
        {
            DataAccess dataAccess = new DataAccess();
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("Name", name);
            parameters[1] = new SqlParameter("Password", encrypt(password));

            string query = "spInsertNewAdmin";
            int rows = dataAccess.nonQuery(query, parameters);
            return rows;
        }

        public DataSet selectAllOrders()
        {
            DataAccess dataAccess = new DataAccess();
            string query = "spGetUsers";
            DataSet userDS = dataAccess.getQuery(query);
            return userDS;
        }

        public Boolean getLogin(string name, string password)
        {
            DataAccess dataAccess = new DataAccess();
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("Name", name);
            parameters[1] = new SqlParameter("Password", encrypt(password));

            string query = "spGetAdmin";
            int row = dataAccess.nonQuery(query, parameters);
            System.Diagnostics.Debug.Write("\n" + row);
            if (row==-1)
            {
                return true;
            } else
            {
                return false;
            }
        }


        private Byte[] encrypt(string unencryptedString)
        {
            // encrypt password before inserted..
            Byte[] hashedDataBytes = null;
            UTF8Encoding encoder = new UTF8Encoding();

            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();

            hashedDataBytes = md5Hasher.ComputeHash(encoder.GetBytes(unencryptedString));

            return hashedDataBytes;
        }
    }


}