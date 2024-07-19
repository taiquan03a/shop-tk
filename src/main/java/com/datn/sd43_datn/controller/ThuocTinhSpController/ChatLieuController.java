package com.datn.sd43_datn.controller.ThuocTinhSpController;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.ChatLieu;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.service.ThuocTinhSpService.ChatLieuService;
import com.datn.sd43_datn.service.ThuocTinhSpService.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/ChatLieu")
public class ChatLieuController {
    @Autowired
    ChatLieuService ChatLieuServiceIpm;

    @GetMapping("/list")
    public String getAllSanPham(Model model) {
        model.addAttribute("ChatLieus", ChatLieuServiceIpm.findAll());
        return "SanPhamChiTiet/ThuocTinhSp/ChatLieu/list";
    }
    @GetMapping("getId")
    public String getId(Model model, @RequestParam Long id) {
        ChatLieu chatLieu = ChatLieuServiceIpm.findById(id).get();
        if (chatLieu != null) {
            model.addAttribute("chatLieu", chatLieu);
        } else {
            model.addAttribute("chatLieu", new SanPhamChiTiet());
        }
        return "SanPhamChiTiet/ThuocTinhSp/ChatLieu/update";
    }
    @GetMapping("/create")
    public String create(Model model) {
        ChatLieu chatLieu = new ChatLieu();
        model.addAttribute("chatLieu", chatLieu);
        return "SanPhamChiTiet/ThuocTinhSp/ChatLieu/add";
    }
    @PostMapping("/create")
    public String Add(@ModelAttribute("chatLieu") ChatLieu chatLieu){
        ChatLieuServiceIpm.save(chatLieu);
        return "redirect:/ChatLieu/list";
    }

    @PostMapping("/update/{id}")
    public String update(RedirectAttributes redirectAttributes, @PathVariable long id, @ModelAttribute("chatLieu") ChatLieu chatLieu) {
        try {
            ChatLieu chatLieuCurrent = ChatLieuServiceIpm.findById(id).get();
            chatLieuCurrent.setTenChatLieu(chatLieu.getTenChatLieu());
            chatLieuCurrent.setMoTa(chatLieu.getMoTa());
            ChatLieuServiceIpm.save(chatLieuCurrent);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");
        }
        return "redirect:/ChatLieu/list";
    }
    @GetMapping("/trangThai")
    public String getTrangThai1( @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {

        try {
            ChatLieuServiceIpm.findTrangThai1(id);
            redirectAttributes.addFlashAttribute("successMessage", "Đổi trạng thái thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi ");

        }
        return "redirect:/ChatLieu/list";
    }
    @GetMapping("filter")
    public String filter(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("ChatLieus", ChatLieuServiceIpm.findByChatLieuKeyWord(keyword));
        return "SanPhamChiTiet/ThuocTinhSp/ChatLieu/list";
    }
}
