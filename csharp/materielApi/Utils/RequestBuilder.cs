using System;
using System.Collections.Generic;
using System.Text;

namespace JDRIBAPI.Utils
{
    public class RequestBuilder
    {
        public StringBuilder request = new StringBuilder();
        public RequestBuilder() { }
        internal RequestBuilder Select(params string[] values)
        {
            request.Clear();
            request.Append("SELECT ");
            if (values.Length > 0)
            {
                foreach (string value in values)
                {
                    request.Append($"{value},");
                }
                request.Remove((request.Length - 1), 1);
            }
            else
            {
                request.Append("*");
            }
            return this;
        }

        internal RequestBuilder Insert(string table)
        {
            request.Clear();
            request.Append($"INSERT INTO {table}");
            return this;
        }
        
        internal string Values(Dictionary<string, dynamic> obj)
        {
            request.Append("(");
            foreach (var key in obj.Keys)
                request.Append($"{key},");
            request.Remove((request.Length - 1), 1);
            request.Append(") VALUES (");
            foreach (var key in obj.Keys)
            {
                if (obj[key] is string)
                    request.Append($"'{obj[key]}',");
                else if (obj[key] is int)
                    request.Append($"{obj[key]},");
                else if (obj[key] is double)
                {
                    string val = obj[key].ToString();
                    request.Append($"{val.Replace(',', '.')},");
                } else
                    request.Append($"'{obj[key]}',");
            }
            request.Remove((request.Length - 1), 1);
            request.Append(");");
            return request.ToString();
        }

        internal string Delete(string table, long id)
        {
            request.Clear();
            return request.Append($"DELETE FROM {table} where id = {id}").ToString();
        }

        internal string Get()
        {
            return request.ToString();
        }

        internal RequestBuilder Where(string key, dynamic value, string type = "=")
        {
            request.Append($" WHERE {key} {type} {value}");
            return this;
        }

        internal RequestBuilder From(string table)
        {
            request.Append($" FROM {table} ");
            return this;
        }

        internal RequestBuilder Update(string table)
        {
            request.Clear();
            request.Append($"UPDATE {table} ");
            return this;
        }

        internal RequestBuilder Set(Dictionary<string, dynamic> obj)
        {
            request.Append("SET ");
            foreach (var key in obj.Keys)
            {
                if (obj[key] is string)
                    request.Append($"{key} = '{obj[key]}',");
                else if (obj[key] is int)
                    request.Append($"{key} = {obj[key]},");
                else if (obj[key] is double)
                {
                    string val = obj[key].ToString();
                    request.Append($"{key} = {val.Replace(',', '.')},");
                }
                else
                    request.Append($"{key} = '{obj[key]}',");
            }
            request.Remove((request.Length - 1), 1);
            return this;
        }
    }
}
