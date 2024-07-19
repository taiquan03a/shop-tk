package com.datn.sd43_datn.config;

import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

public class CreateBy implements AuditorAware<String>{
    @Override
    public Optional<String> getCurrentAuditor() {
        return Optional.of("admin");
    }
}


