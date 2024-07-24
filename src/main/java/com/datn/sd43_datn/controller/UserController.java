package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.dto.SanPhamGioHang;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.entity.KhachHang;
import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.request.CheckoutRequest;
import com.datn.sd43_datn.request.TaoKhachHangRequest;
import com.datn.sd43_datn.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;
    @Autowired
    private CartService cartService;
    @Autowired
    private HoaDonService hoaDonService;

    @GetMapping("/home")
    public String home(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        System.out.println(khachHang);
        model.addAttribute("sanPham",sanPhamService.getSanPhamHome());
        return "User/home";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable long id, Model model) {
        SanPham sanPham = sanPhamService.findById(id).get();
        String spCart = "";
        model.addAttribute("sanPham",sanPham);
        model.addAttribute("spCart",spCart);
        model.addAttribute("spct",sanPhamChiTietService.getBySanPham(sanPham));
        model.addAttribute("thuocTinh",sanPhamChiTietService.getListThuocTinhs(sanPham));
        return "User/product-detail";
    }
    @PostMapping("/login")
    public String login(Model model, @RequestParam String email, @RequestParam String password, HttpServletRequest request) {
        KhachHang khachHang = khachHangService.login(email, password);
        if (khachHang != null) {
            HttpSession session =  request.getSession();
            session.setAttribute("khachHang",khachHang);
            model.addAttribute("sanPham",sanPhamService.getSanPhamHome());
            return "redirect:home";
        }
        model.addAttribute("message", "Đăng nhập thất bại! Vui lòng thử lại.");
        model.addAttribute("email", email);
        return "Auth/login";
    }
    @GetMapping("/login")
    public String login(Model model) {
        TaoKhachHangRequest taoKhachHangRequest = new TaoKhachHangRequest();
        model.addAttribute("taoKhachHang",taoKhachHangRequest);
        return "Auth/login";
    }
    @PostMapping("/register")
    public String register(Model model, @ModelAttribute TaoKhachHangRequest taoKhachHangRequest) {
        System.out.println(taoKhachHangRequest);
        boolean kh = khachHangService.register(taoKhachHangRequest);
        return "redirect:/user/login";
    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        System.out.println("user logout");
        return "redirect:login";
    }
    @GetMapping("checkout")
    public String checkout(Model model,@RequestParam String spct1,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        System.out.println(spct1);
        CheckoutRequest checkoutRequest = new CheckoutRequest();
        model.addAttribute("spCart",cartService.getListSanPhamCart(spct1));
        model.addAttribute("checkoutRequest",checkoutRequest);
        return "User/checkout";
    }
    @PostMapping("checkout")
    public String chechoutPost(Model model,@ModelAttribute("checkoutRequest") CheckoutRequest checkoutRequest,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        hoaDonService.checkout(khachHang,checkoutRequest);
        System.out.println(checkoutRequest);
        return "User/checkout";
    }
    @GetMapping("cart")
    public String cart(Model model,@ModelAttribute("spCart") String spCart) {
        System.out.println(spCart);
        model.addAttribute("spCart",cartService.getListSanPhamCart(spCart));
        return "User/cart";
    }
    @GetMapping("list")
    public String list(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        model.addAttribute("sanPham",sanPhamService.getSanPhamHome());
        return "User/products";
    }
    @GetMapping("filter")
    public String filter(Model model,@RequestParam String sort,@RequestParam String keyword,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        model.addAttribute("sanPham",sanPhamService.filter(sort,keyword));
        return "User/products";
    }
    @GetMapping("order-history")
    public String orderHistory(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        model.addAttribute("hoaDon",hoaDonService.orderHistory(khachHang));
        return "User/order-history";
    }
}
