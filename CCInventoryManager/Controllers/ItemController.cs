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
    public class ItemController : Controller
    {
        private CCINVEntities db = new CCINVEntities();

        //
        // GET: /Item/

        public ActionResult Index()
        {
            var items = db.Items.Include(i => i.Manufacturer);
            return View(items.ToList());
        }

        //
        // GET: /Item/Details/5

        public ActionResult Details(int id = 0)
        {
            Item item = db.Items.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            return View(item);
        }

        //
        // GET: /Item/Create

        public ActionResult Create()
        {
            ViewBag.Manufacturer_ID = new SelectList(db.Manufacturers, "ID", "Name");
            return View();
        }

        //
        // POST: /Item/Create

        [HttpPost]
        public ActionResult Create(Item item)
        {
            if (ModelState.IsValid)
            {
                db.Items.Add(item);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Manufacturer_ID = new SelectList(db.Manufacturers, "ID", "Name", item.Manufacturer_ID);
            return View(item);
        }

        //
        // GET: /Item/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Item item = db.Items.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            ViewBag.Manufacturer_ID = new SelectList(db.Manufacturers, "ID", "Name", item.Manufacturer_ID);
            return View(item);
        }

        //
        // POST: /Item/Edit/5

        [HttpPost]
        public ActionResult Edit(Item item)
        {
            if (ModelState.IsValid)
            {
                db.Entry(item).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Manufacturer_ID = new SelectList(db.Manufacturers, "ID", "Name", item.Manufacturer_ID);
            return View(item);
        }

        //
        // GET: /Item/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Item item = db.Items.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            return View(item);
        }

        //
        // POST: /Item/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Item item = db.Items.Find(id);
            db.Items.Remove(item);
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