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
        public IQueryable<GroupModel> Pages<S>(int size, int pageIndex, out int count, Expression<Func<GroupModel, S>> orderby, bool IsDesc)
        {
            
            if (IsDesc)
            {
                var temp = (from u in db.Product
                            join t in db.ProductCategory
                            on u.CategoryId equals t.Id
                            select new GroupModel { pro = u, Name = t.Name })
                    .OrderByDescending(orderby)
                    .Skip(size * (pageIndex - 1))
                    .Take(size)
                    .AsQueryable();
                count = temp.Count();
                return temp;
            }
            else
            {
                var temp = (from u in db.Product
                            join t in db.ProductCategory
                            on u.CategoryId equals t.Id
                            select new GroupModel { pro = u, Name = t.Name })
                    .OrderBy(orderby)
                    .Skip(size * (pageIndex - 1))
                    .Take(size)
                    .AsQueryable();
                count = temp.Count();
                return temp;
            }
             
        }
    }
}
