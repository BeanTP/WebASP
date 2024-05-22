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

namespace WeirdosShop.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {
        private WeirdosShopEntities db = new WeirdosShopEntities();

        // GET: Admin/Products
        public ActionResult Index()
        {
            ViewBag.Category = new SelectList(db.Categories, "id", "name");
            return View();
        }
        
        public ActionResult getProduct(long? id)
        {
            if (id == null)
            {
                var v = db.Products.OrderBy(x => x.order).ToList();
                return PartialView(v);
            }
            var m = db.Products.Where(x => x.categoryid == id).OrderBy(x => x.order).ToList();
            return PartialView(m);
        }
        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.categoryid = new SelectList(db.Categories, "id", "name");
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)] 
        public ActionResult Create([Bind(Include = "id,name,price,description,meta,size,color,hide,order,datebegin,categoryid,img,img1,img2,img3,sale")] Product product, HttpPostedFileBase img, HttpPostedFileBase img1, HttpPostedFileBase img2, HttpPostedFileBase img3)
        {
            if (ModelState.IsValid)
            {
                var filename = "";
                if (img != null)
                {
                    filename = img.FileName;
                    product.img = filename;
                }
                else
                {
                    product.img = "hahahehe.jpg";
                }

                if (img1 != null)
                {
                    filename = img1.FileName;
                    product.img1 = filename;
                }
               
                if (img2 != null)
                {
                    filename = img2.FileName;
                    product.img2 = filename;
                }
               
                if (img3 != null)
                {
                    filename = img.FileName;
                    product.img3 = filename;
                }

                if (product.sale == null)
                {
                    product.sale = 0;
                }

                product.datebegin = Convert.ToDateTime(DateTime.Now.ToLocalTime());
                product.meta = Functions.ConvertToUnSign(product.meta);
                product.order = getMaxOrder(product.categoryid) + 1;
                product.description = Functions.StripHtmlTags(product.description);
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index", "Products", new { id = product.categoryid });
            }

            ViewBag.categoryid = new SelectList(db.Categories, "id", "name", product.categoryid);
            return View(product);
        }
        public int getMaxOrder(long? CategoryId)
        {
            if (CategoryId == null)
                return 1;
            return db.Products.Where(x => x.categoryid == CategoryId).Count();
        }
        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryid = new SelectList(db.Categories, "id", "name", product.categoryid);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,price,description,meta,size,color,hide,order,datebegin,categoryid,img,img1,img2,img3,sale")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categoryid = new SelectList(db.Categories, "id", "name", product.categoryid);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
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
