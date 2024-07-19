package com.datn.sd43_datn.entity.ThuocTinhSp;

import com.datn.sd43_datn.entity.ThuocTinhSp.Extend.CreateEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "anh")
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
public class Anh extends CreateEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int ID;
    @Column(name = "Anh")
    private String anh;
    @Column(name = "trang_thai")
    private int trangThai;
    @Column(name = "mo_ta")
    private String moTa;
}
