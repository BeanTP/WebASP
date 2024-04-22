using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Help;
using WeirdosShop.Models;

namespace WeirdosShop.Areas.Admin.Controllers
{
    public class FootersController : Controller
    {
        private WeirdosShopEntities db = new WeirdosShopEntities();

        // GET: Admin/Footers
        public ActionResult Index()
        {
            return View(db.Footers.ToList());
        }

        // GET: Admin/Footers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            return View(footer);
        }

        // GET: Admin/Footers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Footers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,name,link,meta,hide,order,datebegin,type,description,img")] Footer footer, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                var path = "";
                var filename = "";
                if (img != null)
                {
                    filename = img.FileName;
                    //path = Path.Combine(Server.MapPath("~/Content/images/Banner"), filename);
                    //img.SaveAs(path);
                    footer.img = filename;
                }
                else
                {
                    footer.img = "hahahehe.jpg";
                }
                footer.datebegin = Convert.ToDateTime(DateTime.Now.ToLocalTime());
                footer.meta = Functions.ConvertToUnSign(footer.name);
                db.Footers.Add(footer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(footer);
        }

        // GET: Admin/Footers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            return View(footer);
        }

        // POST: Admin/Footers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,name,link,meta,hide,order,datebegin,type,description,img")] Footer footer, HttpPostedFileBase img)
        {
            var path = "";
            var filename = "";
            Footer temp = getById(footer.id);
            if (ModelState.IsValid)
            {
                if (img != null)
                {
                    filename = img.FileName;
                    //path = Path.Combine(Server.MapPath("~/Content/images/Banner"), filename);
                    //img.SaveAs(path);
                    temp.img = filename;
                }
                temp.name = footer.name;
                temp.link = footer.link;
                temp.meta = Functions.ConvertToUnSign(temp.name);
                temp.hide = footer.hide;
                temp.order = footer.order;
                temp.datebegin = Convert.ToDateTime(DateTime.Now.ToLocalTime());
                temp.type = footer.type;
                temp.description = footer.description;
                db.Entry(temp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(footer);
        }
        public Footer getById(long id)
        {
            return db.Footers.Where(x => x.id == id).FirstOrDefault();

        }
        // GET: Admin/Footers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            return View(footer);
        }

        // POST: Admin/Footers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Footer footer = db.Footers.Find(id);
            db.Footers.Remove(footer);
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
