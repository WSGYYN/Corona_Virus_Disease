using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
    public class DetectionController : Controller
    {
        private CvdDBEntities db = new CvdDBEntities();
        // GET: Detection
        public ActionResult DetectionIndex()
        {

            return View();
        }
    }
}