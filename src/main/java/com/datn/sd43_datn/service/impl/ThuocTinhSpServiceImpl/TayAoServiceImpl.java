package com.datn.sd43_datn.service.impl.ThuocTinhSpServiceImpl;

import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.entity.ThuocTinhSp.TayAo;
import com.datn.sd43_datn.repository.ThuocTinhSpRepository.TayAoRepository;
import com.datn.sd43_datn.service.ThuocTinhSpService.TayAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@Service
public class TayAoServiceImpl implements TayAoService {
    @Autowired
    TayAoRepository TayaoEntityRepository;

    @Override
    public List<TayAo> findAll() {
        return TayaoEntityRepository.findAll();
    }

    @Override
    public List<TayAo> findAllById(Iterable<Long> integers) {
        return TayaoEntityRepository.findAllById(integers);
    }

    @Override
    public <S extends TayAo> S save(S entity) {
        return TayaoEntityRepository.save(entity);
    }

    @Override
    public Optional<TayAo> findById(Long integer) {
        return TayaoEntityRepository.findById(integer);
    }

    @Override
    public void deleteById(Long integer) {
        TayaoEntityRepository.deleteById(integer);
    }
    @Override
    public Page<TayAo> Page(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return TayaoEntityRepository.findByKeyWord(pageable, keyword);
        }
        return TayaoEntityRepository.findAll(pageable);
    }
    @Override
    public void findTrangThai1(Long id){
        TayaoEntityRepository.updateTrangThai1(id);
    }
    @Override
    public void findTrangThai0(Long id){
        TayaoEntityRepository.updateTrangThai0(id);
    }

    @Override
    public List<TayAo> findByTayAoKeyWord(String keyword) {
        String key = keyword.toLowerCase();
        List<TayAo> tayAoList = TayaoEntityRepository.findAll();
        List<TayAo> tayAoDto = new ArrayList<TayAo>();
        for (TayAo tayAo : tayAoList) {
            if(tayAo.getTenKieuTayAo().toLowerCase().contains(key) ||
                    tayAo.getMoTa().toLowerCase().contains(key)
            ){
                tayAoDto.add(tayAo);
            }
        }
        return tayAoDto;
    }
}

