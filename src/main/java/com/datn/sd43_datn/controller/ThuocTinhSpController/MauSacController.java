package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.service.SanPhamService;
import com.datn.sd43_datn.service.ThuocTinhSpService.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
@RequestMapping("/MauSac")
public class MauSacController {
    @Autowired
    MauSacService MauSacServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("MauSacs", MauSacServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/MauSac/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        MauSac mauSac = MauSacServiceIpm.findById(id).get();
        if (mauSac != null) {
            model.addAttribute("mauSac", mauSac);
        } else {
            model.addAttribute("mauSac", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/MauSac/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        MauSac mauSac = new MauSac();
        model.addAttribute("mauSac", mauSac);
        return "SanPhamChiTiet/ThuocTinhSp/MauSac/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("mauSac") MauSac mauSac){
        MauSacServiceIpm.save(mauSac);
        return "redirect:/MauSac/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("mauSac") MauSac mauSac) {
        try {
            MauSac mauSacCurrent = MauSacServiceIpm.findById(id).get();
            mauSacCurrent.setTenMauSac(mauSac.getTenMauSac());
            mauSacCurrent.setMoTa(mauSac.getMoTa());
            MauSacServiceIpm.save(mauSacCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/MauSac/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            MauSacServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
//        return "redirect:/SanPhamChiTiet/ThuocTinhSp/MauSac/list";
        return "redirect:/MauSac/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("MauSacs", MauSacServiceIpm.findByMauSacKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/MauSac/list";
    }
}
