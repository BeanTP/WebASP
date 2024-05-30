using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeirdosShop.Models;
using System.Web.Script.Serialization;
using System.Diagnostics;

namespace WeirdosShop.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        WeirdosShopEntities _db = new WeirdosShopEntities();
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        public ActionResult AddItem(int productId, int quantity)
        {
            var products = _db.Products.Find(productId);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.product.id == productId))
                {
                    foreach (var item in list)
                    {
                        if (item.product.id == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.product = products;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                Session[CartSession] = list;
            }
            else
            {
                var item = new CartItem();
                item.product = products;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }
        public JsonResult UpdateItem(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];
            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.product.id == item.product.id);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult DeleteCart()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult DeleteItem(long id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.product.id == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        [HttpGet]
        public ActionResult Checkout()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        [HttpPost]
        public ActionResult Checkout(string c_name, string c_email, string c_phonenum, string c_address)
        {
            var order = new Cart();
            order.datebegin = DateTime.Now;
            order.namecus = c_name;
            order.addresscus = c_address;
            order.emailcus = c_email;
            order.phonenum = c_phonenum;
            _db.Carts.Add(order);
            _db.SaveChanges();

            var orderId = order.id;
            var cart = (List<CartItem>)Session[CartSession];
            foreach (var item in cart)
            {
                var orderDetail = new Cart_detail();
                orderDetail.cartid = orderId;
                orderDetail.productid = item.product.id;
                if(item.product.sale == 0)
                {
                    orderDetail.unitprice = item.product.price * item.Quantity;
                }
                else
                {
                    orderDetail.unitprice = (item.product.price - item.product.price * item.product.sale/100) * item.Quantity;
                }
                orderDetail.sale = item.product.sale;
                orderDetail.quantity = item.Quantity;
                orderDetail.status = 0; //Xac nhan don hang
                _db.Cart_detail.Add(orderDetail);
                _db.SaveChanges();
            }

            Session[CartSession] = null;
            return Redirect("/success");
        }
        public ActionResult Success()
        {
            return View();
        }
    }
}