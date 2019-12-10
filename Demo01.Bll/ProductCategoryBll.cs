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
    public class ProductCategoryBll
    {
        readonly ProductCategoryDal dal = new ProductCategoryDal();
        public List<ProductCategory> Search()
        {
            return dal.Search().ToList();
        }

        public IQueryable<ProductCategory> Sel(Expression<Func<ProductCategory, bool>> where)
        {
            return dal.Sel(where);
        }

        public ProductCategory Sel_ID(Expression<Func<ProductCategory, bool>> ID)
        {
            return dal.Sel_ID(ID);
        }

        public bool Ins(ProductCategory model)
        {
            return dal.Ins(model);
        }

        public bool Del(ProductCategory model)
        {
            return dal.Del(model);
        }

        public bool Upd(ProductCategory model)
        {
            return dal.Upd(model);
        }
    }
}
