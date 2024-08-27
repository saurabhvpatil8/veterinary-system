using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Veterinary_System.ADO
{
    public class DBConfig
    {
        //public string strConnection = "";

        public MySqlConnection Database = new MySqlConnection("server=localhost;database=vet;uid=root;pwd=root;");
        //public MySqlConnection Database()
        //{
        //    return sqlConnection;
        //}
    }
}