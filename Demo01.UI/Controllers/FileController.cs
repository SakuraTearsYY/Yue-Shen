using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo01.UI.Controllers
{
    public class FileController : Controller
    {
        // GET: File
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult File(IEnumerable<HttpPostAttribute> file1) 
        {
            foreach (var item in file1)
            {
                var flie1 = Path.Combine();
            }
            return RedirectToAction("");
        }
    }
}