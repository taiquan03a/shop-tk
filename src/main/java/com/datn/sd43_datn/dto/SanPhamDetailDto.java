package com.datn.sd43_datn.dto;

import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import jakarta.persistence.CascadeType;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SanPhamDetailDto {
    private List<Anh> anh;
    private List<MauSac> mauSac;
    private List<ChatLieu> chatLieu;
    private List<ThuongHieu> thuongHieu;
    private List<KichCo> kichCo;
    private List<DangAo> dangAo;
    private List<CoAo> coAo;
    private List<TayAo> tayAo;
    private List<HoaTiet> hoaTiet;
    //List<ThuocTinhDto> thuocTinhDtoList;
}
