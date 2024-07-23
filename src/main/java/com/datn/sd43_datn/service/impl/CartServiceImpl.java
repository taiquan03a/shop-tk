package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.SanPhamGioHang;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.repository.SanPhamChiTietRepository;
import com.datn.sd43_datn.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;

    @Override
    public SanPhamGioHang getListSanPhamCart(String spct) {
        List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
        String spctDto = "";
        String strippedInput = spct.substring
                (1, spct.length() - 1);
        String[] pairs = strippedInput.split(",");
        long thanhTien = 0,tongTien = 0,tienShip = 0;
        for (String pair : pairs) {
            pair = pair.replace("\"", "");
            String[] numbers = pair.split(":");
            String id = numbers[0];
            String sl = numbers[1];
            spctDto = spctDto + id + ":" + sl + ",";

            SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(Long.valueOf(id)).get();
            HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                    .sanPhamChiTiet(sanPhamChiTiet)
                    .soLuong(Long.valueOf(sl))
                    .donGia(Long.valueOf(sanPhamChiTiet.getGiaBan()))
                    .thanhTien(Long.valueOf(sl) * Long.valueOf(sanPhamChiTiet.getGiaBan()))
                    .trangThai(true)
                    .build();
            thanhTien += hoaDonChiTiet.getThanhTien();
            hoaDonChiTietList.add(hoaDonChiTiet);
        }
        tongTien = thanhTien - tienShip;
        return SanPhamGioHang.builder()
                .hoaDonChiTietList(hoaDonChiTietList)
                .tienShip(15000)
                .thanhTien(thanhTien)
                .tongTien(tongTien)
                .spct(spctDto)
                .build();
    }
}
