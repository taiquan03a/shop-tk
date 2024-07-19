package com.datn.sd43_datn.service.ThuocTinhSpService;

import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface MauSacService {
    List<MauSac> findAll();

    List<MauSac> findAllById(Iterable<Long> integers);

    <S extends MauSac> S save(S entity);

    Optional<MauSac> findById(Long integer);

    void deleteById(Long integer);

    Page<MauSac> Page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<MauSac> findByMauSacKeyWord(String keyword);
}

