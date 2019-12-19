using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class xiaController : Controller
    {
        // GET: xia
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult tj1(IEnumerable<HttpPostedFileBase> input)
        {
            foreach (var file in input)
            {
                var filename = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/wenjian"), filename);
                file.SaveAs(path);
            }
            return RedirectToAction("Index");
        }
        [AllowAnonymous]
        public FileResult down(string name)
        {
            string filep = Server.MapPath("~/wenjian/" + name);
            return File(filep, "text/plain", filep);
        }

    }
}