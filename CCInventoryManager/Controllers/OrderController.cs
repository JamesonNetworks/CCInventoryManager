using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CCInventoryManager.Models;

namespace CCInventoryManager.Controllers
{
    public class OrderController : Controller
    {
        private CCINVEntities db = new CCINVEntities();

        //
        // GET: /Order/

        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.PaymentInfo).Include(o => o.Shipper);
            return View(orders.ToList());
        }

        //
        // GET: /Order/Details/5

        public ActionResult Details(int id = 0)
        {
            var items = db.Items;
            List<object> newList = new List<object>();
            foreach (var i in items)
                newList.Add(new
                {
                    Id = i.ID,
                    Name = i.Name + " - from - " + i.Manufacturer.Name
                });
            this.ViewData["Item_ID"] = new SelectList(newList, "Id", "Name");
            ViewData["this_order_id"] = id;

            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        //
        // GET: /Order/Create

        public ActionResult Create()
        {
            ViewBag.PaymentInfo_ID = new SelectList(db.PaymentInfoes, "ID", "Method");
            ViewBag.Shipper_ID = new SelectList(db.Shippers, "ID", "Name");

            var customers = db.Customers;
            List<object> newList = new List<object>();
            foreach (var c in customers)
                newList.Add(new
                {
                    Id = c.ID,
                    Name = c.FirstName + " " + c.LastName
                });
            this.ViewData["Customer_ID"] = new SelectList(newList, "Id", "Name");

            return View();
        }

        //
        // POST: /Order/Create

        [HttpPost]
        public ActionResult Create(Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Customer_ID = new SelectList(db.Customers, "ID", "FirstName", order.Customer_ID);
            ViewBag.PaymentInfo_ID = new SelectList(db.PaymentInfoes, "ID", "Method", order.PaymentInfo_ID);
            ViewBag.Shipper_ID = new SelectList(db.Shippers, "ID", "Name", order.Shipper_ID);
            return View(order);
        }

        //
        // GET: /Order/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.Customer_ID = new SelectList(db.Customers, "ID", "ID", order.Customer_ID);
            ViewBag.PaymentInfo_ID = new SelectList(db.PaymentInfoes, "ID", "Method", order.PaymentInfo_ID);
            ViewBag.Shipper_ID = new SelectList(db.Shippers, "ID", "Name", order.Shipper_ID);
            return View(order);
        }

        //
        // POST: /Order/Edit/5

        [HttpPost]
        public ActionResult Edit(Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Customer_ID = new SelectList(db.Customers, "ID", "FirstName", order.Customer_ID);
            ViewBag.PaymentInfo_ID = new SelectList(db.PaymentInfoes, "ID", "Method", order.PaymentInfo_ID);
            ViewBag.Shipper_ID = new SelectList(db.Shippers, "ID", "Name", order.Shipper_ID);
            return View(order);
        }

        //
        // GET: /Order/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        //
        // POST: /Order/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult AddItem(OrderItem oi)
        {
            if (ModelState.IsValid)
            {
                db.OrderItems.Add(oi);
                db.SaveChanges();
                return RedirectToAction("Details",
                                        "Order",
                                        new { ID = oi.Order_ID });
            }

            return PartialView("_AddOrderItem", oi);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}