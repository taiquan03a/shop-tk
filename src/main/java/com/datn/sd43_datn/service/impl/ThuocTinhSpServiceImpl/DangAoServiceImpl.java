package com.datn.sd43_datn.service.impl.ThuocTinhSpServiceImpl;

import com.datn.sd43_datn.entity.ThuocTinhSp.DangAo;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.repository.ThuocTinhSpRepository.DangAoRepository;
import com.datn.sd43_datn.service.ThuocTinhSpService.DangAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@Service
public class DangAoServiceImpl implements DangAoService {
    @Autowired
    DangAoRepository DangaoEntityRepository;

    @Override
    public List<DangAo> findAll() {
        return DangaoEntityRepository.findAll();
    }

    @Override
    public List<DangAo> findAllById(Iterable<Long> integers) {
        return DangaoEntityRepository.findAllById(integers);
    }

    @Override
    public <S extends DangAo> S save(S entity) {
        return DangaoEntityRepository.save(entity);
    }

    @Override
    public Optional<DangAo> findById(Long integer) {
        return DangaoEntityRepository.findById(integer);
    }

    @Override
    public void deleteById(Long integer) {
        DangaoEntityRepository.deleteById(integer);
    }
    @Override
    public Page<DangAo> Page(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return DangaoEntityRepository.findByKeyWord(pageable, keyword);
        }
        return DangaoEntityRepository.findAll(pageable);
    }
    @Override
    public void findTrangThai1(Long id){
        DangaoEntityRepository.updateTrangThai1(id);
    }
    @Override
    public void findTrangThai0(Long id){
        DangaoEntityRepository.updateTrangThai0(id);
    }

    @Override
    public List<DangAo> findByDangAoKeyWord(String keyword) {
        String key = keyword.toLowerCase();
        List<DangAo> dangAoList = DangaoEntityRepository.findAll();
        List<DangAo> dangAoDto = new ArrayList<DangAo>();
        for (DangAo dangAo : dangAoList) {
            if(dangAo.getTenKieuDangAo().toLowerCase().contains(key) ||
                    dangAo.getMoTa().toLowerCase().contains(key)
            ){
                dangAoDto.add(dangAo);
            }

        }
        return dangAoDto;
    }
}
