package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.HoaDon;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Long> {
    //@Query("select hdct from HoaDonChiTiet hdct where hdct.idHoaDon = :idHoaDon")
    //List<HoaDonChiTiet> findAllByIdHoaDon(Long idHoaDon);
    List<HoaDonChiTiet> findHoaDonChiTietsByHoaDon (HoaDon hoaDon);
}
