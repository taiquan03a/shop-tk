package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.entity.NhanVien;
import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import com.datn.sd43_datn.repository.NhanVienRepository;
import com.datn.sd43_datn.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
    @Autowired
    private NhanVienRepository nhanVienRepository;

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
    public String Add(@ModelAttribute("sanPham") SanPham sanPham,Model model){
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        NhanVien nhanVien = nhanVienRepository.findNhanVienByEmail(email);
        sanPham.setNgayTao(new Date(System.currentTimeMillis()));
        sanPham.setNguoiTao(nhanVien.getHoTen());
        sanPham.setTrangThai(0);
        System.out.println(sanPham);
        if(!SanPhamServiceIpm.save(sanPham)){
            SanPham sanPham1 = new SanPham();
            model.addAttribute("sanPham", sanPham1);
            model.addAttribute("message", "sản phẩm đã tồn tại");
            return "SanPham/add";
        }
        return "redirect:/SanPham/list";
    }

    @PostMapping("/update/{id}")
    public String update(Model model,RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("sanPham") SanPham sanPham) {
        try {
            System.out.println(sanPham);
            String email = SecurityContextHolder.getContext().getAuthentication().getName();
            NhanVien nhanVien = nhanVienRepository.findNhanVienByEmail(email);
            SanPham sanPhamCurrent = SanPhamServiceIpm.findById(id).get();
            sanPhamCurrent.setTenSanPham(sanPham.getTenSanPham());
            sanPhamCurrent.setMoTa(sanPham.getMoTa());
            sanPhamCurrent.setNgayCapNhat(new Date(System.currentTimeMillis()));
            sanPhamCurrent.setNguoiCapNhat(nhanVien.getHoTen());
            if(!SanPhamServiceIpm.save(sanPhamCurrent)){
                model.addAttribute("message", "sản phẩm đã tồn tại");
                return "redirect:/SanPham/update/" + id;
            }
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