package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.repository.HoaDonChiTietRepository;
import com.datn.sd43_datn.service.HoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonChiTietServiceImpl implements HoaDonChiTietService {
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRePository;
    @Override
    public List<HoaDonChiTiet> getHoaDonChiTiets() {
        return hoaDonChiTietRePository.findAll();
    }
}