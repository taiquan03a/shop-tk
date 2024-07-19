package com.datn.sd43_datn.service;

import com.datn.sd43_datn.entity.GiamGia;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface GiamGiaService {
    List<GiamGia> getGiamGia();
}
