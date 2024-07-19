package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {
}
