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
        public ActionResult DetectionIndexJson()
		{
            var DList = from t1 in db.Detection
                        join t2 in db.Student on new { StuID = (int)t1.StuID } equals new { StuID = t2.StuID } into t2_join
                        from t2 in t2_join.DefaultIfEmpty()
                        join t3 in db.Teacher on new { TID = (int)t2.TID } equals new { TID = t3.TID } into t3_join
                        from t3 in t3_join.DefaultIfEmpty()
                        join t4 in db.Class on new { CID = (int)t2.CID } equals new { CID = t4.CID } into t4_join
                        from t4 in t4_join.DefaultIfEmpty()
                        select new
                        {
                            StuName = t2.StuName,
                            Classname = t4.Classname,
                            TName = t3.TName,
                            t1.Dresult,
                            t1.Dtime
                        };
            return Json(DList, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DetectionAdd()
		{
            var stuList = db.Student.ToList();
            return View(stuList);
		}
        [HttpPost]
        public ActionResult DetectionAdd(Detection detection)
        {
			try
			{
                detection.Dtime = DateTime.Now;
                db.Detection.Add(detection);
                db.SaveChanges();
                return Content("<script>alert('添加成功');location.replace('/Detection/DetectionIndex')</script>");
            }
			catch (Exception)
			{
                return Content("<script>alert('添加失败');history.go(-1);</script>");
                throw;
			}
        }
    }
}