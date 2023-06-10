using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
    public class StaffMGController : Controller
    {
        private CvdDBEntities db = new CvdDBEntities();
        // GET: StaffMG
        public ActionResult StaffMGIndex()
        {
			var BMList = db.Bmt.ToList();
			return View(BMList);
		}
		public ActionResult StaffMGIndexJson()
		{
			var bm = db.Bmt.Select(m => new { ID = m.BMID, Mname = m.BMname });
			var query = db.Admin.Select(a => new { ID = a.AdminID, Name = a.AdminName, ACC = a.AdminAcc, Type = "管理员", BMID = a.BMID }).
				Concat(db.Teacher.Select(t => new { ID = t.TID, Name = t.TName, ACC = t.TAcc, Type = "教师", BMID = t.BMID })).
				Concat(db.Doctor.Select(d => new { ID = d.DRID, Name = d.Drname, ACC = d.DrAcc, Type = "医生", BMID = d.BMID }));
			var result = query.Join(bm, q => q.BMID, b => b.ID, (q, b) => new { q.ID, q.Name, q.ACC, q.Type, b.Mname });
			return Json(result, JsonRequestBehavior.AllowGet);
		}
		public ActionResult StaffMGDelete(int ? id,string type)
		{
			try
			{
				if (type == "管理员")
				{
					var adminlist = db.Admin.Find(id);
					db.Admin.Remove(adminlist);
					db.SaveChanges();
				}
				else if (type == "教师")
				{
					var teacherlist = db.Teacher.Find(id);
					db.Teacher.Remove(teacherlist);
					db.SaveChanges();
				}
				else
				{
					var doctorlist = db.Doctor.Find(id);
					db.Doctor.Remove(doctorlist);
					db.SaveChanges();
				}
				return Content("<script>alert('删除成功');location.replace('/StaffMG/StaffMGIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('删除失败');history.go(-1);</script>");
				throw;
			}
		}
		public ActionResult StaffMGEditPassword(int?id,string type)
		{

			try
			{
				if (type == "管理员")
				{
					var adminlist = db.Admin.Find(id);
					adminlist.AdminPaword = "112233";
					db.SaveChanges();
				}
				else if (type == "教师")
				{
					var teacherlist = db.Teacher.Find(id);
					teacherlist.TPassword = "112233";
					db.SaveChanges();
				}
				else
				{
					var doctorlist = db.Doctor.Find(id);
					doctorlist.DrPassword = "112233";
					db.SaveChanges();
				}
				return Content("<script>alert('重置成功');location.replace('/StaffMG/StaffMGIndex')</script>");

			}
			catch (Exception)
			{
				return Content("<script>alert('重置失败');history.go(-1);</script>");
				throw;
			}
		}
		public ActionResult StaffMGEdit(int ? id,string type)
		{
			var bmlist = db.Bmt.ToList();
			return View(bmlist);
		}
		[HttpPost]
		public ActionResult StaffMGEdit(int ? ID,string Type,string Name,int ? BMID)
		{
			try
			{
				if (Type == "管理员")
				{
					var adminlist = db.Admin.Find(ID);
					adminlist.AdminName = Name;
					adminlist.BMID = BMID;
					db.SaveChanges();
				}
				else if (Type == "教师")
				{
					var teacherlist = db.Teacher.Find(ID);
					teacherlist.BMID = BMID;
					teacherlist.TName = Name;
					db.SaveChanges();
				}
				else
				{
					var doctorlist = db.Doctor.Find(ID);
					doctorlist.BMID = BMID;
					doctorlist.Drname = Name;
					db.SaveChanges();
				}
				return Content("<script>alert('修改成功');location.replace('/StaffMG/StaffMGIndex')</script>");

			}
			catch (Exception)
			{
				return Content("<script>alert('修改失败');history.go(-1);</script>");
				throw;
			}

		}
		public ActionResult StaffMGEditJson(int? id, string type)
		{
			if (type == "管理员")
			{
				var bm = db.Bmt.Select(ss => new { BMMID = ss.BMID, SBName = ss.BMname });
				var list = db.Admin.Select(a => new { ID = a.AdminID, BMID = a.BMID, Name = a.AdminName, Type = "管理员" }).Where(t => t.ID == id);
				var result = list.Join(bm, q => q.BMID, b => b.BMMID, (q, b) => new { q.ID, q.BMID, q.Name, q.Type, b.SBName, b.BMMID });
				return Json(result, JsonRequestBehavior.AllowGet);
			}
			else if (type == "教师")
			{
				var bm = db.Bmt.Select(ss => new { BMMID = ss.BMID, SBName = ss.BMname });
				var list = db.Teacher.Select(a => new { ID = a.TID, BMID = a.BMID, Name = a.TName, Type = "教师" }).Where(t => t.ID == id);
				var result = list.Join(bm, q => q.BMID, b => b.BMMID, (q, b) => new { q.ID, q.BMID, q.Name, q.Type, b.SBName, b.BMMID });
				return Json(result, JsonRequestBehavior.AllowGet);

			}
			else
			{
				var bm = db.Bmt.Select(ss => new { BMMID = ss.BMID, SBName = ss.BMname });
				var list = db.Doctor.Select(a => new { ID = a.DRID, BMID = a.BMID, Name = a.Drname, Type = "医生" }).Where(t => t.ID == id);
				var result = list.Join(bm, q => q.BMID, b => b.BMMID, (q, b) => new { q.ID, q.BMID, q.Name, q.Type, b.SBName, b.BMMID });
				return Json(result, JsonRequestBehavior.AllowGet);
			}
		}
		public ActionResult StaffMGAdd()
		{
			var bmlist = db.Bmt.ToList();
			return View(bmlist);
		}
		[HttpPost]
		public ActionResult StaffMGAdd(int ? BMID,string Type,string Name,string ACC)
		{
			try
			{
				if (Type == "管理员")
				{
					Admin admin = new Admin();
					admin.AdminAcc = ACC;
					admin.AdminName = Name;
					admin.AdminPaword = "admin" + GenerateRandomString() + ConvertDateTimeToNumber();
					admin.BMID = BMID;
					db.Admin.Add(admin);
					db.SaveChanges();
				}
				else if (Type == "教师")
				{
					Teacher teacher = new Teacher();
					teacher.BMID = BMID;
					teacher.TName = Name;
					teacher.TPassword="teacher" + GenerateRandomString() + ConvertDateTimeToNumber();
					teacher.State = "0";
					teacher.TAcc = ACC;
					db.Teacher.Add(teacher);
					db.SaveChanges();
				}
				else
				{
					Doctor doctor = new Doctor();
					doctor.BMID = BMID;
					doctor.Drname = Name;
					doctor.DrPassword="doctor"+ GenerateRandomString() + ConvertDateTimeToNumber();
					doctor.DrAcc = ACC;
					db.Doctor.Add(doctor);
					db.SaveChanges();
				}
				return Content("<script>alert('添加成功');location.replace('/StaffMG/StaffMGIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('修改失败');history.go(-1);</script>");
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
	}
}