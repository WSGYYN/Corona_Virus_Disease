using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
	public class LeaveController : Controller
	{
		private CvdDBEntities db = new CvdDBEntities();
		// GET: Leave
		public ActionResult LeaveIndex()
		{
			return View();
		}
		public ActionResult LeaveIndexJson()
		{
			var LeaveJson = from t1 in db.Leave
							join t2 in db.Student on new { StuID = (int)t1.StuID } equals new { StuID = t2.StuID } into t2_join
							from t2 in t2_join.DefaultIfEmpty()
							join t3 in db.Teacher on new { TID = (int)t2.TID } equals new { TID = t3.TID } into t3_join
							from t3 in t3_join.DefaultIfEmpty()
							select new
							{
								t1.LID,
								StuName = t2.StuName,
								t1.LstartTime,
								t1.LoverTime,
								t1.Lreason,
								t1.Lorschool,
								t1.Lview,
								t1.VState,
								TName = t3.TName
							};
			return Json(LeaveJson, JsonRequestBehavior.AllowGet);
		}
		public ActionResult LeaveAdd()
		{
			return View();
		}
		[HttpPost]
		public ActionResult LeaveAdd(Leave leave)
		{
			try
			{
				var Studentsession = Session["Student"] as Student;
				if (Session["Student"] != null)
				{

					leave.StuID = Studentsession.StuID;
					leave.TID = Studentsession.TID;
				}
				leave.VState = 0;
				db.Leave.Add(leave);
				db.SaveChanges();
				return Content("<script>alert('添加成功,请耐心等待老师审批');location.replace('/Leave/LeaveIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('添加失败');history.go(-1);</script>");
				throw;
			}
		}
		public ActionResult LeaveEdit(int? id)
		{
			return View();
		}
		[HttpPost]
		public ActionResult LeaveEdit(Leave leave)
		{
			try
			{
				var leavelist = db.Leave.Find(leave.LID);
				leavelist.Lview = leave.Lview;
				leavelist.VState = leave.VState;
				db.SaveChanges();
				return Content("<script>alert('审批成功');location.replace('/Leave/LeaveIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('添加失败');history.go(-1);</script>");
				throw;
			}
		}
		public ActionResult LeaveEditJson(int? id)
		{
			var LeaveEditJson = from t1 in db.Leave
								join t2 in db.Student on new { StuID = (int)t1.StuID } equals new { StuID = t2.StuID } into t2_join
								from t2 in t2_join.DefaultIfEmpty()
								join t3 in db.Teacher on new { TID = (int)t2.TID } equals new { TID = t3.TID } into t3_join
								from t3 in t3_join.DefaultIfEmpty()
								where
								  t1.LID == id
								select new
								{
									t1.LID,
									StuName = t2.StuName,
									t1.LstartTime,
									t1.LoverTime,
									t1.Lreason,
									t1.Lorschool,
									t1.Lview,
									t1.VState,
									TName = t3.TName
								};
			return Json(LeaveEditJson, JsonRequestBehavior.AllowGet);
		}
		public ActionResult LeaveDelete(int? id)
		{
			try
			{
				var LeaveDetele = db.Leave.Find(id);
				db.Leave.Remove(LeaveDetele);
				db.SaveChanges();
				return Content("<script>alert('删除成功');location.replace('/Leave/LeaveIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('删除失败失败');history.go(-1);</script>");
				throw;
			}
		}
	}
}