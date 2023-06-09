using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
	public class StuManageController : Controller
	{
		private CvdDBEntities db = new CvdDBEntities();
		// GET: StuManage
		public ActionResult StuManageIndex()
		{
			return View();
		}
		public ActionResult StuManageIndexJson()
		{
			var StuManageToJson = from t1 in db.Student
								  join t2 in db.Class on new { CID = (int)t1.CID } equals new { CID = t2.CID } into t2_join
								  from t2 in t2_join.DefaultIfEmpty()
								  join t3 in db.Detection on new { StuID = t1.StuID } equals new { StuID = (int)t3.StuID } into t3_join
								  from t3 in t3_join.DefaultIfEmpty()
								  join t4 in db.Visit on new { StuID = t1.StuID } equals new { StuID = (int)t4.StuID } into t4_join
								  from t4 in t4_join.DefaultIfEmpty()
								  join t5 in db.Leave on new { StuID = t1.StuID } equals new { StuID = (int)t5.StuID } into t5_join
								  from t5 in t5_join.DefaultIfEmpty()
								  group new { t1, t2 } by new
								  {
									  t1.StuXH,
									  t1.StuName,
									  t2.Classname,
									  t1.StuID
									
								  } into g
								  select new
								  {
									  g.Key.StuXH,
									  g.Key.StuID,
									  g.Key.StuName,
									  Classname = g.Key.Classname,
									  DCount =
									  (from t6 in db.Detection
									   where
	   t6.StuID == g.Key.StuID
									   select new
									   {
										   t6.StuID
									   }).Count(p => p.StuID != null),
									  VCount =
									  (from t7 in db.Visit
									   where
	   t7.StuID == g.Key.StuID
									   select new
									   {
										   t7.StuID
									   }).Count(p => p.StuID != null),
									  LCount =
									  (from t8 in db.Leave
									   where
	   t8.StuID == g.Key.StuID
									   select new
									   {
										   t8.StuID
									   }).Count(p => p.StuID != null)
								  };

			return Json(StuManageToJson, JsonRequestBehavior.AllowGet);
		}
		public ActionResult StuManageAdd()
		{
			var classlist = db.Class.ToList();
			return View(classlist);
		}
		[HttpPost]
		public ActionResult StuManageAdd(Student student)
		{
			try
			{
				var Teachersession = Session["Teacher"] as Teacher;
				if (Session["Teacher"] != null)
				{

					student.TID = Teachersession.TID;
				}
				student.StuXH = Convert.ToInt32(student.StuXH);
				student.StuAcc ="student"+ ConvertDateTimeToNumber() + GenerateRandomString();
				student.StuPassword = "123456";
				student.State = "0";
				db.Student.Add(student);
				db.SaveChanges();
				return Content("<script>alert('添加成功');location.replace('/StuManage/StuManageIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('添加失败');history.go(-1);</script>");
				throw;
			}
		}
		public static string GenerateRandomString()
		{
			char[] chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".ToCharArray();
			Random random = new Random();
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < 5; i++)
			{
				int index = random.Next(chars.Length); 
				char c = chars[index]; 
				sb.Append(c); 
			}
			return sb.ToString();
		}
		public static string ConvertDateTimeToNumber()
		{
			DateTime now = DateTime.Now;
			string format = "yyyyMMddHHmmss";
			string result = now.ToString(format);
			return result;
		}
		public ActionResult StuManageDelete(int ? id)
		{
			try
			{
				var studentdelete = db.Student.Find(id);
				db.Student.Remove(studentdelete);
				db.SaveChanges();
				return Content("<script>alert('删除成功');location.replace('/StuManage/StuManageIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('删除失败');history.go(-1);</script>");
				throw;
			}
		}
		public ActionResult StuManageEdit()
		{
			var classlsit = db.Class.ToList();
			return View(classlsit);
		}
		[HttpPost]

		public ActionResult StuManageEdit(Student student)
		{
			try
			{
				var stulist = db.Student.Find(student.StuID);
				stulist.StuXH = student.StuXH;
				stulist.StuName = student.StuName;
				stulist.CID = student.CID;
				db.SaveChanges();
				return Content("<script>alert('修改成功');location.replace('/StuManage/StuManageIndex')</script>");

			}
			catch (Exception)
			{
				return Content("<script>alert('修改失败');history.go(-1);</script>");

				throw;
			}
		}
		public ActionResult StuManageEditJson(int ? id)
		{

			var studentjson = from t1 in db.Student
							  where
								t1.StuID == id
							  select new
							  {
								  StuID = t1.StuID,
								  StuAcc = t1.StuAcc,
								  StuName = t1.StuName,
								  StuPassword = t1.StuPassword,
								  StuClass = t1.StuClass,
								  State = t1.State,
								  t1.TID,
								  t1.CID,
								  StuXH = t1.StuXH
							  };
			return Json(studentjson, JsonRequestBehavior.AllowGet);
		}
		public ActionResult ClassAllJson()
		{
			var classjson = db.Class.ToList();
			return Json(classjson, JsonRequestBehavior.AllowGet);
		}
	}
}