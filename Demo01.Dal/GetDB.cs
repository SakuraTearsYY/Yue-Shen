using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo01.Dal
{
    public static  class GetDB
    {
        public static DbContext Get() 
        {
            Code_Entities db = new Code_Entities();
            return db;
        }
    }
}
