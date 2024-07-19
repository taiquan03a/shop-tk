package com.datn.sd43_datn.service.ThuocTinhSpService;


import com.datn.sd43_datn.entity.ThuocTinhSp.HoaTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface HoaTietService {
    List<HoaTiet> findAll();

    List<HoaTiet> findAllById(Iterable<Long> integers);

    <S extends HoaTiet> S save(S entity);

    Optional<HoaTiet> findById(Long integer);

    void deleteById(Long integer);

    Page<HoaTiet> Page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<HoaTiet> findByHoaTietKeyWord(String keyword);
}
