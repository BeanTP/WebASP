using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Controllers
{
    public class NewsController : Controller
    {
        WeirdosShopEntities _db = new WeirdosShopEntities();
        // GET: News
        public ActionResult Index(string meta)
        {
            ViewBag.meta = meta;
            var e = from i in _db.News
                    where i.hide == true && i.meta == meta
                    orderby i.order ascending
                    select i;
            return View(e.ToList());
        }
        public ActionResult getAllNews()
        {
            ViewBag.meta = "news";
            var e = from t in _db.News
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(e.ToList());
        }
    }
}