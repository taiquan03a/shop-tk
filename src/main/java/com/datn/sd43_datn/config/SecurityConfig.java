package com.datn.sd43_datn.config;

import com.datn.sd43_datn.service.impl.UserDetailsServiceImpl;
import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(userDetailsService());
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }

    @Bean
    public SecurityFilterChain config(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeHttpRequests(authorize -> authorize
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        .requestMatchers("/").permitAll()
                        .requestMatchers("/webapp/**","/templates/**", "/static/**", "/css/**", "/js/**", "/img/**").permitAll()
                        .requestMatchers("/user/**").permitAll()
                        .requestMatchers("/signup").permitAll()
                        .requestMatchers("/nhan-vien/**").hasAuthority("QUANLY")
                        .requestMatchers("/hoa-don/**").hasAnyAuthority("NHANVIEN","QUANLY")
                        .requestMatchers("/khach-hang/**").hasAnyAuthority("NHANVIEN","QUANLY")
                        .requestMatchers("/SanPhamChiTiet/**").hasAnyAuthority("NHANVIEN","QUANLY")
                        .requestMatchers("/SanPham/").hasAnyAuthority("NHANVIEN","QUANLY")
                        .requestMatchers("/thong-ke/**").hasAnyAuthority("NHANVIEN","QUANLY")
                        .anyRequest().permitAll()
                )
                .formLogin(form -> form
                        .loginPage("/signin")
                        .failureUrl("/signin?error=true")
                        .loginProcessingUrl("/login")
                        .usernameParameter("username")
                        .defaultSuccessUrl("/thong-ke/index")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/signout")
                        .invalidateHttpSession(true)
                        .logoutSuccessUrl("/signin")
                        .permitAll()
                );

        return http.build();
    }
}
