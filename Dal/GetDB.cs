using Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal
{
    public static class GetDB
    {
        public static DbContext Get() 
        {
            BookStoreEntities db = new BookStoreEntities();
            return db;
        } 
    }
}
