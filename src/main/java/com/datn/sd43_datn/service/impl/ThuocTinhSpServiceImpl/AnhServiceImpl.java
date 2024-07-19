package com.datn.sd43_datn.service.impl.ThuocTinhSpServiceImpl;

import com.datn.sd43_datn.entity.ThuocTinhSp.Anh;
import com.datn.sd43_datn.repository.ThuocTinhSpRepository.AnhRepository;
import com.datn.sd43_datn.service.ThuocTinhSpService.AnhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AnhServiceImpl implements AnhService {
    @Autowired
    AnhRepository anhEntityRepository;

    @Override
    public List<Anh> findAll() {
        return anhEntityRepository.findAll();
    }

    @Override
    public List<Anh> findAllById(Iterable<Long> integers) {
        return anhEntityRepository.findAllById(integers);
    }

    @Override
    public <S extends Anh> S save(S entity) {
        return anhEntityRepository.save(entity);
    }

    @Override
    public Optional<Anh> findById(Long integer) {
        return anhEntityRepository.findById(integer);
    }

    @Override
    public void deleteById(Long integer) {
        anhEntityRepository.deleteById(integer);
    }
    @Override
    public Page<Anh> Page(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return anhEntityRepository.findByKeyWord(pageable, keyword);
        }
        return anhEntityRepository.findAll(pageable);
    }
    @Override
    public void findTrangThai1(Long id){
        anhEntityRepository.updateTrangThai1(id);
    }
    @Override
    public void findTrangThai0(Long id){
        anhEntityRepository.updateTrangThai0(id);
    }
}
