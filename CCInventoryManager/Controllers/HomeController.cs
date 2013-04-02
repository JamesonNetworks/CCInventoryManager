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
            return RedirectToAction("Index", "Order");
        }

        public ActionResult ManageItems()
        {
            return RedirectToAction("Index", "Item");
        }

        public ActionResult ManageManufacturers()
        {
            return RedirectToAction("Index", "Manufacturer");
        }

        public ActionResult ManageCustomers()
        {
            return RedirectToAction("Index", "Customer");
        }
    }
}
