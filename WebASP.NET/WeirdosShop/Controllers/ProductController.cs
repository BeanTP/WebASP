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
        public ActionResult getCategory(string meta, string id)
        {
            ViewBag.meta = meta;
            ViewBag.id = id;
            var e = from t in _db.Categories
                    where t.hide == true
                    select t;
            return PartialView(e.ToList());
        }
        public ActionResult getAllPro(long id, string meta, string cate, string check)
        {
            ViewBag.cate = cate;
            ViewBag.meta = meta;
            ViewBag.check = check;
            var e = from t in _db.Products
                    where t.hide == true && t.categoryid == id
                    orderby t.order ascending
                    select t;
            return PartialView(e.ToList());
        }
        public ActionResult Detail(string meta, string id)
        {
            ViewBag.cate = meta;
            ViewBag.meta = id;
            var e = from t in _db.Products
                    where t.meta == id
                    select t;
            return View(e.FirstOrDefault());
        }
        public ActionResult getSalePro(long id, string meta, string cate)
        {
            ViewBag.cate = cate;
            ViewBag.meta = meta;
            var e = from t in _db.Products
                    where t.hide == true && t.categoryid == id && t.sale != 0
                    orderby t.order ascending
                    select t;
            return PartialView(e.ToList());
        }
    }
}