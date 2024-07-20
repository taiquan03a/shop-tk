package com.datn.sd43_datn.service;

import com.datn.sd43_datn.dto.DoanhThuDto;

import java.text.ParseException;
import java.util.List;
public interface ThongKeService{
    long tongSanPham();
    long tongKhachHang();
    long tongDonHang();
    long tongNhanVien();
    DoanhThuDto doanhThu(String type) throws ParseException;
}
