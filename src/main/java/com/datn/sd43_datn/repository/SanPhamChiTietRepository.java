package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Long> {
    @Query("SELECT p FROM SanPhamChiTiet p where p.sanPham.tenSanPham=?1")
    List<SanPhamChiTiet> findBySanPhamKeyWord(String keyword);
    //tk sp có phân trang
    @Query("SELECT p from SanPhamChiTiet p where concat(p.mauSac.tenMauSac,p.sanPham.tenSanPham,p.trangThai,p.thuongHieu.tenThuongHieu," +
            "p.tayAo.tenKieuTayAo,p.kichCo.tenKichCo,p.hoaTiet.tenHoaTiet,p.dangAo.tenKieuDangAo,p.chatLieu.tenChatLieu,p.coAo.tenLoaiCoAo," +
            "p.anh.anh) like  %?1%")
    Page<SanPhamChiTiet> pageSpct(Pageable pageable, String keyword);

    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE SanPhamChiTiet set trangThai=0 where ID=?1")
    void updateTrangThai1(@Param("id") Long id);

    @Modifying
    @Transactional
    @Query("UPDATE SanPhamChiTiet set trangThai=1 where ID=?1")
    void updateTrangThai0(@Param("id") Long id);

    @Query("select p from SanPhamChiTiet p where p.sanPham=?1 order by p.giaBan asc limit 1")
    SanPhamChiTiet findBySanPham(SanPham sanPham);

    List<SanPhamChiTiet> findAllByMauSacAndThuongHieuAndTayAoAndKichCoAndHoaTietAndDangAoAndChatLieuAndCoAoAndSanPham(MauSac mauSac, ThuongHieu thuongHieu, TayAo tayAo,
                                                                                                            KichCo kichCo, HoaTiet hoaTiet,DangAo dangAo,ChatLieu chatLieu,CoAo coAo,SanPham sanPham);
    List<SanPhamChiTiet> findSanPhamChiTietBySanPham(SanPham sanPham);
    @Query("SELECT s FROM SanPhamChiTiet s WHERE " +
            "(:idMauSac IS NULL OR s.mauSac = :idMauSac) AND " +
            "(:idThuongHieu IS NULL OR s.thuongHieu = :idThuongHieu) AND " +
            "(:idTayAo is null or s.thuongHieu = :idTayAo) and" +
            "(:idKichCo is null or s.kichCo= :idKichCo) and" +
            "(:idHoaTiet is null or s.hoaTiet= :idHoaTiet) and" +
            "(:idDangAo is null or s.dangAo = :idDangAo) and" +
            "(:idChatLieu is null or s.chatLieu = :idChatLieu) and" +
            "(:idCoAo is null or s.coAo = :idCoAo) and "+
            "(:sanPham IS NULL OR s.sanPham = :sanPham)")
    List<SanPhamChiTiet> findAllByFilter(@Param("idMauSac") MauSac idMauSac,
                                         @Param("idThuongHieu") ThuongHieu idThuongHieu,
                                         @Param("idTayAo") TayAo idTayAo,
                                         @Param("idKichCo") KichCo kichCo,
                                         @Param("idHoaTiet") HoaTiet hoaTiet,
                                         @Param("idDangAo") DangAo dangAo,
                                         @Param("idChatLieu") ChatLieu chatLieu,
                                         @Param("idCoAo") CoAo coAo,
                                         @Param("sanPham") SanPham sanPham);
}
