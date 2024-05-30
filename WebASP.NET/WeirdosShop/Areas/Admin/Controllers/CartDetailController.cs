using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;

namespace WeirdosShop.Areas.Admin.Controllers
{
    public class CartDetailController : Controller
    {
        private WeirdosShopEntities db = new WeirdosShopEntities();

        // GET: Admin/CartDetail
        public ActionResult Index()
        {
            var cart_detail = db.Cart_detail.Include(c => c.Cart).Include(c => c.Product);
            return View(cart_detail.ToList());
        }

        // GET: Admin/CartDetail/Details/5
        public ActionResult Details(int? cartid, int? productid)
        {
            if (cartid == null || productid == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cart_detail cart_detail = db.Cart_detail.Find(cartid, productid);
            if (cart_detail == null)
            {
                return HttpNotFound();
            }
            return View(cart_detail);
        }
        // GET: Admin/CartDetail/Edit/5
        public ActionResult Edit(int? cartid, int? productid)
        {
            if (cartid == null || productid == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cart_detail cart_detail = db.Cart_detail.Find(cartid, productid);
            if (cart_detail == null)
            {
                return HttpNotFound();
            }

            var relatedCartDetails = db.Cart_detail.Where(c => c.cartid == cartid).ToList();
            ViewBag.RelatedCartDetails = relatedCartDetails;

            ViewBag.cartid = new SelectList(db.Carts, "id", "namecus", cart_detail.cartid);
            ViewBag.productid = new SelectList(db.Products, "id", "name", cart_detail.productid);
            return View(cart_detail);
        }

        // POST: Admin/CartDetail/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cartid,productid,quantity,sale,status,unitprice")] Cart_detail cart_detail)
        {
            if (ModelState.IsValid)
            {
                var cartDetailsToUpdate = db.Cart_detail.Where(cd => cd.cartid == cart_detail.cartid).ToList();

                foreach (var detail in cartDetailsToUpdate)
                {
                    detail.status = cart_detail.status;
                    db.Entry(detail).State = EntityState.Modified;
                }

                db.SaveChanges();

                return RedirectToAction("Index");
            }
            ViewBag.cartid = new SelectList(db.Carts, "id", "namecus", cart_detail.cartid);
            ViewBag.productid = new SelectList(db.Products, "id", "name", cart_detail.productid);
            return View(cart_detail);
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
