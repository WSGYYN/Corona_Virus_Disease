using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
    public class ClassController : Controller
    {
        private CvdDBEntities db = new CvdDBEntities();
        // GET: Class
        public ActionResult ClassIndex()
        {
            return View();
        }
        public ActionResult ClassIndexJson()
        {
            var ClassJson = from t1 in db.Class
                            join t2 in db.Teacher on new { TID = (int)t1.TID } equals new { TID = t2.TID } into t2_join
                            from t2 in t2_join.DefaultIfEmpty()
                            join t3 in db.Bmt on new { BMID = (int)t2.BMID } equals new { BMID = t3.BMID } into t3_join
                            from t3 in t3_join.DefaultIfEmpty()
                            select new
                            {
                                t1.CID,
                                t1.Classname,
                                BMname = t3.BMname,
                                TName = t2.TName
                            };
            return Json(ClassJson,JsonRequestBehavior.AllowGet);
        }
        public ActionResult ClassAdd()
        {
            var list = db.Bmt.ToList();
            var list2 = db.Teacher.ToList();
            ClassAddListModel classAddList = new ClassAddListModel
            {
                Bmtes = list,
                teachers = list2
            };
            return View(classAddList);
        }
        
        [HttpPost]
        public ActionResult ClassAdd(Class classes)
        {
            try
            {
                db.Class.Add(classes);
                db.SaveChanges();
                return Content("<script>alert('添加成功');location.replace('/Class/ClassIndex')</script>");
            }
            catch (Exception)
            {
                return Content("<script>alert('添加失败');history.go(-1);</script>");
                throw;
            }
        }
        public ActionResult ClassDelete(int ? id)
        {
            try
            {
                var classlist = db.Class.Find(id);
                db.Class.Remove(classlist);
                db.SaveChanges ();
                return Content("<script>alert('删除成功');location.replace('/Class/ClassIndex')</script>");

            }
            catch (Exception)
            {
                return Content("<script>alert('删除失败');history.go(-1);</script>");
                throw;
            }
        }
    }
}