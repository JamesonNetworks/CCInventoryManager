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
    public class OrderItemController : Controller
    {
        private CCINVEntities db = new CCINVEntities();

        //
        // GET: /OrderItem/

        public ActionResult Index(int Order_ID)
        {
            var orderitems = db.OrderItems.Include(o => o.Item).Include(o => o.Order).Where(o => o.Order_ID == Order_ID);
            ViewBag.currentOrder = Order_ID;
            return View(orderitems.ToList());
        }

        //
        // GET: /OrderItem/Details/5

        public ActionResult Details(int id = 0)
        {
            OrderItem orderitem = db.OrderItems.Find(id);
            if (orderitem == null)
            {
                return HttpNotFound();
            }
            ViewBag.currentOrder = id;
            return View(orderitem);
        }

        //
        // GET: /OrderItem/Create

        //public ActionResult Create()
        //{
        //    ViewBag.Item_ID = new SelectList(db.Items, "ID", "Name");
        //    ViewBag.Order_ID = new SelectList(db.Orders, "ID", "ID");
        //    return View();
        //}

        public ActionResult Create(int Order_ID)
        {
            ViewBag.Order_ID = Order_ID;

            var items = db.Items;
            List<object> newList = new List<object>();
            foreach (var i in items)
                newList.Add(new
                {
                    Id = i.ID,
                    Name = i.Name + " - from - " + i.Manufacturer.Name
                });
            this.ViewData["Item_ID"] = new SelectList(newList, "Id", "Name");

            ViewBag.currentOrder = Order_ID;
            return View();
        }

        //
        // POST: /OrderItem/Create

        [HttpPost]
        public ActionResult Create(OrderItem orderitem)
        {
            if (ModelState.IsValid)
            {
                db.OrderItems.Add(orderitem);
                db.SaveChanges();
                return RedirectToAction("Index",
                                        "OrderItem",
                                        new { Order_ID = orderitem.Order_ID });
            }

            ViewBag.Item_ID = new SelectList(db.Items, "ID", "Name", orderitem.Item_ID);
            ViewBag.Order_ID = new SelectList(db.Orders, "ID", "ID", orderitem.Order_ID);
            return View(orderitem);
        }

        //
        // GET: /OrderItem/Edit/5

        public ActionResult Edit(int id = 0)
        {
            OrderItem orderitem = db.OrderItems.Find(id);
            if (orderitem == null)
            {
                return HttpNotFound();
            }
            ViewBag.Item_ID = new SelectList(db.Items, "ID", "Name", orderitem.Item_ID);
            ViewBag.Order_ID = new SelectList(db.Orders, "ID", "ID", orderitem.Order_ID);
            ViewBag.currentOrder = id;
            return View(orderitem);
        }

        //
        // POST: /OrderItem/Edit/5

        [HttpPost]
        public ActionResult Edit(OrderItem orderitem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(orderitem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Item_ID = new SelectList(db.Items, "ID", "Name", orderitem.Item_ID);
            ViewBag.Order_ID = new SelectList(db.Orders, "ID", "ID", orderitem.Order_ID);
            ViewBag.currentOrder = orderitem.Order_ID;
            return View(orderitem);
        }

        //
        // GET: /OrderItem/Delete/5

        public ActionResult Delete(int id = 0)
        {
            OrderItem orderitem = db.OrderItems.Find(id);
            if (orderitem == null)
            {
                return HttpNotFound();
            }
            return View(orderitem);
        }

        //
        // POST: /OrderItem/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            OrderItem orderitem = db.OrderItems.Find(id);
            var order_id = orderitem.Order_ID;
            db.OrderItems.Remove(orderitem);
            db.SaveChanges();
            return RedirectToAction("Details", "Order", new { id = order_id});
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}