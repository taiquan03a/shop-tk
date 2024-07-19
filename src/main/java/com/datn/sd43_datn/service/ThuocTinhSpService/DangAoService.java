package com.datn.sd43_datn.service.ThuocTinhSpService;

import com.datn.sd43_datn.entity.ThuocTinhSp.DangAo;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface DangAoService {
    List<DangAo> findAll();

    List<DangAo> findAllById(Iterable<Long> integers);

    <S extends DangAo> S save(S entity);

    Optional<DangAo> findById(Long integer);

    void deleteById(Long integer);

    Page<DangAo> Page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<DangAo> findByDangAoKeyWord(String keyword);
}
