package com.datn.sd43_datn.service.impl.ThuocTinhSpServiceImpl;

import com.datn.sd43_datn.entity.ThuocTinhSp.CoAo;
import com.datn.sd43_datn.repository.ThuocTinhSpRepository.CoAoRepository;
import com.datn.sd43_datn.service.ThuocTinhSpService.CoAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@Service
public class CoAoServiceImpl implements CoAoService {
    @Autowired
    CoAoRepository CoaoEntityRepository;

    @Override
    public List<CoAo> findAll() {
        return CoaoEntityRepository.findAll();
    }

    @Override
    public List<CoAo> findAllById(Iterable<Long> integers) {
        return CoaoEntityRepository.findAllById(integers);
    }

    @Override
    public <S extends CoAo> S save(S entity) {
        return CoaoEntityRepository.save(entity);
    }

    @Override
    public Optional<CoAo> findById(Long integer) {
        return CoaoEntityRepository.findById(integer);
    }

    @Override
    public void deleteById(Long integer) {
        CoaoEntityRepository.deleteById(integer);
    }
    @Override
    public Page<CoAo> Page(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return CoaoEntityRepository.findByKeyWord(pageable, keyword);
        }
        return CoaoEntityRepository.findAll(pageable);
    }
    @Override
    public void findTrangThai1(Long id){
        CoaoEntityRepository.updateTrangThai1(id);
    }
    @Override
    public void findTrangThai0(Long id){
        CoaoEntityRepository.updateTrangThai0(id);
    }

    @Override
    public List<CoAo> findByCoAoKeyWord(String keyword) {
        String key = keyword.toLowerCase();
        List<CoAo> coAoList = CoaoEntityRepository.findAll();
        List<CoAo> coAocDto = new ArrayList<CoAo>();
        for (CoAo coAo : coAoList) {
            if(coAo.getTenLoaiCoAo().toLowerCase().contains(key) ||
                    coAo.getMoTa().toLowerCase().contains(key)
            ){
                coAocDto.add(coAo);
            }

        }
        return coAocDto;
    }
}
