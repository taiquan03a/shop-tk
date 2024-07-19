package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.entity.ThuocTinhSp.ThuongHieu;
import com.datn.sd43_datn.service.ThuocTinhSpService.MauSacService;
import com.datn.sd43_datn.service.ThuocTinhSpService.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/ThuongHieu")
public class ThuongHieuController {
    @Autowired
    ThuongHieuService ThuongHieuServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("ThuongHieus", ThuongHieuServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/ThuongHieu/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        ThuongHieu thuongHieu = ThuongHieuServiceIpm.findById(id).get();
        if (thuongHieu != null) {
            model.addAttribute("thuongHieu", thuongHieu);
        } else {
            model.addAttribute("thuongHieu", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/ThuongHieu/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        ThuongHieu thuongHieu = new ThuongHieu();
        model.addAttribute("thuongHieu", thuongHieu);
        return "SanPhamChiTiet/ThuocTinhSp/ThuongHieu/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("thuongHieu") ThuongHieu thuongHieu){
        ThuongHieuServiceIpm.save(thuongHieu);
        return "redirect:/ThuongHieu/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("thuongHieu") ThuongHieu thuongHieu) {
        try {
            ThuongHieu thuongHieuCurrent = ThuongHieuServiceIpm.findById(id).get();
            thuongHieuCurrent.setTenThuongHieu(thuongHieu.getTenThuongHieu());
            thuongHieuCurrent.setMoTa(thuongHieu.getMoTa());
            ThuongHieuServiceIpm.save(thuongHieuCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/ThuongHieu/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            ThuongHieuServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
//        return "redirect:/SanPhamChiTiet/ThuocTinhSp/MauSac/list";
        return "redirect:/ThuongHieu/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("ThuongHieus", ThuongHieuServiceIpm.findByThuongHieuKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/ThuongHieu/list";
    }
}
