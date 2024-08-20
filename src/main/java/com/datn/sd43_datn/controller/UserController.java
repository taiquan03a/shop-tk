package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.dto.KhachHangDto;
import com.datn.sd43_datn.dto.SanPhamGioHang;
import com.datn.sd43_datn.dto.SanPhamHomeDto;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.entity.KHang.DiaChi;
import com.datn.sd43_datn.entity.KhachHang;
import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import com.datn.sd43_datn.repository.DiaChiRepository;
import com.datn.sd43_datn.request.*;
import com.datn.sd43_datn.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;
    @Autowired
    private CartService cartService;
    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private DiaChiRepository diaChiRepository;

    @GetMapping("/home")
    public String home(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        System.out.println(khachHang);
        model.addAttribute("sanPhamHot",sanPhamService.getHotProduct());
        model.addAttribute("sanPhamNew",sanPhamService.getNewProduct());
        return "User/home";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable long id, Model model) {
        FilterSizeAndColor filterSizeAndColor = new FilterSizeAndColor();
        SanPham sanPham = sanPhamService.findById(id).get();
        String spCart = "";
        model.addAttribute("sanPham",sanPham);
        model.addAttribute("spCart",spCart);
        model.addAttribute("spct",sanPhamChiTietService.getBySanPham(sanPham));
        model.addAttribute("filterSizeAndColor",filterSizeAndColor);
        model.addAttribute("thuocTinh",sanPhamChiTietService.getListThuocTinhs(sanPham));
        return "User/product-detail";
    }
    @PostMapping("detail/{id}")
    public String detailBySizeAndColor(@PathVariable long id, Model model,@ModelAttribute FilterSizeAndColor filterSizeAndColor) {
        SanPham sanPham = sanPhamService.findById(id).get();
        String spCart = "";
        model.addAttribute("sanPham",sanPham);
        model.addAttribute("spCart",spCart);
        model.addAttribute("spct",sanPhamChiTietService.getBySizeAndColor( sanPham,  filterSizeAndColor.getIdMauSac(), filterSizeAndColor.getIdKichCo()));
        FilterSizeAndColor filterSizeAndColor1 = new FilterSizeAndColor();
        model.addAttribute("thuocTinh",sanPhamChiTietService.getListThuocTinhs(sanPham));
        model.addAttribute("filterSizeAndColor",filterSizeAndColor1);
        return "User/product-detail";
    }
    @PostMapping("/login")
    public String login(Model model, @RequestParam String email, @RequestParam String password, HttpServletRequest request) {
        KhachHang khachHang = khachHangService.login(email, password);
        if (khachHang != null) {
            HttpSession session =  request.getSession();
            session.setAttribute("khachHang",khachHang);
            model.addAttribute("sanPham",sanPhamService.getSanPhamHome());
            return "redirect:home";
        }
        model.addAttribute("message", "Đăng nhập thất bại! Vui lòng thử lại.");
        model.addAttribute("email", email);
        return "Auth/login";
    }
    @GetMapping("/login")
    public String login(Model model) {
        TaoKhachHangRequest taoKhachHangRequest = new TaoKhachHangRequest();
        model.addAttribute("taoKhachHang",taoKhachHangRequest);
        return "Auth/login";
    }
    @PostMapping("/register")
    public String register(Model model, @ModelAttribute TaoKhachHangRequest taoKhachHangRequest) {
        System.out.println(taoKhachHangRequest);
        boolean kh = khachHangService.register(taoKhachHangRequest);
        return "redirect:/user/login";
    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        System.out.println("user logout");
        return "redirect:login";
    }
    @GetMapping("checkout")
    public String checkout(Model model,@RequestParam String spct1,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        System.out.println(spct1);
        CheckoutRequest checkoutRequest = new CheckoutRequest();
        if(khachHang != null) {
            model.addAttribute("khachHang", khachHang);
            model.addAttribute("diaChi",diaChiRepository.findDiaChisByKhachHang(khachHang));
        }
        model.addAttribute("spCart",cartService.getListSanPhamCart(spct1));
        model.addAttribute("checkoutRequest",checkoutRequest);
        return "User/checkout";
    }
    @PostMapping("checkout")
    public String chechoutPost(Model model,@ModelAttribute("checkoutRequest") CheckoutRequest checkoutRequest,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        System.out.println(checkoutRequest);
        hoaDonService.checkout(khachHang,checkoutRequest);
        System.out.println(checkoutRequest);
        return "User/checkout";
    }
    @GetMapping("cart")
    public String cart(Model model,@RequestParam String spCart) {
        System.out.println(spCart);
        model.addAttribute("spCart",cartService.getListSanPhamCart(spCart));
        return "User/cart";
    }
    @GetMapping("list")
    public String list(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        FilterRequest filterRequest = new FilterRequest();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        model.addAttribute("sanPham",sanPhamService.getSanPhamHome());
        List<ChatLieu> chatlieu = sanPhamChiTietService.findChatLieuCreateAt();
        List<CoAo> coao = sanPhamChiTietService.findCoAoCreateAt();
        List<DangAo> dangao = sanPhamChiTietService.findDangAoCreateAt();
        List<HoaTiet> hoatiet = sanPhamChiTietService.findHoaTietCreateAt();
        List<KichCo> kichco = sanPhamChiTietService.findKichCoCreateAt();
        List<MauSac> mausac = sanPhamChiTietService.findMauSacCreateAt();
        List<TayAo> tayao = sanPhamChiTietService.findTayAoCreateAt();
        List<ThuongHieu> thuonghieu = sanPhamChiTietService.findThuongHieuCreateAt();
        model.addAttribute("thuongHieu", thuonghieu);
        model.addAttribute("tayAo", tayao);
        model.addAttribute("mauSac", mausac);
        model.addAttribute("kichCo", kichco);
        model.addAttribute("hoaTiet", hoatiet);
        model.addAttribute("dangAo", dangao);
        model.addAttribute("coAo", coao);
        model.addAttribute("chatLieu", chatlieu);
        model.addAttribute("filterRequest", filterRequest);
        return "User/products";
    }
    @GetMapping("filter")
    public String filter(Model model,
                         HttpServletRequest request,
                         @ModelAttribute FilterRequest filterRequest
    ) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        List<ChatLieu> chatlieu = sanPhamChiTietService.findChatLieuCreateAt();
        List<CoAo> coao = sanPhamChiTietService.findCoAoCreateAt();
        List<DangAo> dangao = sanPhamChiTietService.findDangAoCreateAt();
        List<HoaTiet> hoatiet = sanPhamChiTietService.findHoaTietCreateAt();
        List<KichCo> kichco = sanPhamChiTietService.findKichCoCreateAt();
        List<MauSac> mausac = sanPhamChiTietService.findMauSacCreateAt();
        List<TayAo> tayao = sanPhamChiTietService.findTayAoCreateAt();
        List<ThuongHieu> thuonghieu = sanPhamChiTietService.findThuongHieuCreateAt();
        model.addAttribute("thuongHieu", thuonghieu);
        model.addAttribute("tayAo", tayao);
        model.addAttribute("mauSac", mausac);
        model.addAttribute("kichCo", kichco);
        model.addAttribute("hoaTiet", hoatiet);
        model.addAttribute("dangAo", dangao);
        model.addAttribute("coAo", coao);
        model.addAttribute("chatLieu", chatlieu);
        List<SanPhamHomeDto> sanPhamHomeDtos = sanPhamService.filter(filterRequest);
        model.addAttribute("sanPham", sanPhamHomeDtos);
        return "User/products";
    }
    @GetMapping("order-history")
    public String orderHistory(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        model.addAttribute("hoaDon",hoaDonService.orderHistory(khachHang));
        return "User/order-history";
    }
    @GetMapping("order-detail/{id}")
    public String orderDetal(Model model,@PathVariable int id,HttpServletRequest request){
        UpdateInfoKH updateInfoKH = new UpdateInfoKH();
        model.addAttribute("detail",hoaDonService.getHoaDonDetail(id));
        model.addAttribute("sanPhams",sanPhamChiTietService.getSanPhamChiTiet());
        model.addAttribute("updateInfoKH",updateInfoKH);
        return "User/ChiTiet";
    }
    @GetMapping("info")
    public String info(Model model,HttpServletRequest request) {
        DiaChiRequest diaChiRequest = new DiaChiRequest();
        KhachHangDto khachHangDto = new KhachHangDto();
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        model.addAttribute("diaChiRequest", diaChiRequest);
        model.addAttribute("khachHangDto", khachHangDto);
        model.addAttribute("khachHang",khachHangService.getKhachHangById(khachHang.getID()));
        return "User/information";
    }
    @PostMapping("/{id}")
    public String createDiaChi(@PathVariable long id,@ModelAttribute DiaChiRequest diaChiRequest, Model model) {
        model.addAttribute("diaChiRequest", diaChiRequest);
        model.addAttribute("khachHang", khachHangService.getKhachHangById(id));
        System.out.println(diaChiRequest);
        khachHangService.addDiaChi(id,diaChiRequest);
        return "redirect:/user/info";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id, Model model) {
        DiaChi diaChi = diaChiRepository.findById(id).orElse(null);
        long khachHangId = diaChi.getKhachHang().getID();
        khachHangService.deleteDiaChi(id);
        model.addAttribute("khachHangId", khachHangId);
        return "redirect:/user/info";
    }
    @PostMapping("/edit/{id}")
    public String edit(@PathVariable long id,@ModelAttribute KhachHangDto khachHangDto ,Model model) {
        System.out.println(khachHangDto);
        khachHangService.editKhachHang(khachHangDto,id);
//        return "redirect:/khach-hang/"+id;
        return "redirect:/user/info";
    }
}
