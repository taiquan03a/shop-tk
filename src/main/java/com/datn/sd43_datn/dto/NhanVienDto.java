package com.datn.sd43_datn.dto;

import com.datn.sd43_datn.entity.NVien.ChucVu;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NhanVienDto {
    private Long ID;
    private String tenNhanVien;
    private String email;
    private String matKhau;
    private String sdt;
    private Date ngayTao;
    private boolean gioiTinh;
    private boolean trangThai;
    private ChucVu chucVu;
}
