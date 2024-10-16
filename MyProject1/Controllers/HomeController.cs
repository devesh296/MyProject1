using MyProject1.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace MyProject1.Controllers
{
    public class HomeController : Controller
    {
        DBManager db = new DBManager();
        // GET: Home
        public ActionResult Index()
        {
            CartCount();
            string query = "select top 12 * from tbl_category order by cname";
            DataTable category = db.executeSelect(query);
            ViewBag.category = category;

            string query1 = "select top 12 *, ((mrp-salerate)*100)/mrp from tbl_product order by ((mrp-salerate)*100)/mrp desc";
            DataTable product1 = db.executeSelect(query1);
            ViewBag.product1 = product1;

            string query2 = "select top 12 *, ((mrp-salerate)*100)/mrp  from tbl_product order by pid desc";
            DataTable product2 = db.executeSelect(query2);
            ViewBag.product2 = product2;

            return View();
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Product(int? cid,int? scat)
        {
            string query1, query2;
            if (cid.HasValue)
            {
                if (scat.HasValue)
                {
                    query2 = "select *, ((mrp-salerate) *100)/mrp from tbl_product where sub_cid = " + scat;

                }
                else
                {
                    query2 = "select *, ((mrp-salerate) *100)/mrp from tbl_product where cid = " + cid;

                }
                query1 = "select * from tbl_subcategory where cid=" + cid;
            }
            else
            {
                query1 = "select * from tbl_subcategory";
                query2 = "select *, ((mrp-salerate) *100)/mrp from tbl_product";
            }
            ViewBag.subcat = db.executeSelect(query1);
            ViewBag.product1 = db.executeSelect(query2);
            
            return View();
        }
        public ActionResult signIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult signIn(string email, string password)
        {
            string query = "select * from tbl_user where email='" + email + "' and password='" + password + "'";
            DataTable dt = db.executeSelect(query);
            if (dt.Rows.Count > 0)
            {
                Session["username"] = dt.Rows[0][0];
                Session["useremail"] = dt.Rows[0][1];
                return RedirectToAction("index");
            }
            else
            {

                return Content("<script>alret('user not found');location.href:'/home/signIn'</script>");
            }

        }
        public ActionResult AdminLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AdminLogin(string adminid, string password)
        {
            string query = "select * from tbl_adminlogin where adminid ='" + adminid + "' and password ='" + password + "' ";
            DBManager dBManager = new DBManager();
            DataTable dt = dBManager.executeSelect(query);
            if (dt.Rows.Count > 0)
            {
                Session["admin"] = adminid;
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                return Content("<script>alert('id and data is not match'); location.href='/home/AdminLogin'</script>");
            }
        }
        public ActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(string name, string email, long? mobno, string password, string address, string landmark, int pincode)
        {
            DBManager dbManager = new DBManager();
            string query = ("insert into tbl_user values('" + name + "','" + email + "'," + mobno + ",'" + password + "','" + address + "','" + landmark + "'," + pincode + ",'" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss tt") + "')");
            int result = dbManager.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                return Content("<script>alert('data added');location.href='/home/signUp'</script>");
            }
            else
            {
                return Content("<script>alert('data not added');location.href='/home/signUp'</script>");
            }
        }
        public ActionResult Customer()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Customer(string name, string email, long? mobno, string message)
        {
            DBManager dm = new DBManager();
            int x = dm.executeInsertUpdateDelete("insert into tbl_contact values('" + name + "','" + mobno + "','" + email + "','" + message + "','" + DateTime.Now.ToString("yyyy-MM-dd hh:mm tt") + "')");
            if (x > 0)
            {
                Response.Write("<script>alert('Thanks for contacting with us...')</script>");
            }
            else
            {
                Response.Write("<script>alert('Data not saved...')</script>");
            }
            return View();
        }

        [CheckUserSession]
        [HttpPost]
        public ActionResult Addtocart(int? pid, int? salerate, int? quantity)
        {
            if (Session["useremail"].ToString() != null)
            {
                string email = Session["useremail"].ToString();
                string query = "insert into tbl_cart values(" + pid + ",'" + email + "'," + quantity + "," + salerate * quantity + ",'" + DateTime.Now.ToString("yyyy-MM-dd hh:mm tt") + "')";
                int result = db.executeInsertUpdateDelete(query);
                if (result > 0)
                {
                    return Content("<script>alert('Item Added to Cart.');location.href='/Home/Index'</script>");
                }
                else
                {
                    return RedirectToAction("/home/index");
                }
            }
            else
            {
                return RedirectToAction("index");
            }
        }
        public ActionResult LogOut()
        {
            Session.RemoveAll();
            return Redirect("index");
        }
        [CheckUserSession]
        [HttpPost]
        public void CartCount()
        {
            if (Session["useremail"] != null)
            {
                string email = Session["useremail"].ToString();
                string query = "select sum(quantity),sum(total) from tbl_cart where uid='" + email + "'";
                DataTable dt = db.executeSelect(query);
                if (dt.Rows.Count > 0)
                {
                    string cart = dt.Rows[0][0].ToString() + "items <br/>&#8377;" + dt.Rows[0][1].ToString();

                    Session["cart"] = cart;

                }
            }
        }
        [CheckUserSession]
        public ActionResult cart()
        {
            if (!Session["useremail"].ToString().Equals(null))
            {
                string email = Session["useremail"].ToString();
                string query = "select tbl_product.*,tbl_cart.*from tbl_cart left join tbl_product on tbl_cart.pid = tbl_product.pid where tbl_cart.uid='" + email + "'";
                DataTable dt = db.executeSelect(query);
                ViewBag.Cart = dt;
                return View();
            }
            else
            {
                return Content("<script>alert('Please try again after some time');location.href='/home/signIn'</script>");
            }

        }
        [CheckUserSession]
        public ActionResult Profile()
        {
            return View();
        }
        public ActionResult deleteitem(int? cid)
        {
            CartCount();
            string query = "delete from tbl_cart where cid=" + cid;
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                return Content("<script>alert('Item Deleted Successfully');location.href='/Home/cart'</script>");
            }
            else
            {
                return Content("<script>alert('Item Not Deleted');location.href='/Home/cart'</script>");
            }

        }
        [CheckUserSession]
        public ActionResult myorder()
        {
            if (!Session["useremail"].ToString().Equals(null))
            {
                string email = Session["useremail"].ToString();
                string query = "select tbl_product.*,tbl_order.*from tbl_order left join tbl_product on tbl_order.pid = tbl_product.pid where tbl_order.uid='" + email + "'";
                DataTable dt = db.executeSelect(query);
                ViewBag.order = dt;
                return View();
            }
            else
            {
                return Content("<script>alert('Please try again after some time');location.href='/home/signIn'</script>");
            }

        }
        public ActionResult order()
        {
           
            string email = Session["useremail"].ToString();
            DateTime today = DateTime.Now;
            string query = "insert into tbl_order select *,'Pending','" + today.ToString("yyyy-MM-dd hh:mm tt") + "' from tbl_cart where uid='" + email + "'";
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                string q2 = "delete from tbl_cart where uid='" + email + "'";
                db.executeInsertUpdateDelete(q2);
                CartCount();
                return Content("<script>alert('Order Successful, You can check status from My Order.');location.href='/Home/'</script>");
            }
            else
            {
                return Content("<script>alert('Order Declined,Try again after some time.');location.href='/Home/cart'</script>");
            }
        }

    }
    class CheckUserSession : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase Session = filterContext.HttpContext.Session;
            if (Session["useremail"] == null)
            {
                filterContext.Result = new RedirectToRouteResult
                    (new System.Web.Routing.RouteValueDictionary
                       {
                           {"Controller","Home" },

                           {"Action","signIn" }
                       }
                    );
            }
        }
    }
}