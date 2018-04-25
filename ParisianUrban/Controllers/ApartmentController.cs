using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParisianUrban.Models;

namespace ParisianUrban.Controllers
{
    public class ApartmentController : Controller
    {
        private ParisianDBEntities DbContext = new ParisianDBEntities();

        // GET: Apartment
        public ActionResult ApartmentDetails(int ID, string Image, string Address, string Description, float Price)
        {
            if (Session["ID"] != null)
            {
                Apartment Ap = new Apartment();

                Ap.ApID = ID;
                Ap.ApImage = Image;
                Ap.ApAddress = Address;
                Ap.ApDescription = Description;
                Ap.ApPrice = Price;

                return View(Ap);
            }
            else
            {
                return RedirectToAction("Login", "Auth");
            }
           
        }

        public ActionResult ApartmentEdit(int ID)
        {
            if (Session["PmEmail"] != null)
            {
                var ap = DbContext.Apartments.SingleOrDefault(a => a.ApID == ID);

                if (ap == null)
                {
                    return HttpNotFound();
                }

                return View("NewApartment", ap);
            }
            else
            {
                return RedirectToAction("PmLogin", "PropertyManager");
            }
        }
        
        [HttpGet]
        public ActionResult AddApartment()
        {
            if (Session["PmEmail"] != null)
            {

                return View("NewApartment");
            }
            else
            {
                return RedirectToAction("PmLogin", "PropertyManager");
            }
        }

        [HttpPost]
        public ActionResult AddApartment(Apartment ap)
        {
            if (Session["PmEmail"] != null)
            {
                if (ModelState.IsValid)
                {
                    DbContext.Apartments.Add(ap);
                    DbContext.SaveChanges();
                   
                    return RedirectToAction("PmMain", "PropertyManager");
                }

                return View(ap);
            }
            else
            {
                return RedirectToAction("PmLogin", "PropertyManager");
            }
        }


    }
}