package com.datn.sd43_datn.service.ThuocTinhSpService;

import com.datn.sd43_datn.entity.ThuocTinhSp.KichCo;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface KichCoService {
    List<KichCo> findAll();

    List<KichCo> findAllById(Iterable<Long> integers);

    <S extends KichCo> S save(S entity);

    Optional<KichCo> findById(Long integer);

    void deleteById(Long integer);

    Page<KichCo> Page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<KichCo> findByKichCoKeyWord(String keyword);
}
