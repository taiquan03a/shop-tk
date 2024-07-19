package com.datn.sd43_datn.controller;

import com.datn.sd43_datn.dto.DoanhThuDto;
import com.datn.sd43_datn.service.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("thong-ke")
public class ThongKeController {
    @Autowired
    private ThongKeService thongKeService;

    @GetMapping("index")
    public String index(@RequestParam(required = false) String type, Model model) throws ParseException {
        model.addAttribute("thongKe", thongKeService.doanhThu(type));
        return "thong-ke/index";
    }
}
