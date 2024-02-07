using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Controllers
{
    public class GetMenuController : Controller
    {
        WeirdosShopEntities _db = new WeirdosShopEntities();
        // GET: GetMenu
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
    }
}