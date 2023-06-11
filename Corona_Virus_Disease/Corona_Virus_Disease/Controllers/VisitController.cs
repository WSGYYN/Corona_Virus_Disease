using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
    public class VisitController : Controller
    {
        private CvdDBEntities db = new CvdDBEntities();
        // GET: Visit
        public ActionResult VisitIndex()
        {
            return View();
        }
        public ActionResult VisitIndexJson()
        {
            var visitJson = from t1 in db.Visit
                            join t2 in db.Student on new { StuID = (int)t1.StuID } equals new { StuID = t2.StuID } into t2_join
                            from t2 in t2_join.DefaultIfEmpty()
                            join t3 in db.Teacher on new { TID = (int)t2.TID } equals new { TID = t3.TID } into t3_join
                            from t3 in t3_join.DefaultIfEmpty()
                            join t4 in db.Class on new { CID = (int)t2.CID } equals new { CID = t4.CID } into t4_join
                            from t4 in t4_join.DefaultIfEmpty()
                            join t5 in db.Doctor on new { DRID = (int)t1.DRID } equals new { DRID = t5.DRID } into t5_join
                            from t5 in t5_join.DefaultIfEmpty()
                            select new
                            {
                                t1.VID,
                                StuName = t2.StuName,
                                Classname = t4.Classname,
                                TName = t3.TName,
                                t1.Vreason,
                                t1.Hot,
                                t1.Vtime,
                                Drname = t5.Drname
                            };
            return Json(visitJson,JsonRequestBehavior.AllowGet);
        }
        public ActionResult VisitAdd()
		{
            var stulist = db.Student.ToList();
            return View(stulist);
		}
        [HttpPost]

        public ActionResult VisitAdd(Visit visit)
        {
            try
            {
                visit.Vtime = DateTime.Now;
				if (Session["Doctor"] != null)
				{
                    var Drsession = Session["Doctor"] as Doctor;
                    visit.DRID = Drsession.DRID;

				}
                db.Visit.Add(visit);
                db.SaveChanges();
                return Content("<script>alert('添加成功');location.replace('/Visit/VisitIndex')</script>");
            }
            catch (Exception)
            {
                return Content("<script>alert('添加失败');history.go(-1);</script>");
                throw;
            }
        }
    }
}