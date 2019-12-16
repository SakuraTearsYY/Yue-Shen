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
    public class ProductBll
    {
        readonly ProductDal dal = new ProductDal();
        /// <summary>
        /// 查询全部
        /// </summary>
        /// <returns>查询结果</returns>
        public List<Product> Search() 
        {
            return dal.Search().ToList();
        }
        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="where">条件 lambda表达式 例如（x=>x.id）</param>
        /// <returns>查询结果</returns>
        public IQueryable<Product> Sel(Expression<Func<Product, bool>> where)
        {
            return dal.Sel(where);
        }
        /// <summary>
        /// id查询
        /// </summary>
        /// <param name="ID">id</param>
        /// <returns>查询结果</returns>
        public Product Sel_ID(Expression<Func<Product, bool>> ID)
        {
            return dal.Sel_ID(ID);
        }
        /// <summary>
        /// 联合查询
        /// </summary>
        /// <param name="whereLambda">条件</param>
        /// <returns>第一个满足条件的结果</returns>
        public GroupModel GroupSel(Expression<Func<GroupModel, bool>> whereLambda) 
        {
            return dal.GroupSel(whereLambda);
        }
        /// <summary>
        /// 获取数据条数
        /// </summary>
        /// <returns>数据总条数</returns>
        public int Count(Expression<Func<GroupModel, bool>> whereLambda) 
        {
            return dal.Count(whereLambda);
        }
        /// <summary>
        /// 联合分页查询
        /// </summary>
        /// <param name="size">显示的条数</param>
        /// <param name="pageIndex">页数</param>
        /// <param name="IsDesc">是否降序</param>
        /// <returns>结果</returns>
        public IQueryable<GroupModel> Pages(int size, int pageIndex,Expression<Func<GroupModel,bool>>whereLambda , bool IsDesc)
        {
            return dal.Pages(size, pageIndex, x=>x.pro.Id, whereLambda, IsDesc);
        }
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model">实体</param>
        /// <returns>是否成功</returns>
        public bool Ins(Product model) 
        {
            return dal.Ins(model);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="model">实体</param>
        /// <returns>是否成功</returns>
        public bool Del(Product model) 
        {
            return dal.Del(model);
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model">实体</param>
        /// <returns>是否成功</returns>
        public bool Upd(Product model) 
        {
            return dal.Upd(model);
        }
    }
}
