package com.datn.sd43_datn.dto;

import com.datn.sd43_datn.entity.TrangThaiHoaDon;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TimeLineDto {
    private String time;
    private TrangThaiHoaDon trangThaiDon;
}
