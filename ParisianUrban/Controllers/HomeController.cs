using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ParisianUrban.Controllers
{
    public class HomeController : Controller
    {
        private Entities en = new Entities();
       
        // GET: Home
        public ActionResult HomeDisplay()
        {
   
            return View("HomePage");
        }
    
        [HttpGet]
        public ActionResult AdminDisplay()
        {
            return View("AdminLogin");
        }

        [HttpPost]
        public ActionResult AdminDisplay(Admin admin)
        {
           
            if (!ModelState.IsValid)
            {
               Admin  myAdmin = new Admin()
                {
                    ID = admin.ID,
                    Password = admin.Password
                };

                return View("AdminLogin", admin);
               
            }

            var query = (
                   from db in en.Admins
                   where db.ID == admin.ID && db.Password == admin.Password
                   select new
                   {
                       db.ID,
                       db.Password,
                       db.Name
                   }).ToList();

            if (query.FirstOrDefault() != null)
            {
                foreach (var item in query)
                {
                    ViewBag.greeting = "Welcome " + query.FirstOrDefault().Name;

                    Session["ID"] = query.FirstOrDefault().ID;

                    Session["Password"] = query.FirstOrDefault().Password;
                }

                return View("AdminLogin");
            }

            ViewBag.greeting = "Incorrect credentials";

            return View("AdminLogin");

        }
    }
}

