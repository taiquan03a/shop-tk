package com.datn.sd43_datn.service.ThuocTinhSpService;

import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.entity.ThuocTinhSp.TayAo;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface TayAoService {
    List<TayAo> findAll();

    List<TayAo> findAllById(Iterable<Long> integers);

    <S extends TayAo> S save(S entity);

    Optional<TayAo> findById(Long integer);

    void deleteById(Long integer);

    Page<TayAo> Page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<TayAo> findByTayAoKeyWord(String keyword);
}
