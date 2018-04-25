using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParisianUrban.Models;

namespace ParisianUrban.Controllers
{
    public class PropertyManagerController : Controller
    {
        private ParisianDBEntities DbContext = new ParisianDBEntities();

        // GET: PropertyManager
        [HttpGet]
        public ActionResult PmLogin()
        {


            return View();
        }

        public ActionResult PmLogin(PropertyManager pm)
        {

            if (!ModelState.IsValid)
            {
               

                return View(pm);
                
            }

            var query = (
                  from db in DbContext.PropertyManagers
                  where db.PmEmail == pm.PmEmail && db.PmPassword == pm.PmPassword
                  select new
                  {
                      db.PmEmail,
                      db.PmPassword,
                  }).ToList();

            if (query.FirstOrDefault() != null)
            {
                ViewBag.Pm = query.FirstOrDefault().PmEmail;

                Session["PmEmail"] = query.FirstOrDefault();

                return RedirectToAction("PmMain");
            }

            ViewBag.greeting = "Incorrect credentials";

            return View("PmLogin");

        }

        public ActionResult PmMain()
        {
            if (Session["PmEmail"] != null)
            {
                return View("PmMainPage", DbContext.Apartments.ToList());
            }
            else
            {
                return RedirectToAction("PmLogin", "PropertyManager");
            }

        }

        public ActionResult PmEdit(int ID)
        {
            if (Session["PmEmail"] != null)
            {
                var pm = DbContext.PropertyManagers.SingleOrDefault(p => p.PmID == ID);

                if (pm == null)
                {
                    return HttpNotFound();
                }

                return View("NewPropertyManager", pm);
            }
            else
            {
                return RedirectToAction("AdminDisplay", "Home");
            }

        }

        public ActionResult AddPropertyManager()
        {
            if (Session["AdminID"] != null)
            {

                return View("NewPropertyManager");
            }
            else
            {
                return RedirectToAction("AdminDisplay", "Home");
            }
        }

        [HttpPost]
        public ActionResult AddPropertyManager(PropertyManager pm)
        {
            if (Session["AdminID"] != null)
            {
                if (ModelState.IsValid)
                {
                    DbContext.PropertyManagers.Add(pm);
                    DbContext.SaveChanges();

                    return RedirectToAction("AdminMain", "Home");
                }

                return View(pm);
            }
            else
            {
                return RedirectToAction("AdminDisplay", "Home");
            }
        }

    }
}