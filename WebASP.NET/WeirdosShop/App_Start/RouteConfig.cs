using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WeirdosShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("Products", "{type}/{meta}",
            new { controller = "Product", action = "Index", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "products" },
            },
            namespaces: new[] { "WeirdosShop.Controllers" });

            routes.MapRoute("Detail", "{type}/{meta}/{id}",
            new { controller = "Product", action = "Detail", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "products" },
            },
            namespaces: new[] { "WeirdosShop.Controllers" });

            routes.MapRoute("News", "{type}/{meta}",
            new { controller = "News", action = "Index", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "news" },
            },
            namespaces: new[] { "WeirdosShop.Controllers" });

            routes.MapRoute(
                name: "Cart",
                url: "Cart",
                defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "WeirdosShop.Controllers" }
            );
            routes.MapRoute(
                name: "Checkout",
                url: "Checkout",
                defaults: new { controller = "Cart", action = "Checkout", id = UrlParameter.Optional },
                namespaces: new[] { "WeirdosShop.Controllers" }
            );
            routes.MapRoute(
                name: "Success Order",
                url: "success",
                defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
                namespaces: new[] { "WeirdosShop.Controllers" }
            );

            routes.MapRoute(
                name: "Add Cart",
                url: "add-to-cart",
                defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
                namespaces: new[] { "WeirdosShop.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "WeirdosShop.Controllers" }
            );
        }
    }
}
