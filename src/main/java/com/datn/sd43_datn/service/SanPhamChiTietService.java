package com.datn.sd43_datn.service;

import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import org.springframework.data.domain.Page;

import java.util.List;

public interface SanPhamChiTietService {
    List<SanPhamChiTiet> getSanPhamChiTiet();

    List<SanPhamChiTiet> findAllById(Iterable<Long> integers);

    <S extends SanPhamChiTiet> S save(S entity);

    SanPhamChiTiet findById(Long integer);

    void deleteById(Long integer);

    List<SanPhamChiTiet> findBySanPhamKeyWord(String keyword);

    Page<SanPhamChiTiet> sanphamchitietEntityPage(String keyword, int pageNumber);

    List<Anh> findAnhCreateAt();

    List<ChatLieu> findChatLieuCreateAt();

    List<CoAo> findCoAoCreateAt();

    List<DangAo> findDangAoCreateAt();

    List<HoaTiet> findHoaTietCreateAt();

    List<KichCo> findKichCoCreateAt();

    List<MauSac> findMauSacCreateAt();

    List<SanPham> findSanPhamCreateAt();

    List<TayAo> findTayAoCreateAt();

    List<ThuongHieu> findThuongHieuCreateAt();

    void findTrangThai1(Long id);

    void findTrangThai0(Long id);

}