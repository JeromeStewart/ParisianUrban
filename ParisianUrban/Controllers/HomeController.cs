using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParisianUrban.Models;

namespace ParisianUrban.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult HomeDisplay()
        {
            return View("HomePage");
        }
    
        public ActionResult AdminDisplay()
        {
            return View("AdminLogin");
        }

        [HttpPost]
        public ActionResult AdminDisplay(string Username , string Password)
        {
            Admin admin = new Admin();



            if (Username == "admin" && Password == "admin")
            {
                admin.Name = "Jerome";
                ViewBag.greeting = "Weclome " + admin.Name;

                return View("AdminLogin");
            }

            return Content("Something went wrong :(");
        }
    }
}