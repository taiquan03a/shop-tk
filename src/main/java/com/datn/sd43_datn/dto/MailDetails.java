package com.datn.sd43_datn.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailDetails {
    private String recipient;
    private String msgBody;
    private String subject;
    private String attachment;
}