package com.datn.sd43_datn.entity.ThuocTinhSp;

import com.datn.sd43_datn.entity.ThuocTinhSp.Extend.CreateEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "dang_ao")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class DangAo extends CreateEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long ID;
    @Column(name = "ten_kieu_dang_ao")
    private String tenKieuDangAo;
    @Column(name = "mo_ta")
    private String moTa;
    @Column(name = "trang_thai")
    private int trangThai;
}
