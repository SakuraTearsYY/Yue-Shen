using Demo01.Bll;
using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo01.UI.Controllers
{
    public class HomeController : Controller
    {
        readonly ProductBll product = new ProductBll();
        readonly ProductCategoryBll productCategory = new ProductCategoryBll();
        readonly UserInfoBll user = new UserInfoBll();
        UserInfo us;
        int count, tem;
        public ActionResult Index()
        {
            count = product.Count();
            tem = count / 3;
            if (count % 3 != 0)
            {
                count = tem + 1;
            }
            else
            {
                count = tem;
            }
            ViewData["Count"] = count;
            ViewData["type"] = productCategory.Search();
            int mun = Convert.ToInt32(Session["User"]);
            us = Session["us"] as UserInfo;
            if (us==null)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
            
            
        }
        [HttpPost]
        public JsonResult Page(int ID = 1)
        {

            var data = product.Pages(3, ID, false);

            return Json(data);
        }
        [HttpPost]
        public JsonResult Sel(int Id)
        {
            var data = product.GroupSel(x => x.pro.Id == Id);

            if (data != null)
                return Json(data);
            return Json(0);
        }
        [HttpPost]
        public JsonResult Upd(int tid, string name, int price, int sprice, string det, int ty)
        {
            Product model = product.Sel_ID(x => x.Id == tid);
            model.ProductName = name;
            model.SellingPrice = price;
            model.MarketPrice = sprice;
            model.Introduction = det;
            model.CategoryId = ty;
            return Json(product.Upd(model));
        }
        [HttpPost]
        public JsonResult Del(int Id)
        {
            Product model = product.Sel_ID(x => x.Id == Id);
            return Json(product.Del(model));
        }

        [HttpPost]
        public JsonResult Count()
        {
            count = product.Count();
            tem = count / 3;
            if (count % 3 != 0)
            {
                count = tem + 1;
            }
            else
            {
                count = tem;
            }
            return Json(count);
        }
    }
}