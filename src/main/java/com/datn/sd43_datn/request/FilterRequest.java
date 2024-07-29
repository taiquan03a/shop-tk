package com.datn.sd43_datn.request;

import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import lombok.*;

@Data
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FilterRequest {
    private MauSac idMauSac;
    private ChatLieu idChatLieu;
    private ThuongHieu idThuongHieu;
    private KichCo idKichCo;
    private DangAo idDangAo;
    private CoAo idCoAo;
    private TayAo idTayAo;
    private HoaTiet idHoaTiet;
    private String sort;
    private String keyword;
}
