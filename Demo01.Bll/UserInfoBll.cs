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
    public class UserInfoBll
    {
        readonly UserInfoDal dal = new UserInfoDal();
        public List<UserInfo> Search()
        {
            return dal.Search().ToList();
        }

        public IQueryable<UserInfo> Sel(Expression<Func<UserInfo, bool>> where)
        {
            return dal.Sel(where);
        }

        public UserInfo Sel_ID(Expression<Func<UserInfo, bool>> ID)
        {
            return dal.Sel_ID(ID);
        }

        public bool Ins(UserInfo model)
        {
            return dal.Ins(model);
        }

        public bool Del(UserInfo model)
        {
            return dal.Del(model);
        }

        public bool Upd(UserInfo model)
        {
            return dal.Upd(model);
        }
    }
}
