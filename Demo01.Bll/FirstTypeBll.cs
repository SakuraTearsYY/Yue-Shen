using Demo01.Dal;
using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Demo01.Bll
{
   public class FirstTypeBll
    {
        readonly FirstTypeDal dal = new FirstTypeDal();

        public List<FirstType> Search()
        {
            return dal.Search().ToList();
        }

        public IQueryable<FirstType> Sel(Expression<Func<FirstType, bool>> where)
        {
            return dal.Sel(where);
        }

        public FirstType Sel_ID(Expression<Func<FirstType, bool>> ID)
        {
            return dal.Sel_ID(ID);
        }

        public bool Ins(FirstType model)
        {
            return dal.Ins(model);
        }

        public bool Del(FirstType model)
        {
            return dal.Del(model);
        }

        public bool Upd(FirstType model)
        {
            return dal.Upd(model);
        }
    }
}
