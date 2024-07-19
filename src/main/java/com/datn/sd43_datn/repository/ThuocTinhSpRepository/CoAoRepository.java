package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.CoAo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CoAoRepository extends JpaRepository<CoAo, Long> {

    @Query("SELECT c from CoAo c where concat(c.ID,c.tenLoaiCoAo,c.trangThai,c.moTa) Like %?1%")
    Page<CoAo> findByKeyWord(Pageable pageable, String keyword);
    @Query("select  c from CoAo  c order by c.ngayTao desc ")
    List<CoAo> getCreateAt();
    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE CoAo set trangThai=1 where ID=?1")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE CoAo set trangThai=0 where ID=?1")
    void updateTrangThai0(Long id);
}
