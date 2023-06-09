using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
	public class ArticleController : Controller
	{
		private CvdDBEntities db = new CvdDBEntities();
		// GET: Article
		public ActionResult ArticleIndex()
		{
			var acticleList = db.Article.ToList();
			return View(acticleList);
		}
		public ActionResult ArticleIndexJson()
		{
			var articleJson = from Articles in db.Article
							  select new
							  {
								  Articles.AID,
								  Apic = Articles.Apic,
								  Aname = Articles.Aname,
								  Acount = Articles.Acount,
								  Atype = Articles.Atype,
								  Warehousing = Articles.Warehousing
							  };
			return Json(articleJson, JsonRequestBehavior.AllowGet);
		}
		public ActionResult ArticleAdd()
		{
			return View();
		}
		[HttpPost]
		public ActionResult ArticleAdd(HttpPostedFileBase Apic, Article article)
		{


			string msg = string.Empty;
			string picname = Apic.FileName;
			try
			{
				if (Apic != null)
				{
					if (Apic.ContentLength < 5 * 1024 * 1024)
					{
						
						string fileType = System.IO.Path.GetExtension(Apic.FileName); //获取文件类型
						if (!System.IO.Directory.Exists(Server.MapPath("~/Content/Image/")))
						{
							System.IO.Directory.CreateDirectory(Server.MapPath("~/Content/Image/"));
						}
						string filePath = Server.MapPath("~/Content/Image/"); //保存文件的路径

						fileType = fileType.ToLower(); //将文件类型转化成小写
						if ("(.gif)|(.jpg)|(.bmp)|(.jpeg)|(.png)".Contains(fileType))
						{
							Apic.SaveAs(filePath + Apic.FileName);
							string str = "Pictures/" + Apic.FileName;
							msg = str;
						}
						else
						{
							msg = "只支持图片格式";
						}
					}
					else
					{
						msg = "图片大小不能超过5M";
					}
				}
				else
				{
					msg = "上传图片不能为空";
				}
				article.Apic = picname;
				article.Warehousing = "未入库";
				db.Article.Add(article);
				db.SaveChanges();
				return Content("<script>alert('添加成功');location.replace('/Article/ArticleIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('添加失败，可原因："+msg+"');history.go(-1);</script>");

				throw;
			}


		}
		public ActionResult ArticleEdit(int ? id)
		{
			var ArticleList = db.Article.Where(t => t.AID == id).ToList(); ;
			return View(ArticleList);
		}
		[HttpPost]
		public ActionResult ArticleEdit(Article article)
		{
			try
			{
				var articlelist = db.Article.Find(article.AID);
				articlelist.Acount += article.Acount;
				db.SaveChanges();
				return Content("<script>alert('入库成功');location.replace('/Article/ArticleIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('入库失败');history.go(-1);</script>");
				throw;
			}
		}
		public ActionResult ArticleDelete(int ? id)
		{

			try
			{
				var Articledelete = db.Article.Find(id);
				db.Article.Remove(Articledelete);
				db.SaveChanges();
				return Content("<script>alert('删除成功');location.replace('/Article/ArticleIndex')</script>");
			}
			catch (Exception)
			{
				return Content("<script>alert('删除失败');history.go(-1);</script>");
				throw;
			}
		}
	}
}