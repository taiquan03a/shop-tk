package com.datn.sd43_datn.request;

import com.datn.sd43_datn.entity.NVien.ChucVu;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@Builder
@ToString
public class NhanVienRequest {
    private Long ID;
    private String maNhanVien;
    private String tenNhanVien;
    private String email;
    private String sdt;
    private String gioiTinh;
    private String ngayTao;
    private boolean trangThai;
    private ChucVu chucVu;
}
