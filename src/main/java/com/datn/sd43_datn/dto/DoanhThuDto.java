package com.datn.sd43_datn.dto;
import lombok.*;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class DoanhThuDto {
    private List<String> thoiGian;
    private List<String> doanhThu;
    private long tongSanPham;
    private long tongKhachHang;
    private long tongDonHang;
    private long tongNhanVien;
}
