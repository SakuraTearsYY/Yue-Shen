using Bll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        readonly BookBll book = new BookBll();
        int count;
        int size;
        [HttpPost]
        public JsonResult Page(int ind = 1) 
        { 
            var data = book.Page(10, ind, out count);
            return Json(data);
        }
        public ActionResult Index()
        {

            count = book.Count();
            size = count / 10;
            if (count % 10 != 0)
                size += 1;
            else
                size = count / 10;
            ViewData["Count"] = size;
            return View();
        }

       
    }
}