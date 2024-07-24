package com.datn.sd43_datn.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SanPhamHomeDto {
    private long ID;
    private String tenSanPham;
    private long giaBan;
    private String anh;
}
