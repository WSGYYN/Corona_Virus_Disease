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
		public ActionResult Layout()
		{
			Session.Clear();
			return RedirectToAction("Index","Home");
		}
		public ActionResult Register()
		{
			return View();
		}
		[HttpPost]
		public ActionResult Register(Teacher teacher)
		{
			db.Teacher.Add(teacher);
			db.SaveChanges();
			if (db.Teacher.Where(t => t.TAcc == teacher.TAcc).Count() > 0)
			{
				return Content("<script>alert('注册成功，请返回登录页面登录');location.replace('/Login/TeaLogin')</script>");
			}
			else
			{
				return Content("<script>alert('注册失败，请检查网络问题或联系管理员');history.go(-1);</script>");
			}
		}
	}
}