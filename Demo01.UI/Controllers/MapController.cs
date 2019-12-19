using Demo01.Bll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo01.UI.Controllers
{
    public class MapController : Controller
    {
        readonly ProductBll product = new ProductBll();
        // GET: Map
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Proctive()
        {
            return View();
        }

        //列表
        [HttpPost]
        public JsonResult sel()
        {
            var data = product.GroupSelList();
            return Json(data);
        }
    }
}