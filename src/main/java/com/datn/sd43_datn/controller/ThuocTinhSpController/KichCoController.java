package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.KichCo;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.service.ThuocTinhSpService.KichCoService;
import com.datn.sd43_datn.service.ThuocTinhSpService.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/KichCo")
public class KichCoController {
    @Autowired
    KichCoService KichCoServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("KichCos", KichCoServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/KichCo/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        KichCo kichCo = KichCoServiceIpm.findById(id).get();
        if (kichCo != null) {
            model.addAttribute("kichCo", kichCo);
        } else {
            model.addAttribute("kichCo", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/KichCo/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        KichCo kichCo = new KichCo();
        model.addAttribute("kichCo", kichCo);
        return "SanPhamChiTiet/ThuocTinhSp/KichCo/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("kichCo") KichCo kichCo){
        KichCoServiceIpm.save(kichCo);
        return "redirect:/KichCo/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("kichCo") KichCo kichCo) {
        try {
            KichCo kichCoCurrent = KichCoServiceIpm.findById(id).get();
            kichCoCurrent.setTenKichCo(kichCo.getTenKichCo());
            kichCoCurrent.setMoTa(kichCo.getMoTa());
            KichCoServiceIpm.save(kichCoCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/KichCo/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            KichCoServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
//        return "redirect:/SanPhamChiTiet/ThuocTinhSp/MauSac/list";
        return "redirect:/KichCo/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("KichCos", KichCoServiceIpm.findByKichCoKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/KichCo/list";
    }
}
