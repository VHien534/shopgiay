using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Controllers
{
    public class LoaiSP_63132041Controller : Controller
    {
        private WebBanGiay_63132041Entities1 db = new WebBanGiay_63132041Entities1();

        // GET: LoaiSP_63132041
        public ActionResult BNUPartial(string categoryName)
        {
            var bnu = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "BNU").Take(5).ToList();
            return PartialView(bnu);
        }
        public ActionResult DNPartial(string categoryName)
        {
            var dn = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "DN").Take(5).ToList();
            return PartialView(dn);
        }
        public ActionResult DSPartial(string categoryName)
        {
            var ds = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "DS").Take(5).ToList();
            return PartialView(ds);
        }
        public ActionResult GBPPartial(string categoryName)
        {
            var gbp = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "GBP").Take(5).ToList();
            return PartialView(gbp);
        }
        public ActionResult GCGPartial(string categoryName)
        {
            var gcg = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "GCG").Take(5).ToList();
            return PartialView(gcg);
        }
        public ActionResult GMNPartial(string categoryName)
        {
            var gmn = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "GMN").Take(5).ToList();
            return PartialView(gmn);
        }
        public ActionResult GSNPartial(string categoryName)
        {
            var gsn = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "GSN").Take(5).ToList();
            return PartialView(gsn);
        }
        public ActionResult GTPartial(string categoryName)
        {
            var gt = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "GT").Take(5).ToList();
            return PartialView(gt);
        }
        public ActionResult GTTNPartial(string categoryName)
        {
            var gttn = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "GTTN").Take(5).ToList();
            return PartialView(gttn);
        }
        public ActionResult SDNPartial(string categoryName)
        {
            var sdn = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "SDN").Take(5).ToList();
            return PartialView(sdn);
        }
        public ActionResult BNPartial(string categoryName)
        {
            var bn = db.SanPhams.Include("LoaiSanPham").Include("NhaCungCap").Where(n => n.MaLoaiSP == "BN").Take(5).ToList();
            return PartialView(bn);
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