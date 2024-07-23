package com.datn.sd43_datn.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ThuocTinhDto {
    private long ID;
    private String tenThuocTinh;
}
