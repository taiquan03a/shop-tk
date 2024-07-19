package com.datn.sd43_datn.service;

import com.datn.sd43_datn.dto.KhachHangDto;
import com.datn.sd43_datn.request.DiaChiRequest;
import com.datn.sd43_datn.request.KhachHangRequest;
import com.datn.sd43_datn.request.TaoKhachHangRequest;

import java.util.List;

public interface KhachHangService {
    List<KhachHangRequest> getKhachHang();
    KhachHangDto getKhachHangById(long id);
    boolean editKhachHang(KhachHangDto khachHangDto, long id);
    boolean addKhachHang(TaoKhachHangRequest createKhachHang);
    boolean deleteDiaChi(long diaChiId);
    boolean addDiaChi(long khachHangId, DiaChiRequest diaChiRequest);
    boolean status(long khachHangId);
    List<KhachHangRequest> filter(String search);
}
