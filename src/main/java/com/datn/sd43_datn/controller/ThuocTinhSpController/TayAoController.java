package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.entity.ThuocTinhSp.TayAo;
import com.datn.sd43_datn.service.ThuocTinhSpService.MauSacService;
import com.datn.sd43_datn.service.ThuocTinhSpService.TayAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/TayAo")
public class TayAoController {
    @Autowired
    TayAoService TayAoServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("TayAos", TayAoServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/TayAo/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        TayAo tayAo = TayAoServiceIpm.findById(id).get();
        if (tayAo != null) {
            model.addAttribute("tayAo", tayAo);
        } else {
            model.addAttribute("tayAo", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/TayAo/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        TayAo tayAo = new TayAo();
        model.addAttribute("tayAo", tayAo);
        return "SanPhamChiTiet/ThuocTinhSp/TayAo/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("tayAo") TayAo tayAo){
        TayAoServiceIpm.save(tayAo);
        return "redirect:/TayAo/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("mauSac") TayAo tayAo) {
        try {
            TayAo tayAoCurrent = TayAoServiceIpm.findById(id).get();
            tayAoCurrent.setTenKieuTayAo(tayAo.getTenKieuTayAo());
            tayAoCurrent.setMoTa(tayAo.getMoTa());
            TayAoServiceIpm.save(tayAoCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/TayAo/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            TayAoServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
//        return "redirect:/SanPhamChiTiet/ThuocTinhSp/MauSac/list";
        return "redirect:/TayAo/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("TayAos", TayAoServiceIpm.findByTayAoKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/TayAo/list";
    }
}
