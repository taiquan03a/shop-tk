package com.datn.sd43_datn.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamChiTietRequest {
    private long idSanPham;
    private long idAnh;
    private long idMauSac;
    private long idChatLieu;
    private long idKichCo;
    private long idDangAo;
    private long idCoAo;
    private long idTayAo;
    private long idHoaTiet;
    private long giaNhap;
    private long giaBan;
    private String moTa;
    private long soLuong;
}