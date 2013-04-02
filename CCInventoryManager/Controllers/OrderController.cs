﻿using System;
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
            ViewBag.Customer_ID = new SelectList(db.Customers, "ID", "ID");
            ViewBag.PaymentInfo_ID = new SelectList(db.PaymentInfoes, "ID", "Method");
            ViewBag.Shipper_ID = new SelectList(db.Shippers, "ID", "Name");
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

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}