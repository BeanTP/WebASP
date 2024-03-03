using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Controllers
{
    public class ProductController : Controller
    {
        WeirdosShopEntities _db = new WeirdosShopEntities();
        // GET: Product
        public ActionResult Index(string meta)
        {
            ViewBag.meta = meta;
            var e = from t in _db.Categories
                    where t.meta == meta
                    select t;
            return View(e.FirstOrDefault());
        }
        public ActionResult getCategory()
        {
            var e = from t in _db.Categories
                    where t.hide == true
                    select t;
            return PartialView(e.ToList());
        }
        public ActionResult getAllPro(long id, string cate)
        {
            ViewBag.cate = cate;
            var e = from t in _db.Products
                    where t.hide == true && t.categoryid == id
                    orderby t.order ascending
                    select t;
            return PartialView(e.ToList());
        }
    }
}