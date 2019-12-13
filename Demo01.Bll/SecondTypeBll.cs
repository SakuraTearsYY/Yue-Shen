using Demo01.Dal;
using Demo01.Model;
using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Demo01.Bll
{
    public class SecondTypeBll
    {
        readonly SecondTypeDal dal = new SecondTypeDal();
        public List<SecondType> Search()
        {
            return dal.Search().ToList();
        }

        public IQueryable<SecondType> Sel(Expression<Func<SecondType, bool>> where)
        {
            return dal.Sel(where);
        }

        public SecondType Sel_ID(Expression<Func<SecondType, bool>> ID)
        {
            return dal.Sel_ID(ID);
        }

        public bool Ins(SecondType model)
        {
            return dal.Ins(model);
        }

        public bool Del(SecondType model)
        {
            return dal.Del(model);
        }

        public bool Upd(SecondType model)
        {
            return dal.Upd(model);
        }

        public IQueryable<MenuModel> Menu()
        {
            return dal.Menu();
        }
        public IQueryable<MenuModel> Menu(Expression<Func<MenuModel, bool>> where)
        {
            return Menu().Where(where);
        }
        public IQueryable<MenuModel> SeaAll()
        {
            return dal.SeaAll();
        }
        public List<MenuModel> SeaAll(Expression<Func<MenuModel, bool>> where)
        {
            return SeaAll().Where(where).ToList();
        }

    }
}
