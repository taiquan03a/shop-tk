package com.datn.sd43_datn.service;

import com.datn.sd43_datn.dto.SanPhamGioHang;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import java.util.List;

public interface CartService {
    SanPhamGioHang getListSanPhamCart(String spct);
}
