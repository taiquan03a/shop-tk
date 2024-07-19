package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.dto.KhachHangDto;
import com.datn.sd43_datn.dto.NhanVienDto;
import com.datn.sd43_datn.request.DiaChiRequest;
import com.datn.sd43_datn.request.TaoNhanVienRequest;
import com.datn.sd43_datn.service.NhanVienService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/nhan-vien")
@AllArgsConstructor
public class NhanVienController {
    final private NhanVienService nhanVienService;

    @GetMapping("/index")
    public String getNhanVien(Model model) {
        model.addAttribute("nhanViens", nhanVienService.getNhanVien());
        return "NhanVien/NhanVien";
    }

    @GetMapping("create")
    public String create(Model model) {
        TaoNhanVienRequest createNhanVien = new TaoNhanVienRequest();
        model.addAttribute("createNhanVien", createNhanVien);
        return "NhanVien/TaoNhanVien";
    }

    @PostMapping("create")
    public String create(@ModelAttribute TaoNhanVienRequest createNhanVien, Model model) {
        System.out.println(createNhanVien);
        nhanVienService.addNhanVien(createNhanVien);
//        return "KhachHang/KhachHang";
        return "redirect:/nhan-vien/index";
    }

    @GetMapping("/{id}")
    public String getNhanVien(@PathVariable long id, Model model) {
        NhanVienDto nhanVienDto = new NhanVienDto();
        model.addAttribute("nhanVienDto", nhanVienDto);
        model.addAttribute("nhanVien", nhanVienService.getNhanVienById(id));
        return "NhanVien/SuaNhanVien";
    }

    @PostMapping("/edit/{id}")
    public String edit(@PathVariable long id, @ModelAttribute NhanVienDto nhanVienDto , Model model) {
        System.out.println(nhanVienDto);
        nhanVienService.editNhanVien(nhanVienDto,id);
//        return "redirect:/khach-hang/"+id;
        return "redirect:/nhan-vien/index";
    }

    @GetMapping("/status/{id}")
    public String status(@PathVariable long id, Model model) {
        nhanVienService.status(id);
        return "redirect:/nhan-vien/index";
    }

    @GetMapping("filter")
    public String filter(Model model,@RequestParam String search) {
        model.addAttribute("nhanViens", nhanVienService.filter(search));
        return "NhanVien/NhanVien";
    }
}
