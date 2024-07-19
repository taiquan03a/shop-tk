package com.datn.sd43_datn.entity;

import com.datn.sd43_datn.entity.ThuocTinhSp.Extend.CreateEntity;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Entity
@Table(name = "san_pham")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long ID;
    @Column(name = "ten_san_pham")
    private String tenSanPham;
    @Column(name = "ngay_tao")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private Date ngayTao;
    @Column(name = "ngay_cap_nhat")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private Date ngayCapNhat;
    @Column(name = "nguoi_tao")
    private String nguoiTao;
    @Column(name = "nguoi_cap_nhat")
    private String nguoiCapNhat;
    @Column(name = "mo_ta")
    private String moTa;
    @Column(name = "trang_thai")
    private int trangThai;
    @Column(name = "anh")
    private String anh;
}
