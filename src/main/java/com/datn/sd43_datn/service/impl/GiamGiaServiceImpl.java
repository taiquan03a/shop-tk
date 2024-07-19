package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.entity.GiamGia;
import com.datn.sd43_datn.repository.GiamGiaRepository;
import com.datn.sd43_datn.service.GiamGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GiamGiaServiceImpl implements GiamGiaService {
    @Autowired
    private GiamGiaRepository giamGiaRepository;

    @Override
    public List<GiamGia> getGiamGia() {
        return giamGiaRepository.findAll();
    }
}
