using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace MyProject1.Models
{
    public class DBManager
    {
        SqlConnection connection = new SqlConnection("Data Source=LAPTOP-AA7IFALL\\SQLEXPRESS;Initial Catalog=Zepto;Integrated Security=True");  
        public int executeInsertUpdateDelete(string query)
        {
            SqlCommand cmd = new SqlCommand (query,connection);
            connection.Open();
           int result= cmd.ExecuteNonQuery();
            connection.Close ();
            return result;
        }
        public DataTable executeSelect(string query)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(query,connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
    }
}