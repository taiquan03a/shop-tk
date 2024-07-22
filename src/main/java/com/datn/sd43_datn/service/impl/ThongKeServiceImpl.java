package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.DoanhThuDto;
import com.datn.sd43_datn.entity.HoaDon;
import com.datn.sd43_datn.entity.KhachHang;
import com.datn.sd43_datn.repository.HoaDonRepository;
import com.datn.sd43_datn.repository.KhachHangRepository;
import com.datn.sd43_datn.repository.NhanVienRepository;
import com.datn.sd43_datn.repository.SanPhamChiTietRepository;
import com.datn.sd43_datn.service.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
public class ThongKeServiceImpl implements ThongKeService {
    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;
    @Autowired
    private KhachHangRepository khachHangRepository;
    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Autowired
    private NhanVienRepository nhanVienRepository;
    @Override
    public long tongSanPham() {
        return sanPhamChiTietRepository.count();
    }

    @Override
    public long tongKhachHang() {
        return khachHangRepository.count();
    }

    @Override
    public long tongDonHang() {
        return hoaDonRepository.count();
    }

    @Override
    public long tongNhanVien() {
        return nhanVienRepository.count();
    }

    @Override
    public DoanhThuDto doanhThu(String type) throws ParseException {
        List<String> thang = new ArrayList<>();
        List<String> doanThuList = new ArrayList<>();
        if ("1".equals(type) || type == null) {

            LocalDateTime currentDate = LocalDateTime.now();
            int currentYear = currentDate.getYear();

            for (int i = 1; i <= 12; i++) {
                YearMonth yearMonth = YearMonth.of(currentYear, i); //tháng của năm vd 2024-01
                LocalDateTime startDate = yearMonth.atDay(1).atStartOfDay(); //ngày bắt đầu của tháng
                LocalDateTime endDate = yearMonth.atEndOfMonth().atStartOfDay(); // ngày kết thúc của tháng

                Date batDau = Date.from(startDate.atZone(ZoneId.systemDefault()).toInstant());
                Date ketThuc = Date.from(endDate.atZone(ZoneId.systemDefault()).toInstant());
                //8791000.0, 1736162.0
                Long doanhThu = hoaDonRepository.getTotalRevenueByYearAndMonth(batDau, ketThuc);
                if (doanhThu == null) {
                    doanhThu = 0L;
                }
                doanThuList.add(String.valueOf(doanhThu));
                thang.add(String.valueOf(i));
            }
        } else if ("2".equals(type)) {
            //HoaDon hoaDon = hoaDonRepository.findAll().stream().findFirst().get();
            HoaDon hoaDon = hoaDonRepository.findOldestHoaDon();
            Date dateOld = hoaDon.getNgayTao();
            LocalDateTime localDate = dateOld.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            int currentYear = LocalDate.now().getYear();
            int yearOld = localDate.getYear();
            for(int i = yearOld; i <= currentYear; i++) {
                LocalDateTime endYear = LocalDate.of(i, Month.DECEMBER, 31).atTime(23, 59, 59);
                LocalDateTime startYear = LocalDate.of(i, Month.JANUARY, 1).atStartOfDay();

                Date batDau = Date.from(startYear.atZone(ZoneId.systemDefault()).toInstant());
                Date ketThuc = Date.from(endYear.atZone(ZoneId.systemDefault()).toInstant());

                Long doanhThu = hoaDonRepository.getTotalRevenueByYearAndMonth(batDau, ketThuc);
                if (doanhThu == null) {
                    doanhThu = 0L;
                }
                doanThuList.add(String.valueOf(doanhThu));
                thang.add(String.valueOf(i));
            }
        }
        List<HoaDon> listHoaDon = hoaDonRepository.hoaDonHoanThanh();
        Set<KhachHang> listKhachHang = new HashSet<>();
        for (HoaDon hoaDon : listHoaDon) {
            listKhachHang.add(hoaDon.getKhachHang());
        }
        return DoanhThuDto.builder()
                .thoiGian(thang)
                .doanhThu(doanThuList)
                .tongDonHang(listHoaDon.size())
                .tongKhachHang(listKhachHang.size())
                .tongNhanVien(nhanVienRepository.count())
                .tongSanPham(sanPhamChiTietRepository.count())
                .build();
    }
}
