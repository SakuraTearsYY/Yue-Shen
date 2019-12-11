using Demo01.Bll;
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
        int count;
        public ActionResult Index()
        {
            count = product.Count();
            int tem = count / 3;
            if (count % 3 != 0)
            {
                count = tem + 1;
            }
            else
            {
                count = tem;
            }
            ViewData["Count"] = count;
            return View();
        }
        [HttpPost]
        public JsonResult Page(int ID = 1) 
        {
            
            var data = product.Pages(3, ID, false);
           
            return Json(data);
        }
    }
}