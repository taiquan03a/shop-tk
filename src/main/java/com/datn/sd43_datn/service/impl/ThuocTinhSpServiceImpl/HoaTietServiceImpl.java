package com.datn.sd43_datn.service.impl.ThuocTinhSpServiceImpl;

import com.datn.sd43_datn.entity.ThuocTinhSp.HoaTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.repository.ThuocTinhSpRepository.HoaTietRepository;
import com.datn.sd43_datn.service.ThuocTinhSpService.HoaTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@Service
public class HoaTietServiceImpl implements HoaTietService {
    @Autowired
    HoaTietRepository HoatietEntityRepository;

    @Override
    public List<HoaTiet> findAll() {
        return HoatietEntityRepository.findAll();
    }

    @Override
    public List<HoaTiet> findAllById(Iterable<Long> integers) {
        return HoatietEntityRepository.findAllById(integers);
    }

    @Override
    public <S extends HoaTiet> S save(S entity) {
        return HoatietEntityRepository.save(entity);
    }

    @Override
    public Optional<HoaTiet> findById(Long integer) {
        return HoatietEntityRepository.findById(integer);
    }

    @Override
    public void deleteById(Long integer) {
        HoatietEntityRepository.deleteById(integer);
    }
    @Override
    public Page<HoaTiet> Page(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return HoatietEntityRepository.findByKeyWord(pageable, keyword);
        }
        return HoatietEntityRepository.findAll(pageable);
    }
    @Override
    public void findTrangThai1(Long id){
        HoatietEntityRepository.updateTrangThai1(id);
    }
    @Override
    public void findTrangThai0(Long id){
        HoatietEntityRepository.updateTrangThai0(id);
    }

    @Override
    public List<HoaTiet> findByHoaTietKeyWord(String keyword) {
        String key = keyword.toLowerCase();
        List<HoaTiet> hoaTietList = HoatietEntityRepository.findAll();
        List<HoaTiet> hoaTietDto = new ArrayList<HoaTiet>();
        for (HoaTiet hoaTiet : hoaTietList) {
            if(hoaTiet.getTenHoaTiet().toLowerCase().contains(key) ||
                    hoaTiet.getMoTa().toLowerCase().contains(key)
            ){
                hoaTietDto.add(hoaTiet);
            }

        }
        return hoaTietDto;
    }
}
