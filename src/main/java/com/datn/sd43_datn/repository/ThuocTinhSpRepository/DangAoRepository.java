package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.DangAo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface DangAoRepository extends JpaRepository<DangAo, Long> {

    @Query("SELECT d from DangAo d where concat(d.ID,d.tenKieuDangAo,d.trangThai,d.moTa) Like %?1%")
    Page<DangAo> findByKeyWord(Pageable pageable, String keyword);
    @Query("select  d from DangAo  d order by d.ngayTao desc ")
    List<DangAo> getCreateAt();
    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE DangAo set trangThai=1 where ID=?1")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE DangAo set trangThai=0 where ID=?1")
    void updateTrangThai0(Long id);
}