package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.KichCo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface KichCoRepository extends JpaRepository<KichCo, Long> {
    @Query("SELECT k from KichCo k where concat(k.ID,k.tenKichCo,k.trangThai,k.moTa) Like %?1%")
    Page<KichCo> findByKeyWord(Pageable pageable, String keyword);
    @Query("select  k from KichCo k order by k.ngayTao desc ")
    List<KichCo> getCreateAt();
    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE KichCo set trangThai=1 where ID=?1")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE KichCo set trangThai=0 where ID=?1")
    void updateTrangThai0(Long id);
}
