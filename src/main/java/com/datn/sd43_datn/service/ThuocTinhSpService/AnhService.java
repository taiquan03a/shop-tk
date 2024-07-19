package com.datn.sd43_datn.service.ThuocTinhSpService;


import com.datn.sd43_datn.entity.ThuocTinhSp.Anh;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface AnhService {
    List<Anh> findAll();

    List<Anh> findAllById(Iterable<Long> integers);

    <S extends Anh> S save(S entity);

    Optional<Anh> findById(Long integer);

    void deleteById(Long integer);

    Page<Anh> Page(String keyword, int pageNumber);


    void findTrangThai1(Long id);

    void findTrangThai0(Long id);
}

