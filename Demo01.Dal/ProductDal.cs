using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Demo01.Dal
{
    public class ProductDal : BaseDal<Product>
    {
        readonly Code_Entities db = new Code_Entities();

        public int Count(Expression<Func<GroupModel, bool>> WhereLmbda)
        {
            return (from u in db.Product
                    join t in db.ProductCategory
                    on u.CategoryId equals t.Id
                    select new GroupModel { pro = u, Name = t.Name }).Where(WhereLmbda).Count();
        }

        public GroupModel GroupSel(Expression<Func<GroupModel, bool>> whereLambda)
        {
            var temp = (from u in db.Product
                        join t in db.ProductCategory
                        on u.CategoryId equals t.Id
                        select new GroupModel { pro = u, Name = t.Name });
            return temp.First(whereLambda);
        }
        //图表
        public List<IGrouping<string,ProductCategory>> GroupSelList()
        {
            var temp = (from u in db.Product
                        join t in db.ProductCategory on u.CategoryId equals t.Id
                        group t by t.Name into item select item).ToList();
            return temp;
        }

        public IQueryable<GroupModel> Pages<S>(int size, int pageIndex, Expression<Func<GroupModel, S>> orderby, Expression<Func<GroupModel, bool>> whereLambda, bool IsDesc)
        {
            if (IsDesc)
            {
                var temp = (from u in db.Product
                            join t in db.ProductCategory
                            on u.CategoryId equals t.Id
                            select new GroupModel { pro = u, Name = t.Name })
                            .Where(whereLambda)
                    .OrderByDescending(orderby)
                    .Skip(size * (pageIndex - 1))
                    .Take(size)
                    .AsQueryable();
                return temp;
            }
            else
            {
                var temp = (from u in db.Product
                            join t in db.ProductCategory
                            on u.CategoryId equals t.Id
                            select new GroupModel { pro = u, Name = t.Name })
                             .Where(whereLambda)
                    .OrderBy(orderby)
                    .Skip(size * (pageIndex - 1))
                    .Take(size)
                    .AsQueryable();
                return temp;
            }

        }
    }
}
