using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Controllers
{
    public class getBannerController : Controller
    {
        WeirdosShopEntities _db = new WeirdosShopEntities();
        // GET: getBanner
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult getBanner()
        {
            var b = from t in _db.Banners
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(b.ToList());
        }
    }
}