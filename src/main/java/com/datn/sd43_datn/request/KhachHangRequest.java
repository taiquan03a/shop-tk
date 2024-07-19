package com.datn.sd43_datn.request;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@Builder
@ToString
public class KhachHangRequest {
    private Long ID;
    private String maKhachHang;
    private String email;
    private String tenKhachHang;
    private String ngayTao;
    private String sdt;
    private String gioiTinh;
    private boolean trangThai;
}
