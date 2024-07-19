package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.KHang.DiaChi;
import com.datn.sd43_datn.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface DiaChiRepository extends JpaRepository<DiaChi, Long> {
    List<DiaChi> findDiaChisByKhachHang(KhachHang khachHang);
}
