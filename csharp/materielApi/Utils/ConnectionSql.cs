﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Text;

namespace JDRIBAPI.Utils
{
    sealed class ConnectionSql
    {
        private static string server = "localhost";
        private static string user = "root";
        private static string password = "root";
        private static string db = "materiel";
        private static string port = "3306";

        private ConnectionSql() { }
        public static MySqlConnection getConnection()
        {
            return new MySqlConnection(getConnStr());
        }

        private static string getConnStr()
        {
            StringBuilder connStr = new StringBuilder();
            connStr.Append($"server={server};");
            connStr.Append($"user={user};");
            connStr.Append($"database={db};");
            connStr.Append($"port={port};");
            connStr.Append($"password={password}");
            return connStr.ToString();
        }
    }
}
