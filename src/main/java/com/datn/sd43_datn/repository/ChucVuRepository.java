package com.datn.sd43_datn.repository;

import com.datn.sd43_datn.entity.NVien.ChucVu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface ChucVuRepository extends JpaRepository<ChucVu, Long> {

}
