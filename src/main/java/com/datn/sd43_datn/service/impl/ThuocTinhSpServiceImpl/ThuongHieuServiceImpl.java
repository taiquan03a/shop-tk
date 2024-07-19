package com.datn.sd43_datn.service.impl.ThuocTinhSpServiceImpl;

import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.entity.ThuocTinhSp.ThuongHieu;
import com.datn.sd43_datn.repository.ThuocTinhSpRepository.ThuongHieuRepository;
import com.datn.sd43_datn.service.ThuocTinhSpService.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@Service
public class ThuongHieuServiceImpl implements ThuongHieuService {
    @Autowired
    ThuongHieuRepository ThuonghieuEntityRepository;

    @Override
    public List<ThuongHieu> findAll() {
        return ThuonghieuEntityRepository.findAll();
    }

    @Override
    public List<ThuongHieu> findAllById(Iterable<Long> integers) {
        return ThuonghieuEntityRepository.findAllById(integers);
    }

    @Override
    public <S extends ThuongHieu> S save(S entity) {
        return ThuonghieuEntityRepository.save(entity);
    }

    @Override
    public Optional<ThuongHieu> findById(Long integer) {
        return ThuonghieuEntityRepository.findById(integer);
    }

    @Override
    public void deleteById(Long integer) {
        ThuonghieuEntityRepository.deleteById(integer);
    }
    @Override
    public Page<ThuongHieu> page(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return ThuonghieuEntityRepository.findByKeyWord(pageable, keyword);
        }
        return ThuonghieuEntityRepository.findAll(pageable);
    }
    @Override
    public void findTrangThai1(Long id){
        ThuonghieuEntityRepository.updateTrangThai1(id);
    }
    @Override
    public void findTrangThai0(Long id){
        ThuonghieuEntityRepository.updateTrangThai0(id);
    }

    @Override
    public List<ThuongHieu> findByThuongHieuKeyWord(String keyword) {
        String key = keyword.toLowerCase();
        List<ThuongHieu> thuongHieuList = ThuonghieuEntityRepository.findAll();
        List<ThuongHieu> thuongHieuDto = new ArrayList<ThuongHieu>();
        for (ThuongHieu thuongHieu : thuongHieuList) {
            if(thuongHieu.getTenThuongHieu().toLowerCase().contains(key) ||
                    thuongHieu.getMoTa().toLowerCase().contains(key)
            ){
                thuongHieuDto.add(thuongHieu);
            }

        }
        return thuongHieuDto;
    }
}
