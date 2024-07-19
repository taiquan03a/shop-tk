package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.HoaTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.service.ThuocTinhSpService.HoaTietService;
import com.datn.sd43_datn.service.ThuocTinhSpService.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/HoaTiet")
public class HoaTietController {
    @Autowired
    HoaTietService HoaTietServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("HoaTiets", HoaTietServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/HoaTiet/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        HoaTiet hoaTiet = HoaTietServiceIpm.findById(id).get();
        if (hoaTiet != null) {
            model.addAttribute("hoaTiet", hoaTiet);
        } else {
            model.addAttribute("hoaTiet", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/HoaTiet/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        HoaTiet hoaTiet = new HoaTiet();
        model.addAttribute("hoaTiet", hoaTiet);
        return "SanPhamChiTiet/ThuocTinhSp/HoaTiet/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("hoaTiet") HoaTiet hoaTiet){
        HoaTietServiceIpm.save(hoaTiet);
        return "redirect:/HoaTiet/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("hoaTiet") HoaTiet hoaTiet) {
        try {
            HoaTiet hoaTietCurrent = HoaTietServiceIpm.findById(id).get();
            hoaTietCurrent.setTenHoaTiet(hoaTiet.getTenHoaTiet());
            hoaTietCurrent.setMoTa(hoaTiet.getMoTa());
            HoaTietServiceIpm.save(hoaTietCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/HoaTiet/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            HoaTietServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
//        return "redirect:/SanPhamChiTiet/ThuocTinhSp/MauSac/list";
        return "redirect:/HoaTiet/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("HoaTiets", HoaTietServiceIpm.findByHoaTietKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/HoaTiet/list";
    }
}
