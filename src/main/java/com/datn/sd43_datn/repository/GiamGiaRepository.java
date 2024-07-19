package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.GiamGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GiamGiaRepository extends JpaRepository<GiamGia, Long> {
    GiamGia findGiamGiaByTenGiamGia(String tenGiamGia);
}
