package com.datn.sd43_datn.service;

import com.datn.sd43_datn.dto.NhanVienDto;
import com.datn.sd43_datn.request.*;

import java.util.List;

public interface NhanVienService {
    List<NhanVienRequest> getNhanVien();
    NhanVienDto getNhanVienById(long id);
    boolean editNhanVien(NhanVienDto nhanVienDto, long id);
    boolean addNhanVien(TaoNhanVienRequest createNhanVien);
    boolean status(long nhanVienId);
    List<NhanVienRequest> filter(String search);
}
