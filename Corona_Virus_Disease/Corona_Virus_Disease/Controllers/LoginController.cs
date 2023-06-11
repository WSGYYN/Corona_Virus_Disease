using Corona_Virus_Disease.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Corona_Virus_Disease.Controllers
{
    public class LoginController : Controller
    {
		private CvdDBEntities db = new CvdDBEntities();
        // GET: Login
        public ActionResult StudentLogin()
        {
            return View();
        }
		[HttpPost]
		public ActionResult StudentLogin(string StuAcc,string StuPassword)
		{
			var a = db.Student.Where(t => t.StuAcc == StuAcc).Where(t => t.StuPassword == StuPassword).FirstOrDefault();
			if (a != null)
			{
				Session["Student"] = a;
				return RedirectToAction("Index", "Home");
			}
			return Content("<script>alert('账号或密码错误，请重新输入！');history.go(-1);</script>");
		}
		public ActionResult TeaLogin()
		{
			return View();
		}
		[HttpPost]
		public ActionResult TeaLogin(string TAcc,string TPassword)
		{
			var a = db.Teacher.Where(t => t.TAcc == TAcc).Where(t => t.TPassword == TPassword).FirstOrDefault();
			if (a != null)
			{
				Session["Teacher"] = a;
				return RedirectToAction("Index", "Home");
			}
			return Content("<script>alert('账号或密码错误，请重新输入！');history.go(-1);</script>");
		}
		public ActionResult DrLogin()
		{
			return View();
		}
		[HttpPost]
		public ActionResult DrLogin(string DrAcc,string DrPassword)
		{
			var a = db.Doctor.Where(t => t.DrAcc == DrAcc).Where(t => t.DrPassword == DrPassword).FirstOrDefault();
			if (a != null)
			{
				Session["Doctor"] = a;
				return RedirectToAction("Index", "Home");
			}
			return Content("<script>alert('账号或密码错误，请重新输入！');history.go(-1);</script>");
		}
		public ActionResult AdminLogin()
        {
			return View();
        }
		[HttpPost]
		public ActionResult AdminLogin(string AdminPaword, string AdminAcc)
		{
			var a = db.Admin.Where(t => t.AdminAcc == AdminAcc).Where(t => t.AdminPaword == AdminPaword).FirstOrDefault();
			if (a != null)
			{
				Session["Admin"] = a;
				return RedirectToAction("Index", "Home");
			}
			return Content("<script>alert('账号或密码错误，请重新输入！');history.go(-1);</script>");
		}
		public ActionResult Layout()
		{
			Session.Clear();
			return RedirectToAction("Index","Home");
		}
		public ActionResult Register()
		{
			var bmlist = db.Bmt.ToList();
			return View(bmlist);
		}
		[HttpPost]
		public ActionResult Register(int? BMID, string Type, string Name,string Password, string ACC)
		{
			try
			{
				if (Type == "管理员")
				{
					Admin admin = new Admin();
					admin.AdminAcc = ACC;
					admin.AdminName = Name;
					admin.AdminPaword = Password;
					admin.BMID = BMID;
					db.Admin.Add(admin);
					db.SaveChanges();
					return Content("<script>alert('注册成功，请返回登录');location.replace('/Login/AdminLogin')</script>");

				}
				else if (Type == "教师")
				{
					Teacher teacher = new Teacher();
					teacher.BMID = BMID;
					teacher.TName = Name;
					teacher.TPassword = Password;
					teacher.State = "0";
					teacher.TAcc = ACC;
					db.Teacher.Add(teacher);
					db.SaveChanges();
					return Content("<script>alert('注册成功，请返回登录');location.replace('/Login/TeaLogin')</script>");
				}
				else
				{
					Doctor doctor = new Doctor();
					doctor.BMID = BMID;
					doctor.Drname = Name;
					doctor.DrPassword = Password;
					doctor.DrAcc = ACC;
					db.Doctor.Add(doctor);
					db.SaveChanges();
					return Content("<script>alert('注册成功，请返回登录');location.replace('/Login/DrLogin')</script>");
				}
			}
			catch (Exception)
			{
				return Content("<script>alert('注册失败');history.go(-1);</script>");
				throw;
			}
		}
	}
}