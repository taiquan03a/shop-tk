package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.HoaDon;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Long> {
    //@Query("select hdct from HoaDonChiTiet hdct where hdct.idHoaDon = :idHoaDon")
    //List<HoaDonChiTiet> findAllByIdHoaDon(Long idHoaDon);
    List<HoaDonChiTiet> findHoaDonChiTietsByHoaDon (HoaDon hoaDon);
    List<HoaDonChiTiet> findHoaDonChiTietsBySanPhamChiTiet(SanPhamChiTiet sanPhamChiTiet);
    boolean existsAllBySanPhamChiTietAndHoaDonAndSoLuong(SanPhamChiTiet sanPhamChiTiet, HoaDon hoaDon, long soLuong);
    HoaDonChiTiet findHoaDonChiTietBySanPhamChiTietAndAndHoaDon(SanPhamChiTiet sanPhamChiTiet, HoaDon hoaDon);
}
