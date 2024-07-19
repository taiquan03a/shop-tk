package com.datn.sd43_datn.request;

import lombok.*;

@Data
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TaoDonHangRequest {
    private String name;
    private String phone;
    private String type;
    private String list_product;
    private String note;
    private String discount_name;
}
