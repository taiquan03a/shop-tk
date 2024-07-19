package com.datn.sd43_datn.service.ThuocTinhSpService;

import com.datn.sd43_datn.entity.ThuocTinhSp.ChatLieu;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import org.springframework.data.domain.Page;


import java.util.List;
import java.util.Optional;

public interface ChatLieuService {
    List<ChatLieu> findAll();

    List<ChatLieu> findAllById(Iterable<Long> integers);

    <S extends ChatLieu> S save(S entity);

    Optional<ChatLieu> findById(Long integer);

    void deleteById(Long integer);

    Page<ChatLieu> Page(String keyword, int pageNumber);

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

    List<ChatLieu> findByChatLieuKeyWord(String keyword);
}