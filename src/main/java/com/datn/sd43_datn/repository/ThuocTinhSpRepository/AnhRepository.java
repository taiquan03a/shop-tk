package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.Anh;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AnhRepository extends JpaRepository<Anh, Long> {

    @Query("SELECT a from Anh a where concat(a.ID,a.anh,a.trangThai,a.moTa) Like %?1%")
    Page<Anh> findByKeyWord(Pageable pageable, String keyword);
    @Query("select  a from Anh a order by a.ngayTao desc ")
    List<Anh> getAnhCreateAt();// lấy ảnh theo ngày mỡi nhất

    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE Anh a SET a.trangThai = 1 WHERE a.ID = :id")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE Anh a SET a.trangThai = 0 WHERE a.ID = :id")
    void updateTrangThai0(Long id);
}
