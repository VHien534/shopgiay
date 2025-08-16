using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Controllers
{
    public class DonHangmain_63132041Controller : Controller
    {
        private WebBanGiay_63132041Entities1 db = new WebBanGiay_63132041Entities1();

        // GET: DonHang_63132041
        public ActionResult Index()
        {
            if (Session["use"] == null)
            {
                return RedirectToAction("DangNhap", "DKDN_63132041");
            }
            NguoiDung nd = (NguoiDung)Session["use"];
            string maND = nd.MaNguoiDung.ToString();
            var donhang = db.DonHangs.Where(x => x.MaNguoiDung == maND).ToList();
            return View(donhang.ToList());
        }

        public ActionResult Details(string maDH)
        {
            if (maDH == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            DonHang dh = db.DonHangs.Find(maDH);
            var chitiet = db.ChiTietDonHangs.Where(d => d.MaDH == maDH).ToList();

            if (dh == null)
            {
                return HttpNotFound();
            }

            return View(chitiet);
        }

    }
}
