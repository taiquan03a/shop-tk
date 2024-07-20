package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.CoAo;
import com.datn.sd43_datn.service.ThuocTinhSpService.CoAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/CoAo")
public class CoAoController {
    @Autowired
    CoAoService CoAoServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("CoAos", CoAoServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/CoAo/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        CoAo coAo = CoAoServiceIpm.findById(id).get();
        if (coAo != null) {
            model.addAttribute("coAo", coAo);
        } else {
            model.addAttribute("coAo", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/CoAo/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        CoAo coAo = new CoAo();
        model.addAttribute("coAo", coAo);
        return "SanPhamChiTiet/ThuocTinhSp/CoAo/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("coAo") CoAo coAo){
        CoAoServiceIpm.save(coAo);
        return "/CoAo/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("coAo") CoAo coAo) {
        try {
            CoAo coAoCurrent = CoAoServiceIpm.findById(id).get();
            coAoCurrent.setTenLoaiCoAo(coAo.getTenLoaiCoAo());
            coAoCurrent.setMoTa(coAo.getMoTa());
            CoAoServiceIpm.save(coAoCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "/CoAo/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            CoAoServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
        return "redirect:/CoAo/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("CoAos", CoAoServiceIpm.findByCoAoKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/CoAo/list";
    }
}
