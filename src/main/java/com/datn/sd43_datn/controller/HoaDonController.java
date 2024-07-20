package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.entity.HoaDon;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.repository.TrangThaiDonHangRepository;
import com.datn.sd43_datn.request.TaoDonHangRequest;
import com.datn.sd43_datn.request.UpdateDonHangRequest;
import com.datn.sd43_datn.service.GiamGiaService;
import com.datn.sd43_datn.service.HoaDonService;
import com.datn.sd43_datn.service.SanPhamChiTietService;
import com.datn.sd43_datn.service.SanPhamService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;


@Controller
@RequestMapping("/hoa-don")
@AllArgsConstructor
public class HoaDonController {
    final private HoaDonService hoaDonService;
    final private SanPhamChiTietService sanPhamChiTietService;
    final private GiamGiaService giamGiaService;
    final private TrangThaiDonHangRepository trangThaiDonRepository;

    @GetMapping("/index")
    public String getDonHang(Model model) {
        model.addAttribute("hoaDons", hoaDonService.getHoaDonRequests());
        model.addAttribute("trangThais",trangThaiDonRepository.findAll());
        return "HoaDon/HoaDon";
    }
    @GetMapping("donHang/{id}")
    public String getHoaDon(Model model, @PathVariable long id) {
//        UpdateDonHangRequest updateDonHangRequest = new UpdateDonHangRequest();
        model.addAttribute("detail",hoaDonService.getHoaDonDetail(id));
        model.addAttribute("sanPhams",sanPhamChiTietService.getSanPhamChiTiet());
//        model.addAttribute("updateDonHangRequest",updateDonHangRequest);
        return "HoaDon/ChiTiet";
    }
//    @PostMapping("donHang/{id}")
//    public String updateHoaDon(Model model, @PathVariable long id,@ModelAttribute("updateDonHangRequest") UpdateDonHangRequest updateDonHangRequest) {
//        System.out.println(updateDonHangRequest);
//        hoaDonService.updateHoaDon(updateDonHangRequest,id);
//        model.addAttribute("detail",hoaDonService.getHoaDonDetail(id));
//        model.addAttribute("sanPhams",sanPhamChiTietService.getSanPhamChiTiet());
//        model.addAttribute("updateDonHangRequest",updateDonHangRequest);
//        return "HoaDon/ChiTiet";
//    }
    @GetMapping("donHangUP/{id}")
    public String postHoaDon(@PathVariable long id, Model model) {
        UpdateDonHangRequest updateDonHangRequest = new UpdateDonHangRequest();
        model.addAttribute("detail",hoaDonService.updateTrangThai(id));
        model.addAttribute("sanPhams",sanPhamChiTietService.getSanPhamChiTiet());
//        model.addAttribute("updateDonHangRequest",updateDonHangRequest);
        return "redirect:/hoa-don/donHang/"+id;
    }
    @GetMapping("donHangHuy/{id}")
    public String postHoaDonHuy(@PathVariable long id, Model model) {
        UpdateDonHangRequest updateDonHangRequest = new UpdateDonHangRequest();
        model.addAttribute("detail",hoaDonService.huyTrangThai(id));
        model.addAttribute("sanPhams",sanPhamChiTietService.getSanPhamChiTiet());
//        model.addAttribute("updateDonHangRequest",updateDonHangRequest);
        return "redirect:/hoa-don/donHang/"+id;
    }
    @GetMapping("create")
    public String create(Model model) {
        TaoDonHangRequest createDonHangRequest = new TaoDonHangRequest();
        model.addAttribute("sanPhams",sanPhamChiTietService.getSanPhamChiTiet());
        model.addAttribute("giamGias",giamGiaService.getGiamGia());
        model.addAttribute("createDonHangRequest",createDonHangRequest);
        return "HoaDon/BanHangTaiQuay";
    }
    @GetMapping("/filter")
    public String filter(Model model,
                         @RequestParam String search,
                         @RequestParam String status,
                         @RequestParam String batDau,
                         @RequestParam String ketThuc
    ) throws ParseException {
        System.out.println(batDau + " " + ketThuc);
        model.addAttribute("hoaDons", hoaDonService.filterHoaDonRequest(search,status,batDau,ketThuc));
        model.addAttribute("trangThais",trangThaiDonRepository.findAll());
        System.out.println(/*search+*/status + batDau + ketThuc);
        return "HoaDon/Hoadon";
    }
    @PostMapping("create")
    public String createHoaDon(Model model, @ModelAttribute("createDonHangRequest") TaoDonHangRequest createDonHangRequest){
        System.out.println(createDonHangRequest);
        hoaDonService.addHoaDon(createDonHangRequest);
        model.addAttribute("hoaDons", hoaDonService.getHoaDonRequests());
        model.addAttribute("trangThais",trangThaiDonRepository.findAll());
        return "HoaDon/Hoadon";
    }
}
