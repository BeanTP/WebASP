using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;
using WeirdosShop.Help;
using System.Reflection;

namespace WeirdosShop.Areas.Admin.Controllers
{
    public class NewsController : Controller
    {
        private WeirdosShopEntities db = new WeirdosShopEntities();

        // GET: Admin/News
        public ActionResult Index()
        {
            return View(db.News.ToList());
        }

        // GET: Admin/News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: Admin/News/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/News/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,name,img,description,detail,meta,hide,order,datebegin")] News news, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                var filename = "";
                if (img != null)
                {
                    filename = img.FileName;
                    //path = Path.Combine(Server.MapPath("~/Content/images/Banner"), filename);
                    //img.SaveAs(path);
                    news.img = filename;
                }
                else
                {
                    news.img = "hahahehe.jpg";
                }
                news.datebegin = Convert.ToDateTime(DateTime.Now.ToLocalTime());
                db.News.Add(news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(news);
        }

        // GET: Admin/News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: Admin/News/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,name,img,description,detail,meta,hide,order,datebegin")] News news, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                var filename = "";
                News temp = getById(news.id);
                if (img != null)
                {
                    filename = img.FileName;
                    //path = Path.Combine(Server.MapPath("~/Content/images/Banner"), filename);
                    //img.SaveAs(path);
                    temp.img = filename;
                }
                temp.name = news.name;
                temp.meta = news.meta;
                temp.description = news.description;
                temp.detail = news.detail;
                temp.order = news.order;
                temp.hide = news.hide;
                temp.datebegin = Convert.ToDateTime(DateTime.Now.ToLocalTime());
                db.Entry(temp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(news);
        }
        public News getById(long id)
        {
            return db.News.Where(x => x.id == id).FirstOrDefault();

        }
        // GET: Admin/News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: Admin/News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            db.News.Remove(news);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
