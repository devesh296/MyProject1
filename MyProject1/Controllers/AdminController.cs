using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;
using MyProject1.Models;

namespace MyProject1.Controllers
{
    [CheckSession]

    public class AdminController : Controller
    {
        
        DBManager db = new DBManager();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Category()
        {
            DataTable dt =db.executeSelect("select * from tbl_category");
            ViewBag.data = dt;
            return View();
        }
        [HttpPost]
        public ActionResult Category(string catname, HttpPostedFileBase caticon)
        {

            if (catname != null && caticon != null)
            {
                caticon.SaveAs(Server.MapPath("/Content/caticon/") + caticon.FileName);
                string query = "insert into tbl_category values('" + catname + "','" + caticon.FileName + "')";
                int result = db.executeInsertUpdateDelete(query);
                if (result > 0)
                {
                    return Content("<script>alert('category added');location.href='/Admin/Category'</script>");
                }
                else
                {
                    return Content("<script>alert('category not added');location.href='/Admin/Category'</script>");
                }
            }
            else
            {
                return Content("<script>alert('fill all fields properly');location.href='/Admin/Category'</script>");
            }

        }
        public ActionResult SubCategory()
        {
            string query = "select * from tbl_category order by cname";
            DataTable dt =db.executeSelect(query);
            ViewBag.subcat = dt;    
            //subcategory all sub category from table
            string command = "select sc.sid,c.cname, sc.subcat_name, sc.subcat_pic from tbl_subcategory sc left join tbl_category c on c.cid=sc.cid";
            DataTable subcategory = db.executeSelect(command);  
            ViewBag.subcategory = subcategory;
            return View();  
        }
        [HttpPost]
        public ActionResult SubCategory(int category, string subcatname, HttpPostedFileBase subcaticon)
        {
            string query = "insert into tbl_subcategory values("+category+",'"+subcatname+"','"+subcaticon.FileName+"')";
            int result = db.executeInsertUpdateDelete(query);
            if(result > 0)
            {
                subcaticon.SaveAs(Server.MapPath("/Content/subcatpic/") + subcaticon.FileName);
                return Content("<script>alert('Data Added');location.href='/Admin/SubCategory'</script>");
            }
            else
            {
                return Content("<script>alert('Data not Added');location.href='/Admin/SubCategory'</script>");
            }
        }
        public ActionResult Product()
        {
            string query = "select * from tbl_category order by cname";
            DataTable category = db.executeSelect(query);
            ViewBag.category = category;

            string command = "select * from tbl_subcategory order by subcat_name";
            DataTable subcat = db.executeSelect(command);
            ViewBag.subcat = subcat;

            string all = "select * from tbl_product";
            DataTable product = db.executeSelect(all);
            ViewBag.all = product;
            return View();
        }
        // add product data in database
        [HttpPost]
        public ActionResult Product(int? pcat,int? psubcat,string pname, string pdesc, string pmodel, string psize, int psalerate, int pmrp,HttpPostedFileBase picon)
        {
            string query = "insert into tbl_product values(" + pcat + "," + psubcat + ",'" + pname + "','" + pdesc + "','" + pmodel + "'," + pmrp + "," + psalerate +",'" + psize + "','" + picon.FileName + "','"+DateTime.Now.ToString("yyyy-MM-dd")+"')";
            int result = db.executeInsertUpdateDelete(query);
            if(result> 0) {
                picon.SaveAs(Server.MapPath("/Content/productpic/") + picon.FileName);
                return Content("<script>alert('Data Added');location.href='/Admin/Product'</script>");
            }
            else
            {
                return Content("<script>alert('Data not Added');location.href='/Admin/Product'</script>");
            }
        }
        public ActionResult Management()
        {
            return View();
        }
        public ActionResult Cart()
        {
            return View();
        }
        public ActionResult Orders()
        {
            return View();
        }
        public ActionResult Password()
        {
            return View();
        }
        public ActionResult Contact()
        {
            string enquiry = "select * from tbl_contact";
            DataTable dt = db.executeSelect(enquiry);
            ViewBag.enquiry = dt;
            return View();
        }
        public ActionResult User()
        {
            return View();
        }
        public ActionResult Productmgmt()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session.Remove("admin");
            return RedirectToAction("adminlogin","home");
        }
    }
    //filter to check session before exetucation any action method of adminzone
    class CheckSession : ActionFilterAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            HttpSessionStateBase Session= filterContext.HttpContext.Session;
            if (Session["admin"]==null)
            {
                filterContext.Result =new RedirectToRouteResult
                    (new System.Web.Routing.RouteValueDictionary
                {
                    {"Controller","Home" },

                    {"Action","adminlogin" }
                });
            }
        }
    }
}