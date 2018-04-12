using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParisianUrban.Models;

namespace ParisianUrban.Controllers
{
    public class AuthController : Controller
    {
        private ParisianDBEntities DbContext = new ParisianDBEntities();

        // GET: Auth
        [HttpGet]
        public ActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Login(string Email, string PasswordHash, string Firstname)
        {

            if (Email != String.Empty || PasswordHash != String.Empty)
            {

                PasswordHash = encrypt.hash(PasswordHash);

                var query = (
                  from db in DbContext.Users
                  where db.Email == Email && db.PasswordHash == PasswordHash
                  select new
                  {
                      db.Email,
                      db.PasswordHash,
                      db.Firstname
                  }).ToList();

                if (query.FirstOrDefault() != null)
                {
                    //foreach (var item in query)
                    //{
                    //    ViewBag.greeting = "Welcome " + query.FirstOrDefault().Firstname;

                    //    //Session["ID"] = query.FirstOrDefault().Email;

                    //    //Session["Password"] = query.FirstOrDefault().PasswordHash;
                    //}

                    TempData["userName"] = query.FirstOrDefault().Firstname;

                    return RedirectToAction("index", "Home");
                }
               
            }

            ViewBag.errorMsg = "Invalid email or password.";

            return View("Login");
        }

        [HttpGet]
        public ActionResult Register()
        {


            return View("RegisterPage");
        }

        [HttpPost]
        public ActionResult Register(User user)
        {
            if (ModelState.IsValid)
            {
                user.PasswordHash = encrypt.hash(user.PasswordHash);

                DbContext.Users.Add(user);

                DbContext.SaveChanges();

                ViewBag.greeting = "Thank you for registering!";

                return RedirectToAction("Login", "Auth");

            }

            return View("RegisterPage");
        }
    }
}