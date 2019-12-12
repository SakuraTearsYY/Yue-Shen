using Demo01.Bll;
using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo01.UI.Controllers
{
    public class AccountController : Controller
    {

        readonly UserInfoBll userInfo = new UserInfoBll();
        // GET: Account/Details/5

        public ActionResult Login(UserInfo model) 
        {
            var data = userInfo.Sel(x => x.UserName == model.UserName & x.UserPwd == model.UserPwd);
            if (data.Count()>0)
            {
                Session["us"] = data.FirstOrDefault();

                return RedirectToAction("Index", "Home");
            }
            return View();
        }


        // POST: Account/Create
        [HttpPost]
        public ActionResult Create(UserInfo collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
    }
}
