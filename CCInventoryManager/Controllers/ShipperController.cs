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
    public class ShipperController : Controller
    {
        private CCINVEntities db = new CCINVEntities();

        //
        // GET: /Shipper/

        public ActionResult Index()
        {
            return View(db.Shippers.ToList());
        }

        //
        // GET: /Shipper/Details/5

        public ActionResult Details(int id = 0)
        {
            Shipper shipper = db.Shippers.Find(id);
            if (shipper == null)
            {
                return HttpNotFound();
            }
            return View(shipper);
        }

        //
        // GET: /Shipper/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Shipper/Create

        [HttpPost]
        public ActionResult Create(Shipper shipper)
        {
            if (ModelState.IsValid)
            {
                db.Shippers.Add(shipper);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(shipper);
        }

        //
        // GET: /Shipper/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Shipper shipper = db.Shippers.Find(id);
            if (shipper == null)
            {
                return HttpNotFound();
            }
            return View(shipper);
        }

        //
        // POST: /Shipper/Edit/5

        [HttpPost]
        public ActionResult Edit(Shipper shipper)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shipper).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(shipper);
        }

        //
        // GET: /Shipper/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Shipper shipper = db.Shippers.Find(id);
            if (shipper == null)
            {
                return HttpNotFound();
            }
            return View(shipper);
        }

        //
        // POST: /Shipper/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Shipper shipper = db.Shippers.Find(id);
            db.Shippers.Remove(shipper);
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