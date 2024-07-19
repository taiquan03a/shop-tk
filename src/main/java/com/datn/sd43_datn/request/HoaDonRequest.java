package com.datn.sd43_datn.request;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@Builder
@ToString
public class HoaDonRequest {
    private Long ID;
    private String maHoaDon;
    private Long tongSp;
    private Long tongTien;
    private String tenKH;
    private String ngayTao;
    private Boolean loaiHoaDon;
    private String trangThaiDon;
}
