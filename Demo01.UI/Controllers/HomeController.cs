using Demo01.Bll;
using Demo01.Model.Data;
using Demo01.UI.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Demo01.Model;

namespace Demo01.UI.Controllers
{
    [MyFilter]
    public class HomeController : Controller
    {
        readonly ProductBll product = new ProductBll();
        readonly ProductCategoryBll productCategory = new ProductCategoryBll();
        readonly UserInfoBll user = new UserInfoBll();
        readonly SecondTypeBll secondType = new SecondTypeBll();
        readonly FirstTypeBll first = new FirstTypeBll();
        private UserInfo us;
        int count, tem;
        public ActionResult Index()
        {
            ViewData["type"] = productCategory.Search();
            us = Session["us"] as UserInfo;
            return View();
        }
        [HttpPost]
        public JsonResult Page(int ID = 1, int SID = 0)
        {
            IQueryable data;
            if (SID == 0)
            {
                data = product.Pages(6, ID, x => true, false);
            }
            else
            {
                data = data = product.Pages(6, ID, x => x.pro.SecondID == SID, false);
            }

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
            if (tid != 0)
            {
                Product model = product.Sel_ID(x => x.Id == tid);
                model.ProductName = name;
                model.SellingPrice = price;
                model.MarketPrice = sprice;
                model.Introduction = det;
                model.CategoryId = ty;
                return Json(product.Upd(model));
            }
            else
            {
                Product model = new Product();
                model.ProductName = name;
                model.SellingPrice = price;
                model.MarketPrice = sprice;
                model.Introduction = det;
                model.CategoryId = ty;
                model.SecondID = ty;
                model.IsOnSale = true;
                model.AddTime = DateTime.Now;
                model.EndTime = default;
                return Json(product.Ins(model));
            }

        }
        [HttpPost]
        public JsonResult Del(int Id)
        {
            Product model = product.Sel_ID(x => x.Id == Id);
            return Json(product.Del(model));
        }

        [HttpPost]
        public JsonResult Count(int SID = 2)
        {
            if (SID == 0)
            {
                count = product.Count(x => true);
            }
            else
            {
                count = product.Count(x => x.pro.SecondID == SID);
            }

            tem = count / 6;
            if (count % 6 != 0)
            {
                count = tem + 1;
            }
            else
            {
                count = tem;
            }
            return Json(count);
        }

        [HttpPost]
        public JsonResult Menu()
        {
            UserInfo use = Session["us"] as UserInfo;
            List<MenuModel> data = secondType.SeaAll(x => x.UsersInfo.UserCord == use.UserCord);
            JsonSerializerSettings setting = new JsonSerializerSettings()
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                Formatting = Formatting.None
            };
            var ret = JsonConvert.SerializeObject(data, setting);
            return Json(ret);
        }

        public ActionResult Load(IEnumerable<HttpPostAttribute> file1)
        {
            foreach (var item in file1)
            {

            }
            return RedirectToAction("");
        }
    }
}