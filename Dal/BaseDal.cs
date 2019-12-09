using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Dal
{
   public  class BaseDal<T> where T :class ,new()
    {
        readonly DbContext db = GetDB.Get();


        public List<T> Sel() 
        {
            return db.Set<T>().ToList();
        }
        public List<T> Page<S>(int size,int index, out int count,
            Expression<Func<T,S>>ORDER,bool isDesc) 
        {
            count = db.Set<T>().Count();
            if (isDesc)
            {
                var temp = db.Set<T>()
                    .OrderByDescending(ORDER)
                    .Skip(size * (index - 1))
                    .Take(size).ToList();
                return temp;
            }
            else
            {
                var temp = db.Set<T>()
                .OrderBy(ORDER)
                .Skip(size * (index - 1))
                .Take(size).ToList();
                return temp;
            }
        }
    }
}
