using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Corona_Virus_Disease.Models;

namespace Corona_Virus_Disease.Controllers
{
    public class UserController : Controller
    {
        private CvdDBEntities db = new CvdDBEntities();

        // GET: User
        public ActionResult UserIndex()
        {
            var acticleList = db.Article.ToList();
            return View(acticleList);
        }
        public ActionResult UserService(int ? id)
		{
            var userandarticlelist = db.Article.Where(t => t.AID == id).ToList();
            return View(userandarticlelist);
		}
        [HttpPost]
        public ActionResult UserService(User user,Article article)
        {
            var tea = Session["Teacher"] as Teacher;
            var dr = Session["Doctor"] as Doctor;
            var admin = Session["Admin"] as Admin;
			try
			{
				if (tea !=null)
				{
                    user.Apeople = tea.TName;
				}
                else if (dr != null)
				{
                    user.Apeople = dr.Drname;
				}
                else
				{
                    user.Apeople = "Admin";
				}
                user.AID = article.AID;
                user.State = "0";
                user.Atime = DateTime.Now;
                db.User.Add(user);
                
                db.SaveChanges();
                return Content("<script>alert('领用成功');location.replace('/User/UserExam')</script>");

            }
            catch (Exception)
			{
                return Content("<script>alert('领用失败');history.go(-1);</script>");
                throw;
			}
        }
        public ActionResult UserExam()
		{
            
            return View();
		}
        
        public ActionResult UserExamJson()
		{
            var userlistJosn = from t1 in db.User
                               join t2 in db.Article on new { AID = (int)t1.AID } equals new { AID = t2.AID } into t2_join
                               from t2 in t2_join.DefaultIfEmpty()
                               select new
                               {
                                   t1.UID,
                                   AID = t2.AID,
                                   t1.State,
                                   t1.Apeople,
                                   t1.Atime,
                                   t1.UCount,
                                   t1.Uto,
                                   Aname = t2.Aname
                               };
            return Json(userlistJosn, JsonRequestBehavior.AllowGet);
		}
        public ActionResult counts(int ? id,int ? count,int ? uid)
		{
            var articlelist = db.Article.Find(id);
            articlelist.Acount -= count;
            var userlist = db.User.Find(uid);
            userlist.State = "1";
            db.SaveChanges();
            return RedirectToAction("UserExam");
		}
    }
}