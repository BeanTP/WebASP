using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Controllers
{
    public class GeneralController : Controller
    {
        WeirdosShopEntities _db = new WeirdosShopEntities();
        // GET: General
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult getMenu()
        {
            var v = from t in _db.Menus
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
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