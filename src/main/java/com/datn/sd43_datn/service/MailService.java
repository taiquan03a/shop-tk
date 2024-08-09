package com.datn.sd43_datn.service;

import org.thymeleaf.context.Context;

public interface MailService {
    void sendEmailWithHtmlTemplate(String to, String subject, String templateName, Context context);
}
