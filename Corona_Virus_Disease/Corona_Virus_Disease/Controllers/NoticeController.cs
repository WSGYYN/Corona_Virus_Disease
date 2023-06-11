using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
    public class NoticeController : Controller
    {
        private CvdDBEntities db = new CvdDBEntities();
        // GET: Notice
        public ActionResult NoticeIndex()
        {
            var NList = db.Notice.ToList();
            return View(NList);
        }
        public ActionResult XNotice(int ? id)
		{
            return View();
        }
        public ActionResult XNoticeJson(int ? id)
		{
            var NXList = from t1 in db.Notice
                         where
                           t1.NID == id
                         select new
                         {
                             t1.NID,
                             Ntitle = t1.Ntitle,
                             NContent = t1.NContent,
                             ReleTime = t1.ReleTime,
                             Npic = t1.Npic
                         };

            return Json(NXList, JsonRequestBehavior.AllowGet);
        }
        public ActionResult NoticeManage()
        {
            var NoticeList = db.Notice.ToList();
            return View(NoticeList);
        }
        public ActionResult NoticeDelete(int ? id)
        {
            try
            {
                var deletelist = db.Notice.Find(id);
                db.Notice.Remove(deletelist);
                db.SaveChanges();
                return Content("<script>alert('删除成功');location.replace('/Notice/NoticeManage')</script>");
            }
            catch (Exception)
            {
                return Content("<script>alert('删除失败');history.go(-1);</script>");

                throw;
            }
        }
        public ActionResult NoticeAdd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult NoticeAdd(HttpPostedFileBase Npic, Notice notice)
        {
            string msg = string.Empty;
            string picname = Npic.FileName;
            try
            {
                if (Npic != null)
                {
                    if (Npic.ContentLength < 5 * 1024 * 1024)
                    {

                        string fileType = System.IO.Path.GetExtension(Npic.FileName); //获取文件类型
                        if (!System.IO.Directory.Exists(Server.MapPath("~/Content/Image/")))
                        {
                            System.IO.Directory.CreateDirectory(Server.MapPath("~/Content/Image/"));
                        }
                        string filePath = Server.MapPath("~/Content/Image/"); //保存文件的路径

                        fileType = fileType.ToLower(); //将文件类型转化成小写
                        if ("(.gif)|(.jpg)|(.bmp)|(.jpeg)|(.png)".Contains(fileType))
                        {
                            Npic.SaveAs(filePath + Npic.FileName);
                            string str = "Pictures/" + Npic.FileName;
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
                notice.Npic = picname;
                notice.ReleTime = DateTime.Now;
                db.Notice.Add(notice);
                db.SaveChanges();
                return Content("<script>alert('添加成功');location.replace('/Notice/NoticeManage')</script>");
            }
            catch (Exception)
            {
                return Content("<script>alert('添加失败，可原因：" + msg + "');history.go(-1);</script>");

                throw;
            }
        }
    }
}