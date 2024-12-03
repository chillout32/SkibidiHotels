using System;
using Npgsql;

namespace skibidihotels;

    public class DatabaseConnect
    {
        private string _connectionString;

        public DatabaseConnect()
        {
            _connectionString = "Host=localhost;Username=postgres;Password=trummor;Database=postgres";

        }

        public NpgsqlConnection GetConnection()
        {   
            var conn = new NpgsqlConnection(_connectionString);
            conn.Open();
            return conn;
        }
    }
