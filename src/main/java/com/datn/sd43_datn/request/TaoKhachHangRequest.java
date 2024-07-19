package com.datn.sd43_datn.request;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class TaoKhachHangRequest {
    private String tenKhachHang;
    private String sdt;
    private boolean gioiTinh;
    private String email;
    private String anh;
    private String matKhau;
    private String idPhuong;
    private String soNha;
}
