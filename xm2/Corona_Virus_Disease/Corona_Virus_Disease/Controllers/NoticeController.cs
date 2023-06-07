using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
    public class NoticeController : Controller
    {
        private CvdDBEntities db = new CvdDBEntities();
        // GET: Notice
        public ActionResult NoticeIndex()
        {
            var NList = db.Notice.ToList();
            return View(NList);
        }
        public ActionResult XNotice(int ? id)
		{
            var NXList = db.Notice.ToList();
            return View(NXList);
        }
    }
}