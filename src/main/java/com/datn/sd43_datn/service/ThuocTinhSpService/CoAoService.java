package com.datn.sd43_datn.service.ThuocTinhSpService;

import com.datn.sd43_datn.entity.ThuocTinhSp.CoAo;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface CoAoService {
    List<CoAo> findAll();

    List<CoAo> findAllById(Iterable<Long> integers);

    <S extends CoAo> S save(S entity);

    Optional<CoAo> findById(Long integer);

    void deleteById(Long integer);

    Page<CoAo> Page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<CoAo> findByCoAoKeyWord(String keyword);
}
