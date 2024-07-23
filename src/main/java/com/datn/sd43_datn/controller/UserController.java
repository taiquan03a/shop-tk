package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.request.TaoKhachHangRequest;
import com.datn.sd43_datn.service.KhachHangService;
import com.datn.sd43_datn.service.SanPhamChiTietService;
import com.datn.sd43_datn.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("sanPham",sanPhamService.getSanPhamHome());
        return "User/home";
    }
    @GetMapping("detail/{id}")
    public String detail(@PathVariable long id, Model model) {
        SanPham sanPham = sanPhamService.findById(id).get();
        model.addAttribute("sanPham",sanPham);
        model.addAttribute("spct",sanPhamChiTietService.getBySanPham(sanPham));
        model.addAttribute("thuocTinh",sanPhamChiTietService.getListThuocTinhs(sanPham));
        return "User/product-detail";
    }
    @PostMapping("/login")
    public String login(Model model, @RequestParam String email, @RequestParam String password) {
        boolean login = khachHangService.login(email, password);
        if (login) {
            model.addAttribute("sanPham",sanPhamService.getSanPhamHome());
            model.addAttribute("khachHang",email);
            return "User/home";
        }
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
}
