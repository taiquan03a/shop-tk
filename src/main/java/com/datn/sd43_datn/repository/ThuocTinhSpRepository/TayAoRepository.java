package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.TayAo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface TayAoRepository extends JpaRepository<TayAo, Long> {
    @Query("SELECT t from TayAo t where concat(t.ID,t.tenKieuTayAo,t.trangThai,t.moTa) Like %?1%")
    Page<TayAo> findByKeyWord(Pageable pageable, String keyword);
    @Query("select  t from TayAo  t order by t.ngayTao desc ")
    List<TayAo> getCreateAt();
    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE TayAo set trangThai=1 where ID=?1")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE TayAo set trangThai=0 where ID=?1")
    void updateTrangThai0(Long id);
}
