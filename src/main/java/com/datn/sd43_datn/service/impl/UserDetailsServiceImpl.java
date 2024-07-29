package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.entity.CustomUserDetails;
import com.datn.sd43_datn.entity.NhanVien;
import com.datn.sd43_datn.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        NhanVien nhanVien = nhanVienRepository.findNhanVienByEmail(email);
        if(nhanVien == null) {
            throw new UsernameNotFoundException("User not found.");

        } else {
            return new CustomUserDetails(nhanVien);
        }
    }

}
