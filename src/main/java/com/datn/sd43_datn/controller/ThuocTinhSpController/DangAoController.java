package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.DangAo;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.service.ThuocTinhSpService.DangAoService;
import com.datn.sd43_datn.service.ThuocTinhSpService.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/DangAo")
public class DangAoController {
    @Autowired
    DangAoService DangAoServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("DangAos", DangAoServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/DangAo/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        DangAo dangAo = DangAoServiceIpm.findById(id).get();
        if (dangAo != null) {
            model.addAttribute("dangAo", dangAo);
        } else {
            model.addAttribute("dangAo", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/DangAo/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        DangAo dangAo = new DangAo();
        model.addAttribute("dangAo", dangAo);
        return "SanPhamChiTiet/ThuocTinhSp/DangAo/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("dangAo") DangAo dangAo){
        DangAoServiceIpm.save(dangAo);
        return "redirect:/DangAo/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("dangAo") DangAo dangAo) {
        try {
            DangAo dangAoCurrent = DangAoServiceIpm.findById(id).get();
            dangAoCurrent.setTenKieuDangAo(dangAo.getTenKieuDangAo());
            dangAoCurrent.setMoTa(dangAo.getMoTa());
            DangAoServiceIpm.save(dangAoCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/DangAo/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            DangAoServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
//        return "redirect:/SanPhamChiTiet/ThuocTinhSp/MauSac/list";
        return "redirect:/DangAo/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("DangAos", DangAoServiceIpm.findByDangAoKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/DangAo/list";
    }
}
