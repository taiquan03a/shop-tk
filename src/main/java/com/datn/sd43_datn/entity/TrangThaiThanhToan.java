package com.datn.sd43_datn.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "trang_thai_thanh_toan")
public class TrangThaiThanhToan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Long id;

    @Column(name = "tenTrangThai")
    public String tenTrangThai;

    @Column(name = "ghiChu")
    public String ghiChu;

    @Column(name = "trangThai")
    public Boolean trangThai;

}
