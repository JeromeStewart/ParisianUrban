using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ParisianUrban.Controllers
{
    public class HomeController : Controller
    {
        private ParisianDBEntities DbContext = new ParisianDBEntities();
      
        // GET: Home
        [HttpGet]
        public ActionResult HomeDisplay()
        {
   
            return View("HomePage");
        }

        public ActionResult index()
        {
            ViewBag.name = TempData["userName"];

            return View("Main");
        }

        [HttpPost]
        public ActionResult HomeDisplay(User user)
        {
            if (ModelState.IsValid)
            {
                user.PasswordHash = encrypt.hash(user.PasswordHash);

                DbContext.Users.Add(user);

                DbContext.SaveChanges();

                ViewBag.greeting = "Thank you for registering!";

                return RedirectToAction("Login","Auth");
               
            }    
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
                   from db in DbContext.Admins
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

        [HttpGet]
        [Route(Name = "Login")]
        public ActionResult UserLogin()
        {

            return View("Login");
        }

        [HttpPost]
        [Route(Name = "Login")]
        public ActionResult UserLogin(User user)
        {

            var query = (
                  from db in DbContext.Users
                  where db.ID == user.ID && db.PasswordHash == user.PasswordHash
                  select new
                  {
                      db.ID,
                      db.PasswordHash,
                      db.Firstname
                  }).ToList();

            if (query.FirstOrDefault() != null)
            {
                foreach (var item in query)
                {
                    ViewBag.greeting = "Welcome " + query.FirstOrDefault().Firstname;

                    Session["ID"] = query.FirstOrDefault().ID;

                   // Session["Password"] = query.FirstOrDefault().Password;
                }

                return View("main");
            }

            return View("Login");
        }

    }
}

