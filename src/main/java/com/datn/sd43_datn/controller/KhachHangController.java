package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.dto.KhachHangDto;
import com.datn.sd43_datn.entity.KHang.DiaChi;
import com.datn.sd43_datn.repository.DiaChiRepository;
import com.datn.sd43_datn.request.DiaChiRequest;
import com.datn.sd43_datn.request.TaoKhachHangRequest;
import com.datn.sd43_datn.service.KhachHangService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/khach-hang")
@AllArgsConstructor
public class KhachHangController {
    final private KhachHangService khachHangService;
    final private DiaChiRepository diaChiRepository;

    @GetMapping("/index")
    public String getKhachHang(Model model) {
        model.addAttribute("khachHangs", khachHangService.getKhachHang());
        return "KhachHang/KhachHang";
    }
    @GetMapping("create")
    public String create(Model model) {
        TaoKhachHangRequest createKhachHang = new TaoKhachHangRequest();
        model.addAttribute("createKhachHang", createKhachHang);
        return "KhachHang/TaoKhachHang";
    }
//    @PostMapping("create")
//    public String create(@ModelAttribute TaoKhachHangRequest createKhachHang, Model model) {
//        System.out.println(createKhachHang);
//        khachHangService.addKhachHang(createKhachHang);
////        return "KhachHang/KhachHang";
//        return "redirect:/khach-hang/index";
//    }
    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("createKhachHang") TaoKhachHangRequest createKhachHang, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "KhachHang/TaoKhachHang";
        }
        khachHangService.addKhachHang(createKhachHang);
        return "redirect:/khach-hang/index";
    }
    @GetMapping("/{id}")
    public String getKhachHang(@PathVariable long id, Model model) {
        DiaChiRequest diaChiRequest = new DiaChiRequest();
        KhachHangDto khachHangDto = new KhachHangDto();
        model.addAttribute("diaChiRequest", diaChiRequest);
        model.addAttribute("khachHangDto", khachHangDto);
        model.addAttribute("khachHang", khachHangService.getKhachHangById(id));
        return "KhachHang/SuaKhachHang";
    }
    @PostMapping("/{id}")
    public String createDiaChi(@PathVariable long id,@ModelAttribute DiaChiRequest diaChiRequest, Model model) {
        model.addAttribute("diaChiRequest", diaChiRequest);
        model.addAttribute("khachHang", khachHangService.getKhachHangById(id));
        System.out.println(diaChiRequest);
        khachHangService.addDiaChi(id,diaChiRequest);
        return "redirect:/khach-hang/"+id;
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id, Model model) {
        DiaChi diaChi = diaChiRepository.findById(id).orElse(null);
        long khachHangId = diaChi.getKhachHang().getID();
        khachHangService.deleteDiaChi(id);
        model.addAttribute("khachHangId", khachHangId);
        return "redirect:/khach-hang/"+khachHangId;
    }
    @PostMapping("/edit/{id}")
    public String edit(@PathVariable long id,@ModelAttribute KhachHangDto khachHangDto ,Model model) {
        System.out.println(khachHangDto);
        khachHangService.editKhachHang(khachHangDto,id);
//        return "redirect:/khach-hang/"+id;
        return "redirect:/khach-hang/index";
    }

    @GetMapping("/status/{id}")
    public String status(@PathVariable long id, Model model) {
        khachHangService.status(id);
        return "redirect:/khach-hang/index";
    }

    @GetMapping("filter")
    public String filter(Model model,@RequestParam String search) {
        model.addAttribute("khachHangs", khachHangService.filter(search));
        return "KhachHang/KhachHang";
    }
}

