package com.datn.sd43_datn.service;

import com.datn.sd43_datn.dto.HoaDonChiTietDto;
import com.datn.sd43_datn.entity.HoaDon;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.entity.KhachHang;
import com.datn.sd43_datn.request.*;

import java.text.ParseException;
import java.util.List;

public interface HoaDonService {
    List<HoaDonRequest> getHoaDonRequests();
    HoaDonChiTietDto getHoaDonDetail(long hoaDonId);
    HoaDonChiTietDto updateTrangThai(long hoaDonId);
    HoaDonChiTietDto huyTrangThai(long hoaDonId);
    List<HoaDonRequest> filterHoaDonRequest(String search,String status,String batDau,String ketThuc) throws ParseException;
    boolean addHoaDon(TaoDonHangRequest createDonHangRequest);
    boolean updateKH(long hoaDonID, UpdateInfoKH updateInfoKH);
//    boolean updateHoaDon(UpdateDonHangRequest updateDonHangRequest, long hoaDonId);
    boolean checkout(KhachHang khachHang, CheckoutRequest checkoutRequest);
    List<HoaDonRequest> orderHistory (KhachHang khachHang);
}
