package com.datn.sd43_datn.controller;


import com.datn.sd43_datn.config.FileUploadUtil;
import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import com.datn.sd43_datn.service.SanPhamChiTietService;
import com.datn.sd43_datn.service.SanPhamService;
import com.datn.sd43_datn.service.ThuocTinhSpService.*;
import com.datn.sd43_datn.service.impl.SanPhamChiTietServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.swing.*;
import java.util.*;

@Controller
@RequestMapping("/SanPhamChiTiet")
public class SanPhamChiTietController {

    @Autowired
    SanPhamChiTietService SanPhamChiTietServiceIpm;
    @Autowired
    AnhService anhServiceIpm;
    @Autowired
    ChatLieuService chatLieuServiceIpm;
    @Autowired
    CoAoService CoAoServiceIpm;
    @Autowired
    DangAoService DangAoServiceIpm;
    @Autowired
    HoaTietService HoaTietServiceIpm;
    @Autowired
    MauSacService MauSacServiceIpm;
    @Autowired
    SanPhamService SanPhamServiceIpm;
    @Autowired
    TayAoService TayAoServiceIpm;
    @Autowired
    ThuongHieuService ThuongHieuServiceIpm;
    @Autowired
    KichCoService KichCoServiceIpm;
    @Autowired
    private SanPhamChiTietServiceImpl sanPhamChiTietServiceImpl;

    @GetMapping("/list")


    public String list(Model model) {

        String keyword = null;

        return pageKeyword(model, keyword, 1);

    }

    @RequestMapping("/list")
    public String pageKeyword(Model model, @Param("keyword") String keyword,
                              @PathVariable("pageNumber") int pageNumber) {
        Page<SanPhamChiTiet> page = SanPhamChiTietServiceIpm.sanphamchitietEntityPage(keyword, pageNumber);
        List<SanPhamChiTiet> spct = page.getContent();
        List<ChatLieu> chatlieu = chatLieuServiceIpm.findAll();
        List<Anh> anh = anhServiceIpm.findAll();
        List<CoAo> coao = CoAoServiceIpm.findAll();
        List<DangAo> dangao = DangAoServiceIpm.findAll();
        List<HoaTiet> hoatiet = HoaTietServiceIpm.findAll();
        List<KichCo> kichco = KichCoServiceIpm.findAll();
        List<MauSac> mausac = MauSacServiceIpm.findAll();
        List<SanPham> sanpham = SanPhamServiceIpm.findAll();
        List<TayAo> tayao = TayAoServiceIpm.findAll();
        List<ThuongHieu> thuonghieu = ThuongHieuServiceIpm.findAll();
        model.addAttribute("spct", spct);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("keyword", keyword);
        model.addAttribute("anh", anh);
        model.addAttribute("thuonghieu", thuonghieu);
        model.addAttribute("tayao", tayao);
        model.addAttribute("mausac", mausac);
        model.addAttribute("kichco", kichco);
        model.addAttribute("hoatiet", hoatiet);
        model.addAttribute("dangao", dangao);
        model.addAttribute("coao", coao);
        model.addAttribute("chatlieu", chatlieu);
        model.addAttribute("sanpham", sanpham);
        return "SanPhamChiTiet/list";

    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("spct", sanPhamChiTietServiceImpl.findBySanPhamKeyWord(keyword));
        return "SanPhamChiTiet/list";
    }
    @GetMapping("/create")
    public String create(Model model) {
        SanPhamChiTiet spct = new SanPhamChiTiet();
        List<Anh> anh = SanPhamChiTietServiceIpm.findAnhCreateAt();
        List<ChatLieu> chatlieu = SanPhamChiTietServiceIpm.findChatLieuCreateAt();
        List<CoAo> coao = SanPhamChiTietServiceIpm.findCoAoCreateAt();
        List<DangAo> dangao = SanPhamChiTietServiceIpm.findDangAoCreateAt();
        List<HoaTiet> hoatiet = SanPhamChiTietServiceIpm.findHoaTietCreateAt();
        List<KichCo> kichco = SanPhamChiTietServiceIpm.findKichCoCreateAt();
        List<MauSac> mausac = SanPhamChiTietServiceIpm.findMauSacCreateAt();
        List<SanPham> sanpham = SanPhamChiTietServiceIpm.findSanPhamCreateAt();
        List<TayAo> tayao = SanPhamChiTietServiceIpm.findTayAoCreateAt();
        List<ThuongHieu> thuonghieu = SanPhamChiTietServiceIpm.findThuongHieuCreateAt();
        System.out.println(sanpham.size());
        model.addAttribute("anh", anh);
        model.addAttribute("thuonghieu", thuonghieu);
        model.addAttribute("tayao", tayao);
        model.addAttribute("mausac", mausac);
        model.addAttribute("kichco", kichco);
        model.addAttribute("hoatiet", hoatiet);
        model.addAttribute("dangao", dangao);
        model.addAttribute("coao", coao);
        model.addAttribute("chatlieu", chatlieu);
        model.addAttribute("sanpham", sanpham);
        model.addAttribute("spct", spct);
        return "SanPhamChiTiet/add";
    }

    @PostMapping("/add")
    public String Add(RedirectAttributes redirectAttributes, @ModelAttribute("spct") SanPhamChiTiet spct) {

        try {
            SanPhamChiTietServiceIpm.save(spct);

            redirectAttributes.addFlashAttribute("successMessage", "Thêm thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }


        return "redirect:/SanPhamChiTiet/list";
    }

    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        SanPhamChiTiet spct = SanPhamChiTietServiceIpm.findById(id);
        List<Anh> anh = SanPhamChiTietServiceIpm.findAnhCreateAt();
        List<ChatLieu> chatlieu = SanPhamChiTietServiceIpm.findChatLieuCreateAt();
        List<CoAo> coao = SanPhamChiTietServiceIpm.findCoAoCreateAt();
        List<DangAo> dangao = SanPhamChiTietServiceIpm.findDangAoCreateAt();
        List<HoaTiet> hoatiet = SanPhamChiTietServiceIpm.findHoaTietCreateAt();
        List<KichCo> kichco = SanPhamChiTietServiceIpm.findKichCoCreateAt();
        List<MauSac> mausac = SanPhamChiTietServiceIpm.findMauSacCreateAt();
        List<SanPham> sanpham = SanPhamChiTietServiceIpm.findSanPhamCreateAt();
        List<TayAo> tayao = SanPhamChiTietServiceIpm.findTayAoCreateAt();
        List<ThuongHieu> thuonghieu = SanPhamChiTietServiceIpm.findThuongHieuCreateAt();

        model.addAttribute("anh", anh);
        model.addAttribute("thuonghieu", thuonghieu);
        model.addAttribute("tayao", tayao);
        model.addAttribute("mausac", mausac);
        model.addAttribute("kichco", kichco);
        model.addAttribute("hoatiet", hoatiet);
        model.addAttribute("dangao", dangao);
        model.addAttribute("coao", coao);
        model.addAttribute("chatlieu", chatlieu);
        model.addAttribute("sanpham", sanpham);
        if (spct != null) {
            model.addAttribute("spct", spct);
        } else {
            model.addAttribute("spct", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/update";
    }


    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes,@PathVariable long id, @ModelAttribute("spct") SanPhamChiTiet spct) {
        try {
            SanPhamChiTiet sanPhamChiTiet = SanPhamChiTietServiceIpm.findById(id);
            sanPhamChiTiet.setAnh(spct.getAnh());
            sanPhamChiTiet.setSanPham(spct.getSanPham());
            sanPhamChiTiet.setHoaTiet(spct.getHoaTiet());
            sanPhamChiTiet.setCoAo(spct.getCoAo());
            sanPhamChiTiet.setSoLuong(spct.getSoLuong());
            sanPhamChiTiet.setDangAo(spct.getDangAo());
            sanPhamChiTiet.setChatLieu(spct.getChatLieu());
            sanPhamChiTiet.setGiaBan(spct.getGiaBan());
            sanPhamChiTiet.setKichCo(spct.getKichCo());
            sanPhamChiTiet.setMauSac(spct.getMauSac());
            sanPhamChiTiet.setGiaNhap(spct.getGiaNhap());
            sanPhamChiTiet.setTayAo(spct.getTayAo());
            sanPhamChiTiet.setThuongHieu(spct.getThuongHieu());
            SanPhamChiTietServiceIpm.save(sanPhamChiTiet);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/SanPhamChiTiet/list";
    }

    @GetMapping("/delete")
    public String deleteId(RedirectAttributes redirectAttributes, @RequestParam("id") Long id) {
        try {
            SanPhamChiTietServiceIpm.deleteById(id);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }


        return "redirect:/SanPhamChiTiet/list";
    }

    @GetMapping("/trangThai0")
    public String getTrangThai0( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            SanPhamChiTietServiceIpm.findTrangThai0(id);
            System.out.println("hihi");
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
        return "redirect:/SanPhamChiTiet/list";
    }
    @GetMapping("/trangThai1")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            SanPhamChiTietServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
        return "redirect:/SanPhamChiTiet/list";
    }


    //add chi tiet update
/////////////////////////////////////////////

    @GetMapping("/addAnh/{id}")
    public String addAnhup(@PathVariable long id, Model model){
        Anh anh =new Anh();
        model.addAttribute("anh",anh);
        return "SanPhamChiTiet/AddSpct/addAnh";
    }

    @PostMapping("/addAnhup/{id}")
    public String Addup(@ModelAttribute("anh") Anh anh,@PathVariable long id, @RequestParam("photo")MultipartFile multipartFile) throws Exception{
        String fileName= StringUtils.cleanPath(multipartFile.getOriginalFilename());
        anh.setAnh(fileName);
        System.out.println(fileName);
        anhServiceIpm.save(anh);
        String upload="src/main/webapp/img";
        FileUploadUtil.saveFile(upload,fileName,multipartFile);
        anhServiceIpm.save(anh);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addChatLieu/{id}")
    public String addChatLieuUP(@PathVariable long id,Model model){
        ChatLieu chatlieu =new ChatLieu();
        model.addAttribute("chatlieu",chatlieu);
        return "SanPhamChiTiet/AddSpct/addChatLieu";
    }

    @PostMapping("/addChatLieu/{id}")
    public String AddUp(@ModelAttribute("chatlieu") ChatLieu chatlieu,@PathVariable long id){
        chatLieuServiceIpm.save(chatlieu);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addCoAo/{id}")
    public String addCoAoUp(@PathVariable long id,Model model){
        CoAo coao =new CoAo();
        model.addAttribute("coao",coao);
        return "SanPhamChiTiet/AddSpct/addCoAo";
    }

    @PostMapping("/addCoAo/{id}")
    public String Add(@ModelAttribute("coao") CoAo coao,@PathVariable long id){
        CoAoServiceIpm.save(coao);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addDangAo/{id}")
    public String addDangAoUp(@PathVariable long id,Model model){
        DangAo dangao =new DangAo();
        model.addAttribute("dangao",dangao);
        return "SanPhamChiTiet/AddSpct/addDangAo";
    }

    @PostMapping("/addDangAo/{id}")
    public String Add(@ModelAttribute("dangao") DangAo dangao,@PathVariable long id){
        DangAoServiceIpm.save(dangao);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addHoaTiet/{id}")
    public String addHoaTietUp(@PathVariable long id,Model model){
        HoaTiet hoatiet =new HoaTiet();
        model.addAttribute("hoatiet",hoatiet);
        return "SanPhamChiTiet/AddSpct/addHoaTiet";
    }

    @PostMapping("/addHoaTiet/{id}")
    public String Add(@ModelAttribute("hoatiet") HoaTiet hoatiet,@PathVariable long id){
        HoaTietServiceIpm.save(hoatiet);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addKichCo/{id}")
    public String addkichCoUp(@PathVariable long id,Model model){
        KichCo kichco =new KichCo();
        model.addAttribute("kichco",kichco);
        return "SanPhamChiTiet/AddSpct/addKichCo";
    }

    @PostMapping("/addKichCo/{id}")
    public String Add(@ModelAttribute("kichco") KichCo kichco, @PathVariable long id){
        KichCoServiceIpm.save(kichco);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addMauSac/{id}")
    public String addMauSacUp(@PathVariable long id,Model model){
        MauSac mausac =new MauSac();
        model.addAttribute("mausac",mausac);
        return "SanPhamChiTiet/AddSpct/addMauSac";
    }

    @PostMapping("/addMauSac/{id}")
    public String Add(@ModelAttribute("mausac") MauSac mausac,@PathVariable long id){
        MauSacServiceIpm.save(mausac);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }

    @GetMapping("/addSanPham/{id}")
    public String addSanPhamUp(@PathVariable long id,Model model){
        SanPham sanpham =new SanPham();
        model.addAttribute("sanpham",sanpham);
        return "SanPhamChiTiet/AddSpct/addSp";
    }

    @PostMapping("/addSanPham/{id}")
    public String Add(@ModelAttribute("sanpham") SanPham sanpham,@PathVariable long id){
        sanpham.setNgayTao(new Date(System.currentTimeMillis()));
        sanpham.setNguoiTao("nhân viên");
        sanpham.setTrangThai(0);
        System.out.println(sanpham);
        SanPhamServiceIpm.save(sanpham);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addTayAo/{id}")
    public String addTayAoUp(@PathVariable long id,Model model){
        TayAo tayao =new TayAo();
        model.addAttribute("tayao",tayao);
        return "SanPhamChiTiet/AddSpct/addTayAo";
    }

    @PostMapping("/addTayAo/{id}")
    public String Add(@ModelAttribute("tayao") TayAo tayao,@PathVariable long id){
        TayAoServiceIpm.save(tayao);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }
    @GetMapping("/addThuongHieu/{id}")
    public String addThuongHieuUp(@PathVariable long id,Model model){
        ThuongHieu thuonghieu =new ThuongHieu();
        model.addAttribute("thuonghieu",thuonghieu);
        return "SanPhamChiTiet/AddSpct/addThuongHieu";
    }

    @PostMapping("/addThuongHieu/{id}")
    public String Add(@ModelAttribute("thuonghieu") ThuongHieu thuonghieu,@PathVariable long id){
        ThuongHieuServiceIpm.save(thuonghieu);
        return "redirect:/SanPhamChiTiet/getId?id="+id;
    }

    //add chi tiet
/////////////////////////////////////////////

    @GetMapping("/addAnh")
    public String addAnh(Model model){
        Anh anh =new Anh();
        model.addAttribute("anh",anh);
        return "SanPhamChiTiet/AddSpct/addAnh";
    }

    @PostMapping("/addAnh")
    public String Add(@ModelAttribute("anh") Anh anh, @RequestParam("photo")MultipartFile multipartFile) throws Exception{
        String fileName= StringUtils.cleanPath(multipartFile.getOriginalFilename());
        anh.setAnh(fileName);
        System.out.println(fileName);
        anhServiceIpm.save(anh);
        String upload="src/main/webapp/img";
        FileUploadUtil.saveFile(upload,fileName,multipartFile);
        anhServiceIpm.save(anh);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addChatLieu")
    public String addChatLieu(Model model){
        ChatLieu chatlieu =new ChatLieu();
        model.addAttribute("chatlieu",chatlieu);
        return "SanPhamChiTiet/AddSpct/addChatLieu";
    }

    @PostMapping("/addChatLieu")
    public String Add(@ModelAttribute("chatlieu") ChatLieu chatlieu){
        chatLieuServiceIpm.save(chatlieu);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addCoAo")
    public String addCoAo(Model model){
        CoAo coao =new CoAo();
        model.addAttribute("coao",coao);
        return "SanPhamChiTiet/AddSpct/addCoAo";
    }

    @PostMapping("/addCoAo")
    public String Add(@ModelAttribute("coao") CoAo coao){
        CoAoServiceIpm.save(coao);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addDangAo")
    public String addDangAo(Model model){
        DangAo dangao =new DangAo();
        model.addAttribute("dangao",dangao);
        return "SanPhamChiTiet/AddSpct/addDangAo";
    }

    @PostMapping("/addDangAo")
    public String Add(@ModelAttribute("dangao") DangAo dangao){
        DangAoServiceIpm.save(dangao);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addHoaTiet")
    public String addHoaTiet(Model model){
        HoaTiet hoatiet =new HoaTiet();
        model.addAttribute("hoatiet",hoatiet);
        return "SanPhamChiTiet/AddSpct/addHoaTiet";
    }

    @PostMapping("/addHoaTiet")
    public String Add(@ModelAttribute("hoatiet") HoaTiet hoatiet){
        HoaTietServiceIpm.save(hoatiet);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addKichCo")
    public String addkichCo(Model model){
        KichCo kichco =new KichCo();
        model.addAttribute("kichco",kichco);
        return "SanPhamChiTiet/AddSpct/addKichCo";
    }

    @PostMapping("/addKichCo")
    public String Add(@ModelAttribute("kichco") KichCo kichco){
        KichCoServiceIpm.save(kichco);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addMauSac")
    public String addMauSac(Model model){
        MauSac mausac =new MauSac();
        model.addAttribute("mausac",mausac);
        return "SanPhamChiTiet/AddSpct/addMauSac";
    }

    @PostMapping("/addMauSac")
    public String Add(@ModelAttribute("mausac") MauSac mausac){
        MauSacServiceIpm.save(mausac);
        return "redirect:/SanPhamChiTiet/create";
    }

    @GetMapping("/addSanPham")
    public String addSanPham(Model model){
        SanPham sanpham =new SanPham();
        model.addAttribute("sanpham",sanpham);
        return "SanPhamChiTiet/AddSpct/addSp";
    }

    @PostMapping("/addSanPham")
    public String Add(@ModelAttribute("sanpham") SanPham sanpham){
        sanpham.setNgayTao(new Date(System.currentTimeMillis()));
        sanpham.setNguoiTao("nhân viên");
        sanpham.setTrangThai(0);
        System.out.println(sanpham);
        SanPhamServiceIpm.save(sanpham);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addTayAo")
    public String addTayAo(Model model){
        TayAo tayao =new TayAo();
        model.addAttribute("tayao",tayao);
        return "SanPhamChiTiet/AddSpct/addTayAo";
    }

    @PostMapping("/addTayAo")
    public String Add(@ModelAttribute("tayao") TayAo tayao){
        TayAoServiceIpm.save(tayao);
        return "redirect:/SanPhamChiTiet/create";
    }
    @GetMapping("/addThuongHieu")
    public String addThuongHieu(Model model){
        ThuongHieu thuonghieu =new ThuongHieu();
        model.addAttribute("thuonghieu",thuonghieu);
        return "SanPhamChiTiet/AddSpct/addThuongHieu";
    }

    @PostMapping("/addThuongHieu")
    public String Add(@ModelAttribute("thuonghieu") ThuongHieu thuonghieu){
        ThuongHieuServiceIpm.save(thuonghieu);
        return "redirect:/SanPhamChiTiet/create";
    }
}