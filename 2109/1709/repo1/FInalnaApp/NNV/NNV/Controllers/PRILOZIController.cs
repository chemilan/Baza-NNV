using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using NNV.Models;

namespace NNV.Controllers
{
    public class PRILOZIController : Controller
    {
        private NNVContext db = new NNVContext();

        // GET: PRILOZI
        public ActionResult Index()
        {
            var prilozis = db.Prilozis.Include(p => p.Dokumentacijas);
            return View(prilozis.ToList());
        }

        // GET: PRILOZI/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prilozi prilozi = db.Prilozis.Find(id);
            if (prilozi == null)
            {
                return HttpNotFound();
            }
            return View(prilozi);
        }

        // GET: PRILOZI/Create
        public ActionResult Create()
        {
            ViewBag.ID_Dokumenta = new SelectList(db.Dokumentacijas, "ID_Dokumenta", "Naziv_Dokumenta");
            return View();
        }

        // POST: PRILOZI/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Redni_broj,ID_Dokumenta,ID_Sednice,Putanja,Poslato,Datum_slanja")] Prilozi prilozi)
        {
            if (ModelState.IsValid)
            {
                db.Prilozis.Add(prilozi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_Dokumenta = new SelectList(db.Dokumentacijas, "ID_Dokumenta", "Naziv_Dokumenta", prilozi.ID_Dokumenta);
            return View(prilozi);
        }

        // GET: PRILOZI/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prilozi prilozi = db.Prilozis.Find(id);
            if (prilozi == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_Dokumenta = new SelectList(db.Dokumentacijas, "ID_Dokumenta", "Naziv_Dokumenta", prilozi.ID_Dokumenta);
            return View(prilozi);
        }

        // POST: PRILOZI/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Redni_broj,ID_Dokumenta,ID_Sednice,Putanja,Poslato,Datum_slanja")] Prilozi prilozi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prilozi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_Dokumenta = new SelectList(db.Dokumentacijas, "ID_Dokumenta", "Naziv_Dokumenta", prilozi.ID_Dokumenta);
            return View(prilozi);
        }

        // GET: PRILOZI/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prilozi prilozi = db.Prilozis.Find(id);
            if (prilozi == null)
            {
                return HttpNotFound();
            }
            return View(prilozi);
        }

        // POST: PRILOZI/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Prilozi prilozi = db.Prilozis.Find(id);
            db.Prilozis.Remove(prilozi);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
