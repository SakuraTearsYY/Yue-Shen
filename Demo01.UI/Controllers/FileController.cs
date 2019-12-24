using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HPIT.Data.Core;
using HPIT.Survey.Portal.Filters;

namespace Demo01.UI.Controllers
{
    public class FileController : Controller
    {
        // GET: File
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UploadFiles(IEnumerable<HttpPostedFileBase> fileBases)
        {
            if (fileBases != null)
            {
                foreach (var file in fileBases)
                {
                    var filename = Path.GetFileName(file.FileName);
                    if (filename != null)
                    {
                        var path = Path.Combine(Server.MapPath("~/Upload"), filename);
                        file.SaveAs(path);
                    }
                   
                }
                return RedirectToAction("FileListIndex");
            }
            return View();
        }

        [AllowAnonymous]
        public ActionResult FileIndex()
        {
            return View();
        }

        [AllowAnonymous]
        public FileResult download(string filename)
        {
            string filePath = Server.MapPath("~/Upload/" + filename);
            return File(filePath, "text/plain", filename);
        }

        [AllowAnonymous]
        public JsonResult GetFileList(SearchModel<FileModel> search)
        {
            int total = 0;
            var filePath = Server.MapPath("~/Upload");
            DirectoryInfo Dtinfo = new DirectoryInfo(filePath);
            FileInfo[] allfiles = Dtinfo.GetFiles();
            var data = from file in allfiles
                       select new
                       {
                           filename = file.Name,
                           path = file.DirectoryName,
                           time = file.LastWriteTime,
                           fullname = file.FullName
                       };
            total = allfiles.Length;
            var totalPages = total % search.PageSize == 0 ? total / search.PageSize : total / search.PageSize + 1;
            JsonResult result = new JsonResult();
            var pagedata = data.Skip((search.PageIndex - 1) * search.PageSize).Take(search.PageSize);
            result.Data = new { Data = data, Total = total, TotalPages = totalPages };
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return new DeluxeJsonResult(new { Data = pagedata, Total = total, TotalPages = totalPages }, "yyyy-MM-dd HH: mm");
        }

        [AllowAnonymous]
        public ActionResult FileListIndex()
        {
            return View();
        }
    }
}