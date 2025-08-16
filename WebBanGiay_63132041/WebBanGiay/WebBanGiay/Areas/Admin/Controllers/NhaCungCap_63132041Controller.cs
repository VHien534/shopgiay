using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class NhaCungCap_63132041Controller : Controller
    {
        private WebBanGiay_63132041Entities1 db = new WebBanGiay_63132041Entities1();

        // GET: Admin/NhaCungCap_63132041
        public ActionResult Index()
        {
            return View(db.NhaCungCaps.ToList());
        }
        [HttpGet]
        public ActionResult Index(string maNCC = "", string tenNCC = "")
        {
            ViewBag.maNCC = maNCC;
            ViewBag.tenNCC = tenNCC;
            var nhaCC = db.NhaCungCaps.SqlQuery("TimKiemNCC '" + maNCC + "', N'" + tenNCC + "'");
            if (nhaCC.Count() == 0)
                ViewBag.TB = "Không có thông tin tìm kiếm.";
            return View(nhaCC.ToList());
        }

        string LayMaNCC()
        {
            var maMax = db.NhaCungCaps.ToList().Select(n => n.MaNCC).Max();
            int maNCC = 1; // Default value if maMax is null or if parsing fails

            if (!string.IsNullOrEmpty(maMax) && maMax.StartsWith("NCC"))
            {
                string numericPart = maMax.Substring(3); // Extract numeric part after "NCC"
                if (int.TryParse(numericPart, out int parsedMaNCC))
                {
                    maNCC = parsedMaNCC + 1;
                }
            }

            string ncc = String.Concat("00", maNCC.ToString());
            return "NCC" + ncc.Substring(maNCC.ToString().Length - 1);
        }

        public ActionResult Create()
        {
            ViewBag.MaNCC = LayMaNCC();
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNCC,TenNCC,EmailNCC,SDTNCC,DiaChiNCC")] NhaCungCap nhaCungCap)
        {
            if (ModelState.IsValid)
            {
                nhaCungCap.MaNCC = LayMaNCC();
                db.NhaCungCaps.Add(nhaCungCap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nhaCungCap);
        }
        // GET: Admin/NhaCungCap_63132041/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            if (nhaCungCap == null)
            {
                return HttpNotFound();
            }
            return View(nhaCungCap);
        }

        // POST: Admin/NhaCungCap_63132041/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNCC,TenNCC,EmailNCC,SDTNCC,DiaChiNCC")] NhaCungCap nhaCungCap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhaCungCap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nhaCungCap);
        }

        // GET: Admin/NhaCungCap_63132041/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            if (nhaCungCap == null)
            {
                return HttpNotFound();
            }
            return View(nhaCungCap);
        }

        // POST: Admin/NhaCungCap_63132041/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            db.NhaCungCaps.Remove(nhaCungCap);
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
