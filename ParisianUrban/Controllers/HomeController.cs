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

            if (Username == "admin" && Password == "admin")
            {
                ViewBag.greeting = "Weclome";

                return View("AdminLogin");
            }

            return Content("You fucked up fam");
        }
    }
}