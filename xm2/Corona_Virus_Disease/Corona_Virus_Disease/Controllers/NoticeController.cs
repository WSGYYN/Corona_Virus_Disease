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
            return View();
        }
        public ActionResult XNoticeJson(int ? id)
		{
            var NXList = from t1 in db.Notice
                         where
                           t1.NID == id
                         select new
                         {
                             t1.NID,
                             Ntitle = t1.Ntitle,
                             NContent = t1.NContent,
                             ReleTime = t1.ReleTime,
                             Npic = t1.Npic
                         };

            return Json(NXList, JsonRequestBehavior.AllowGet);
        }
    }
}