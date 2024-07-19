package com.datn.sd43_datn.service.ThuocTinhSpService;

import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import com.datn.sd43_datn.entity.ThuocTinhSp.ThuongHieu;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface ThuongHieuService {
    List<ThuongHieu> findAll();

    List<ThuongHieu> findAllById(Iterable<Long> integers);

    <S extends ThuongHieu> S save(S entity);

    Optional<ThuongHieu> findById(Long integer);

    void deleteById(Long integer);

    Page<ThuongHieu> page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<ThuongHieu> findByThuongHieuKeyWord(String keyword);
}

