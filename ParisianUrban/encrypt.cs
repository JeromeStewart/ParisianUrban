using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParisianUrban
{
    public static class encrypt
    {
        public static string hash(string password)
        {
            return Convert.ToBase64String(
                System.Security.Cryptography.SHA256.Create()
                .ComputeHash(System.Text.Encoding.UTF8.GetBytes(password)));
        }
    }
}