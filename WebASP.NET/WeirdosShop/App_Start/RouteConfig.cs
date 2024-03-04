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
            new[] { "WeirdosShop.Controllers" });

            routes.MapRoute("News", "{type}/{meta}",
            new { controller = "News", action = "Index", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "news" },
            },
            new[] { "WeirdosShop.Controllers" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
