using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;
using System.Security.Cryptography;
using System.Text;
using System.Data.Entity.Infrastructure;

namespace WeirdosShop.Controllers
{
    public class UserController : Controller
    {
        private WeirdosShopEntities db = new WeirdosShopEntities();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        //GET: Register
        public ActionResult Register()
        {
            return View();
        }
        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User user)
        {
            if(ModelState.IsValid)
            {
                var check = db.Users.FirstOrDefault(m => m.username == user.username);
                if(check == null)
                {
                    user.password = GetMD5(user.password);
                    user.role = "Client";
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Users.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.error = "Username đã tồn tại";
                    return View();
                }
            }
            return View();
        }
        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
        //GET: Login
        public ActionResult Login()
        {
            return View();
        }
        //POST: Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            if (ModelState.IsValid)
            {
                var f_password = GetMD5(password);
                var data = db.Users.Where(s => s.username.Equals(username) && s.password.Equals(f_password)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["Name"] = data.FirstOrDefault().name;
                    Session["Email"] = data.FirstOrDefault().email;
                    Session["Address"] = data.FirstOrDefault().address;
                    Session["Phone"] = data.FirstOrDefault().phonenum;

                    Session["Role"] = data.FirstOrDefault().role;
                    Session["idUser"] = data.FirstOrDefault().id;

                    return Redirect("/home");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }
        //Logout
        public ActionResult Logout()
        {
            Session.Clear();
            return Redirect("/home");
        }
    }
}