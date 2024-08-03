package com.datn.sd43_datn.request;

import com.datn.sd43_datn.entity.ThuocTinhSp.KichCo;
import com.datn.sd43_datn.entity.ThuocTinhSp.MauSac;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FilterSizeAndColor {
    private MauSac idMauSac;
    private KichCo idKichCo;
}
