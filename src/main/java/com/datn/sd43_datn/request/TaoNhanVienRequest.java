package com.datn.sd43_datn.request;

import com.datn.sd43_datn.entity.NVien.ChucVu;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class TaoNhanVienRequest {
    private String tenNhanVien;
    private String email;
    private String matKhau;
    private String ngayTao;
    private String sdt;
    private boolean gioiTinh;
    private ChucVu chucVu;
}
