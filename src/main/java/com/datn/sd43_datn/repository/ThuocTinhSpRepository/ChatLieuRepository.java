package com.datn.sd43_datn.repository.ThuocTinhSpRepository;

import com.datn.sd43_datn.entity.ThuocTinhSp.ChatLieu;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ChatLieuRepository extends JpaRepository<ChatLieu, Long> {

    @Query("SELECT c from ChatLieu c where concat(c.ID,c.moTa,c.trangThai,c.tenChatLieu) Like %?1%")
    Page<ChatLieu> findByKeyWord(Pageable pageable, String keyword);
    @Query("select c from ChatLieu c order by c.ngayTao desc ")
    List<ChatLieu> getCreateAt();
    @Modifying //cho biêt thay doi du lieu
    @Transactional //dam bao phuong thuc duoc thuc thi
    @Query("UPDATE ChatLieu set trangThai=1 where ID=?1")
    void updateTrangThai1(Long id);

    @Modifying
    @Transactional
    @Query("UPDATE ChatLieu set trangThai=0 where ID=?1")
    void updateTrangThai0(Long id);
}
