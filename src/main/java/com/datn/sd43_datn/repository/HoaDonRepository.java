package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.dto.DoanhThuDto;
import com.datn.sd43_datn.entity.HoaDon;
import com.datn.sd43_datn.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;


@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {
    @Query("select h from HoaDon h where h.trangThaiDon.ID = 5")
    List<HoaDon> hoaDonHoanThanh();

    @Query("SELECT SUM(h.thanhTien) FROM HoaDon h WHERE h.ngayTao BETWEEN :startDate AND :endDate and h.trangThaiDon.ID = 5")
    Long getTotalRevenueByYearAndMonth(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    @Query("SELECT h FROM HoaDon h where h.trangThaiDon.ID = 5 ORDER BY h.ngayTao ASC limit 1")
    HoaDon findOldestHoaDon();

    List<HoaDon> findHoaDonsByKhachHang(KhachHang khachHang);

}
