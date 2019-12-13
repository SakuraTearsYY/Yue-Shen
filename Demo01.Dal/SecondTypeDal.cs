using Demo01.Model;
using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Demo01.Dal
{
   public class SecondTypeDal:BaseDal<SecondType>
    {
        readonly Code_Entities db = new Code_Entities();
        public IQueryable<MenuModel> Menu() 
        {
            var temp = (from u in db.FirstType
                        join t in db.SecondType
                        on u.FirstID equals t.FirstID
                        into users
                        from us in users.DefaultIfEmpty()
                        select new MenuModel { FirstMenu = u, SecondMenu = us }).AsQueryable();
            return temp;
        }
        public IQueryable<MenuModel> Menu(Expression<Func<MenuModel, bool>> where) 
        {
            return Menu().Where(where);
        }
        public IQueryable<MenuModel> SeaAll() 
        {
            var temp = (from u in db.UserInfo
                        join f in db.FirstType
                        on u.UserID equals f.UserID
                        join us in db.SecondType
                        on f.FirstID equals us.FirstID
                        into users
                        from us in users.DefaultIfEmpty()
                        select new MenuModel { UsersInfo = u,FirstMenu = f,SecondMenu = us}).AsQueryable();
            return temp;
        }
        public IQueryable<MenuModel> SeaAll(Expression<Func<MenuModel, bool>> where) 
        {
            return SeaAll().Where(where);
        }
    }
}
