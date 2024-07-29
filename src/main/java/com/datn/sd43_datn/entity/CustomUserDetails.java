package com.datn.sd43_datn.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class CustomUserDetails implements UserDetails {

    private static final long serialVersionUID = 4336520029005301091L;
    private NhanVien nhanVien;

    public CustomUserDetails(NhanVien nhanVien) {
        super();
        this.nhanVien = nhanVien;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<SimpleGrantedAuthority> authorities = new HashSet<SimpleGrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(nhanVien.getChucVu().getTenChucVu()));
        return authorities;
    }

    @Override
    public String getPassword() {
        return nhanVien.getMatKhau();
    }

    @Override
    public String getUsername() {
        return nhanVien.getEmail();
    }
}
