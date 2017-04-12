using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Lab3.scripts.DBAccess
{
    public class DataAccess
    {
        string myConnectionString = ConfigurationManager.ConnectionStrings["BtwDB"].ToString();

        public DataAccess() { }

        public SqlConnection createConnection()
        {
            SqlConnection myConnection = new SqlConnection(myConnectionString);
            myConnection.Open();
            return myConnection;
        }

        public DataSet getQuery(string myQuery, params SqlParameter[] myParameters)
        {
            DataSet myDataSet = new DataSet();
            SqlCommand myCommand = new SqlCommand(myQuery);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddRange(myParameters);

            SqlConnection myConnection = createConnection();
            myCommand.Connection = myConnection;

            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommand);
            myAdapter.Fill(myDataSet);
            myConnection.Close();
            return myDataSet;
        }

        public DataSet getQuery(string myQuery)
        {
            DataSet myDataSet = new DataSet();
            SqlCommand myCommand = new SqlCommand(myQuery);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlConnection myConnection = createConnection();
            myCommand.Connection = myConnection;

            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommand);
            myAdapter.Fill(myDataSet);
            myConnection.Close();
            return myDataSet;
        }

        public void nonQuery(string myQuery)
        {
            SqlCommand myCommand = new SqlCommand(myQuery);
            SqlConnection myConnection = createConnection();
            myCommand.Connection = myConnection;
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }

        public int nonQuery(string myQuery, params SqlParameter[] myParameters)
        {
            SqlCommand myCommand = new SqlCommand(myQuery);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddRange(myParameters);
            SqlConnection myConnection = createConnection();
            myCommand.Connection = myConnection;
            int test = myCommand.ExecuteNonQuery();
            myConnection.Close();



            return test;

        }


        public int executeScalar(string myQuery, params SqlParameter[] myParameters)
        {
            SqlCommand myCommand = new SqlCommand(myQuery);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddRange(myParameters);
            SqlConnection myConnection = createConnection();
            myCommand.Connection = myConnection;
            int test = Convert.ToInt32(myCommand.ExecuteScalar());

            myConnection.Close();

            return test;

        }
    }
}