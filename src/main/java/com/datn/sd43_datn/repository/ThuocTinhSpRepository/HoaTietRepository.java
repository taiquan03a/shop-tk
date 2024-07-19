package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.HoaTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface HoaTietRepository extends JpaRepository<HoaTiet, Long> {
    @Query("SELECT h from HoaTiet h where concat(h.ID,h.tenHoaTiet,h.trangThai,h.moTa) Like %?1%")
    Page<HoaTiet> findByKeyWord(Pageable pageable, String keyword);
    @Query("select  h from HoaTiet  h order by h.ngayTao desc ")
    List<HoaTiet> getCreateAt();
    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE HoaTiet set trangThai=1 where ID=?1")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE HoaTiet set trangThai=0 where ID=?1")
    void updateTrangThai0(Long id);
}
