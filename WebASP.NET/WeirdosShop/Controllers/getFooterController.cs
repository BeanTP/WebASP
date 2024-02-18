using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Controllers
{
    public class getFooterController : Controller
    {
        WeirdosShopEntities _db = new WeirdosShopEntities();
        // GET: getFooter
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getFooter()
        {
            var f = from e in _db.Footers
                    where e.hide == true
                    orderby e.order ascending
                    select e;
            return PartialView(f.ToList());
        }
    }
}