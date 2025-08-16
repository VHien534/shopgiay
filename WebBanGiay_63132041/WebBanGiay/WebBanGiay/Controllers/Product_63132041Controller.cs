using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Controllers
{
    public class Product_63132041Controller : Controller
    {
        private WebBanGiay_63132041Entities1 db = new WebBanGiay_63132041Entities1();

        // GET: Product_63132041
        public ActionResult Index(string sortOrder, string categoryName)
        {
            // Lấy danh sách sản phẩm từ cơ sở dữ liệu
            var products = db.SanPhams.AsQueryable();

            // Lọc theo danh mục nếu có
            if (!string.IsNullOrEmpty(categoryName))
            {
                products = products.Where(p => p.LoaiSanPham.TenLoai == categoryName);
            }

            // Xử lý sắp xếp theo giá trị sortOrder
            switch (sortOrder)
            {
                case "priceAsc":
                    products = products.OrderBy(p => p.GiaTien);
                    break;
                case "priceDesc":
                    products = products.OrderByDescending(p => p.GiaTien);
                    break;
                case "nameAsc":
                    products = products.OrderBy(p => p.TenSP);
                    break;
                case "nameDesc":
                    products = products.OrderByDescending(p => p.TenSP);
                    break;
                default:
                    products = products.OrderBy(p => p.TenSP); // Sắp xếp mặc định theo tên sản phẩm
                    break;
            }

            // Truyền dữ liệu danh mục và bộ đếm sản phẩm vào ViewBag
            ViewBag.Categories = db.LoaiSanPhams.ToList();
            ViewBag.ProductCount = products.Count();
            ViewBag.SortOrder = sortOrder;
            ViewBag.CategoryName = categoryName;

            return View(products.ToList());
        }


        // Danh mục PartialView
        public ActionResult DanhmucPartial()
        {
            var danhmuc = db.LoaiSanPhams.ToList();
            return PartialView("_DanhmucPartial", danhmuc);
        }

        // Tìm kiếm sản phẩm
        [HttpGet]
        public ActionResult TimKiem(string tenSP)
        {
            var sanPhams = db.SanPhams.Where(sp => sp.TenSP.Contains(tenSP)).ToList();
            ViewBag.tenSP = tenSP;
            ViewBag.ProductCount = sanPhams.Count();

            if (sanPhams.Count == 0)
            {
                ViewBag.ProductCount = 0;
            }

            return View(sanPhams);
        }

        // Lọc sản phẩm theo danh mục
        public ActionResult ProductFilter(string categoryName)
        {
            ViewBag.ProductCount = db.SanPhams.Where(x => x.LoaiSanPham.TenLoai == categoryName).Count();
            var items = db.SanPhams.Where(x => x.LoaiSanPham.TenLoai == categoryName).ToList();
            return View(items);
        }

        // Chi tiết sản phẩm
        public ActionResult Details(string id)
        {
            var details = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            if (details == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(details);
        }
    }
}
