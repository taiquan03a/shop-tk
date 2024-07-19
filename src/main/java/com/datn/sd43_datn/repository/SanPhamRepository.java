package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.SanPham;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Long> {

    @Query("SELECT s from SanPham s where concat(s.ID,s.tenSanPham,s.trangThai,s.moTa) Like %?1%")
    Page<SanPham> findByKeyWord(Pageable pageable, String keyword);
    @Query("select  s from SanPham  s order by s.ngayTao desc ")
    List<SanPham> getCreateAt();
    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE SanPham set trangThai=1 where ID=?1")
    void updateTrangThai1(Integer id);

    @Modifying
    @Transactional
    @Query("UPDATE SanPham set trangThai=0 where ID=?1")
    void updateTrangThai0(Integer id);
}
