using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Demo01.Dal
{
    public class BaseDal<T> where T : class, new()
    {
        readonly DbContext db = GetDB.Get();
        
        /// <summary>
        /// 查询全部
        /// </summary>
        /// <returns></returns>
        public IQueryable<T> Search()
        {
            return db.Set<T>().AsQueryable();
        }

        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="where">条件</param>
        /// <returns>查询结果</returns>
        public IQueryable<T> Sel(Expression<Func<T, bool>> where)
        {
            return Search().Where(where).AsQueryable();
        }

        /// <summary>
        /// id查询
        /// </summary>
        /// <param name="ID">条件</param>
        /// <returns>查询单个</returns>
        public T Sel_ID(Expression<Func<T, bool>> ID)
        {
            return Search().First(ID);
        }

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <typeparam name="S">排序的数据类型</typeparam>
        /// <param name="size">显示数据的条数</param>
        /// <param name="pageIndex">页数</param>
        /// <param name="count">总数据量</param>
        /// <param name="orderby">排序字段</param>
        /// <param name="IsDesc">受否降序</param>
        /// <returns>结果</returns>
        public IQueryable<T> Page<S>(int size, int pageIndex, out int count, Expression<Func<T, S>> orderby, bool IsDesc)
        {
            count = db.Set<T>().Count();
            if (IsDesc)
            {
                var Temp = db.Set<T>()
                    .OrderByDescending(orderby)
                    .Skip(size * (pageIndex - 1))
                    .Take(size).AsQueryable();
                return Temp;
            }
            else
            {
                var Temp = db.Set<T>()
                    .OrderBy(orderby)
                    .Skip(size * (pageIndex - 1))
                    .Take(size).AsQueryable();
                return Temp;
            }
        }

        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model">实体</param>
        /// <returns>bool类型 执行的结果</returns>
        public bool Ins(T model)
        {
            db.Set<T>().Add(model);
            return db.SaveChanges() > 0;
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="model">实体</param>
        /// <returns>bool类型 执行的结果</returns>
        public bool Del(T model)
        {
            db.Entry(model).State = EntityState.Deleted;
            return db.SaveChanges() > 0;
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="model">实体</param>
        /// <returns>bool类型 执行的结果</returns>
        public bool Upd(T model)
        {
            db.Entry(model).State = EntityState.Modified;
            return db.SaveChanges() > 0;
        }
    }
}
