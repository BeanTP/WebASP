using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Controllers
{
    public class HomeController : Controller
    {
        WeirdosShopEntities _db = new WeirdosShopEntities();
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
        public ActionResult getCategory()
        {
            ViewBag.meta = "collection";
            var e = from t in _db.Categories
                    where t.hide == true && t.order <= 3
                    select t;
            return PartialView(e.ToList());
        }
        public ActionResult getProduct(long id, string cate)
        {
            ViewBag.cate = cate;
            var e = from t in _db.Products
                    where t.hide == true && t.order == 1 && t.categoryid == id
                    select t;

            return PartialView(e.ToList());
        }
    }
}