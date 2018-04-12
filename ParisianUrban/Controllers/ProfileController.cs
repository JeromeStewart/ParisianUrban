using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParisianUrban.Models;

namespace ParisianUrban.Controllers
{
    public class ProfileController : Controller
    {
        private ParisianDBEntities DbContext = new ParisianDBEntities();
        // GET: Profile
        public ActionResult ShowProfile(string Firstname)
        {
           
            return View("ProfilePage", DbContext.Users.Where(s => s.Firstname == Firstname));
        }
    }
}