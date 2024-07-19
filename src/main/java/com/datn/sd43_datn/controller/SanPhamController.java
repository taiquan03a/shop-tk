package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import com.datn.sd43_datn.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/SanPham")
public class SanPhamController {
    @Autowired
    SanPhamService SanPhamServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("SanPhams", SanPhamServiceIpm.getAllSanPham());
        return "SanPham/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        SanPham sanPham = SanPhamServiceIpm.findById(id).get();
        if (sanPham != null) {
            model.addAttribute("sanPham", sanPham);
        } else {
            model.addAttribute("sanPham", new SanPhamChiTiet());
        }
        return "SanPham/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        SanPham sanPham = new SanPham();
        model.addAttribute("sanPham", sanPham);
        return "SanPham/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("sanPham") SanPham sanPham){
        sanPham.setNgayTao(new Date(System.currentTimeMillis()));
        sanPham.setNguoiTao("nhân viên");
        sanPham.setTrangThai(0);
        System.out.println(sanPham);
        SanPhamServiceIpm.save(sanPham);
        return "redirect:/SanPham/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("sanPham") SanPham sanPham) {
        try {
            System.out.println(sanPham);
            SanPham sanPhamCurrent = SanPhamServiceIpm.findById(id).get();
            sanPhamCurrent.setTenSanPham(sanPham.getTenSanPham());
            sanPhamCurrent.setMoTa(sanPham.getMoTa());
            sanPhamCurrent.setNgayCapNhat(new Date(System.currentTimeMillis()));
            sanPhamCurrent.setNguoiCapNhat("admin");
            SanPhamServiceIpm.save(sanPhamCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/SanPham/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            SanPhamServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
        return "redirect:/SanPham/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("SanPhams", SanPhamServiceIpm.findBySanPhamKeyWord(keyword));
        return "SanPham/list";
    }
}