using CCInventoryManager.db_populate;
using CCInventoryManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CCInventoryManager.Controllers
{
    public class HomeController : Controller
    {
        private CCINVEntities _db = new CCINVEntities();

        public ActionResult Index()
        {
            ViewBag.Message = "";

            return View();
        }

        public ActionResult Populate()
        {
            ViewBag.Message = "Populated the database";
            db_populater test = new db_populater();
            //test.populateCustomers();
            //test.populateManufacturers();
            //test.populateItems();
            return View();
        }

        public ActionResult ManageOrders()
        {
            var query = from o in _db.Orders
                        select o;

            List<Order> AllOrders = query.ToList();

            return View(AllOrders);
        }

        public ActionResult ManageItems()
        {
            var query = from i in _db.Items
                        join man in _db.Manufacturers on i.Manufacturer_ID equals man.ID
                        select i;

            List<Item> AllItems = query.ToList();

            return View(AllItems);
        }

        public ActionResult ManageManufacturers()
        {
            var query = from m in _db.Manufacturers
                        select m;
            List<Manufacturer> AllMan = query.ToList();

            return View(AllMan);
        }

        public ActionResult ManageCustomers()
        {
            var query = from c in _db.Customers
                        orderby c.LastName
                        select c;
            List<Customer> AllCust = query.ToList();

            return View(AllCust);
        }
    }
}
