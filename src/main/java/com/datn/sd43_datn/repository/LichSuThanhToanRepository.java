package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.HoaDon;
import com.datn.sd43_datn.entity.LichSuThanhToan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LichSuThanhToanRepository extends JpaRepository<LichSuThanhToan,Long> {
    List<LichSuThanhToan> findLichSuThanhToansByHoaDon(HoaDon hoaDon);
}
