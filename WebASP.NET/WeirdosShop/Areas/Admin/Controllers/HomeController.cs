using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        WeirdosShopEntities db = new WeirdosShopEntities();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["idUser"] != null && Session["Role"].ToString().Trim().Equals("Admin"))
            {
                return View();
            }
            else
            {
                return Redirect("/User/Login");
            }
        }
    }
}