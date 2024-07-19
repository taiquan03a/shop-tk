package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang,Long> {
    @Query("SELECT k FROM KhachHang k WHERE k.kieuKhachHang = true")
    List<KhachHang> findAllKH();
}
