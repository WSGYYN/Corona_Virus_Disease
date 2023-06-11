using Corona_Virus_Disease.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Corona_Virus_Disease.Controllers
{
	
	public class HomeController : Controller
	{
		private CvdDBEntities db = new CvdDBEntities();
		public ActionResult Index()
		{
			var datalist = from s in db.Student
						   join c in db.Class on s.CID equals c.CID
						   join l in db.Leave on s.StuID equals l.StuID
						   group l by new { c.CID, c.Classname } into g
						   select new
						   {
							   g.Key.CID,
							   g.Key.Classname,
							   LeaveCount = g.Count()
						   };

			var Detectiondatalist = from s in db.Student
									join c in db.Class on new { CID = (int)s.CID } equals new { CID = c.CID }
									join l in db.Detection on new { StuID = s.StuID } equals new { StuID = (int)l.StuID }
									group new { c, l } by new
									{
										c.CID,
										c.Classname
									} into g
									select new
									{
										g.Key.CID,
										g.Key.Classname,
										DetectionCount = g.Count(p => p.l.StuID != null)
									};

			var userlist = from s in db.Student
						   join c in db.Class on new { CID = (int)s.CID } equals new { CID = c.CID }
						   join l in db.User on new { StuName = s.StuName } equals new { StuName = l.Apeople }
						   group new { c, l } by new
						   {
							   c.CID,
							   c.Classname
						   } into g
						   select new
						   {
							   g.Key.CID,
							   g.Key.Classname,
							   DetectionCount = g.Count(p => p.l.Apeople != null)
						   };



			// 获取班级名称和请假次数的列表
			var chartLabels = datalist.Select(d => d.Classname).ToArray();
			var chartValues = datalist.Select(d => d.LeaveCount).ToArray();

			// 将数据传递给视图
			ViewBag.ChartLabels = chartLabels;
			ViewBag.ChartValues = chartValues;


			var delectionLabels = Detectiondatalist.Select(d => d.Classname).ToArray();
			var delectionValues = Detectiondatalist.Select(d => d.DetectionCount).ToArray();

			ViewBag.DelectionLabels = delectionLabels;
			ViewBag.DelectionValues = delectionValues;


			var userlistLabels = userlist.Select(d => d.Classname).ToArray();
			var userlistValues = userlist.Select(d => d.DetectionCount).ToArray();

			ViewBag.UserlistLabels = userlistLabels;
			ViewBag.UserlistValues = userlistValues;

			ViewBag.StuCount = db.Student.Count();
			ViewBag.TeaCount = db.Teacher.Count();
			ViewBag.DrCount = db.Doctor.Count();
			ViewBag.acount = db.Article.Select(item => item.Acount).Sum();
			return View();
		}

		public ActionResult NoLogin()
        {
			return View();
        }

		public ActionResult test()
        {
			// 准备图表数据
			var chartLabels = new[] { "标签1", "标签2", "标签3" };
			var chartValues = new[] { 10, 20, 15 };

			// 将数据传递给视图
			ViewBag.ChartLabels = chartLabels;
			ViewBag.ChartValues = chartValues;

			return View();
		}
		public class ChartDataModel
		{
			public string[] Labels { get; set; }
			public int[] Values { get; set; }
		}

	}
}
