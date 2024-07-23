package com.datn.sd43_datn.dto;

import com.datn.sd43_datn.entity.HoaDonChiTiet;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SanPhamGioHang {
   private List<HoaDonChiTiet> hoaDonChiTietList;
   private long tongTien;
   private long tienShip;
   private long thanhTien;
   private String spct;
}
