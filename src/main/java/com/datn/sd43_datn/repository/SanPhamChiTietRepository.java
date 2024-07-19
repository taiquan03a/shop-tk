package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.SanPhamChiTiet;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
}
