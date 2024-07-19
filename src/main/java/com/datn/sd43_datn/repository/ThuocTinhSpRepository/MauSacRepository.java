package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MauSacRepository extends JpaRepository<MauSac, Long> {
    @Query("SELECT m from MauSac m where concat(m.ID,m.tenMauSac,m.trangThai,m.moTa) Like %?1%")
    Page<MauSac> findByKeyWord(Pageable pageable, String keyword);

    @Query("select  m from MauSac  m order by m.ngayTao desc ")
    List<MauSac> getCreateAt();

    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE MauSac set trangThai=1 where ID=?1")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE MauSac set trangThai=0 where ID=?1")
    void updateTrangThai0(Long id);
}
