using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo01.UI.Filter
{
    public class MyFilterAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            
            if (filterContext.HttpContext.Session["us"] == null)
            {


                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary(new
                    {
                        Controller = "Account",
                        Action = "Login"
                    }));
            }
            //base.OnAuthorization(filterContext);
        }
    }
}