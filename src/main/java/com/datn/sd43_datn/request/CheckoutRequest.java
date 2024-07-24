package com.datn.sd43_datn.request;

import com.datn.sd43_datn.dto.SanPhamGioHang;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CheckoutRequest {
    private SanPhamGioHang spCart;
    private String tenKhachHang;
    private String sdt;
    private String email;
    private String idPhuong;
    private String soNha;
    private String spct;
    private long idDiaChi;
}
