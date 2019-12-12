using Demo01.Bll;
using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo01.Dal;
using HPIT.Data.Core;

namespace Demo01.UI.Controllers
{
    public class AccountController : Controller
    {

        readonly UserInfoBll userInfo = new UserInfoBll();
        // GET: Account/Details/5

        public ActionResult Login(UserInfo model) 
        {
            if (model!=null)
            {
                var data = userInfo.Sel(x => x.UserName == model.UserName & x.UserPwd == model.UserPwd);
                if (data.Count() > 0)
                {
                    Session["us"] = data.FirstOrDefault();
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }


        // POST: Account/Create
        [HttpPost]
        public ActionResult Create(UserInfo model)
        {
            
            if (userInfo.Ins(model))
            {
                
                return RedirectToAction("Login");
                
               
            }
            
            return View();
        }
        [HttpPost]
        public JsonResult Vad(string name,string pwd) 
        {
            var data = userInfo.Sel(x => x.UserName == name & x.UserPwd == pwd);
            if (data.Count()>0)
            {
                LogHelper.Default.WriteInfo(data.First().UserName+"登录");
                Session["us"] = data.FirstOrDefault();
                return Json(true);
            }
            return Json(false);
        }
    }
}
