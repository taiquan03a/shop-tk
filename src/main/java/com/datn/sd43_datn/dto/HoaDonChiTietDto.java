package com.datn.sd43_datn.dto;

import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.entity.LichSuThanhToan;
import com.datn.sd43_datn.entity.TrangThaiHoaDon;
import lombok.Builder;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
@Builder
public class HoaDonChiTietDto {
    private Long id;
    private String maHoaDon;
    private String tenKH;
    private String sdt;
    private String trangThai;
    private String tenNguoiNhan;
    private List<TrangThaiHoaDon> trangThaiDonList;
    private TrangThaiHoaDon trangThaiDon;
    private List<LichSuThanhToan> lichSuThanhToanList;
    private List<HoaDonChiTiet> hoaDonChiTietList;
    private String ngayTao;
    private String nhanVien;
    private String hinhThucThanhToan;
    private Boolean loaiHoaDon;
    private String tenGiamGia;
    private Float giaTriGiamGia;
    private String tongTienHang;
    private String giamGia;
    private String phiVanChuyen;
    private String tongTien;
    private List<TimeLineDto> timeLineDTOList;
    private String soNha;
    private String idPhuong;
}
