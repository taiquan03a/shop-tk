package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.KhachHangDto;
import com.datn.sd43_datn.entity.KHang.DiaChi;
import com.datn.sd43_datn.entity.KhachHang;
import com.datn.sd43_datn.repository.DiaChiRepository;
import com.datn.sd43_datn.repository.KhachHangRepository;
import com.datn.sd43_datn.request.DiaChiRequest;
import com.datn.sd43_datn.request.KhachHangRequest;
import com.datn.sd43_datn.request.TaoKhachHangRequest;
import com.datn.sd43_datn.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Service
public class KhachHangServiceImpl implements KhachHangService {
    @Autowired
    private KhachHangRepository khachHangRepository;
    @Autowired
    private DiaChiRepository diaChiRepository;


    @Override
    public List<KhachHangRequest> getKhachHang() {
        List<KhachHang> khachHangList =  khachHangRepository.findAllKH();
        List<KhachHangRequest> khachHangRequestList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");

        for (KhachHang khachHang : khachHangList) {
            String formattedDate = sdf.format(khachHang.getNgayTao());
            String maKhachHang = "";
            if (khachHang.getID() < 1000) {
                if (khachHang.getID() < 10) {
                    maKhachHang = "KH00" + String.valueOf(khachHang.getID());
                } else if (khachHang.getID() < 100) {
                    maKhachHang = "KH0" + String.valueOf(khachHang.getID());
                }
            } else {
                maKhachHang = "KH" + String.valueOf(khachHang.getID());
            }
            String gioiTinh = "";
            if(khachHang.getGioiTinh().equals(false)){
                gioiTinh = "Nam";
            }else{
                gioiTinh = "Nữ";
            }
            KhachHangRequest khachHangRequest = KhachHangRequest.builder()
                    .ID(khachHang.getID())
                    .tenKhachHang(khachHang.getTenKhachHang())
                    .email(khachHang.getEmail())
                    .ngayTao(formattedDate)
                    .maKhachHang(maKhachHang)
                    .gioiTinh(gioiTinh)
                    .sdt(khachHang.getSdt())
                    .trangThai(khachHang.isTrangThai())
                    .build();
            khachHangRequestList.add(khachHangRequest);
        }
        khachHangRequestList.sort(Comparator.comparingLong(KhachHangRequest::getID).reversed());
        return khachHangRequestList;
    }

    @Override
    public KhachHangDto getKhachHangById(long id) {
        KhachHang khachHang = khachHangRepository.findById(id).orElse(null);
        if (khachHang != null) {
            List<DiaChi> diaChiList = diaChiRepository.findDiaChisByKhachHang(khachHang);
            KhachHangDto khachHangDto = KhachHangDto.builder()
                    .ID(khachHang.getID())
                    .tenKhachHang(khachHang.getTenKhachHang())
                    .kieuKhachHang(khachHang.isKieuKhachHang())
                    .anh(khachHang.getAnh())
                    .sdt(khachHang.getSdt())
                    .matKhau(khachHang.getMatKhau())
                    .ngayTao(khachHang.getNgayTao())
                    .email(khachHang.getEmail())
                    .gioiTinh(khachHang.getGioiTinh())
                    .diaChiList(diaChiList)
                    .build();
            return khachHangDto;
        }
        return null;
    }

    @Override
    public boolean editKhachHang(KhachHangDto khachHangDto, long id) {
        KhachHang khachHang = khachHangRepository.findById(id).orElse(null);
        if (khachHang != null) {
            khachHang.setTenKhachHang(khachHangDto.getTenKhachHang());
            khachHang.setKieuKhachHang(khachHangDto.isKieuKhachHang());
            khachHang.setAnh(khachHangDto.getAnh());
            khachHang.setSdt(khachHangDto.getSdt());
            khachHang.setMatKhau(khachHangDto.getMatKhau());
            khachHang.setEmail(khachHangDto.getEmail());
            khachHang.setKieuKhachHang(!khachHangDto.isKieuKhachHang());
//            khachHang.setKieuKhachHang(true);
//            khachHang.setTrangThai(khachHangDto.isTrangThai());
//            khachHang.setGioiTinh(khachHangDto.getGioiTinh());
            khachHang.setGioiTinh(khachHangDto.isGioiTinh());
            khachHangRepository.save(khachHang);
            return true;
        }
        return false;
    }

    @Override
    public boolean addKhachHang(TaoKhachHangRequest createKhachHang) {
        KhachHang khachHang = KhachHang.builder()
                .tenKhachHang(createKhachHang.getTenKhachHang())
//                .gioiTinh(createKhachHang.getGioiTinh())
                .gioiTinh(createKhachHang.isGioiTinh())
                .email(createKhachHang.getEmail())
                .anh(createKhachHang.getAnh())
                .sdt(createKhachHang.getSdt())
                .matKhau(createKhachHang.getMatKhau())
                .kieuKhachHang(true)
                .trangThai(true)
                .ngayTao(new Date(System.currentTimeMillis()))
                .build();
        khachHangRepository.save(khachHang);
        DiaChi diaChi = DiaChi.builder()
                .khachHang(khachHang)
                .idPhuong(createKhachHang.getIdPhuong())
                .soNha(createKhachHang.getSoNha())
                .ghiChu(null)
                .trangThai("true")
                .build();
        diaChiRepository.save(diaChi);
        return true;
    }

    @Override
    public boolean deleteDiaChi(long diaChiId) {
        DiaChi diaChi = diaChiRepository.findById(diaChiId).orElse(null);
        if (diaChi != null) {
            diaChiRepository.delete(diaChi);
            return true;
        }
        return false;
    }

    @Override
    public boolean addDiaChi(long khachHangId, DiaChiRequest diaChiRequest) {
        KhachHang khachHang = khachHangRepository.findById(khachHangId).orElse(null);
        if (khachHang != null) {
            DiaChi diaChi = DiaChi.builder()
                    .khachHang(khachHang)
                    .soNha(diaChiRequest.getSoNha())
                    .idPhuong(diaChiRequest.getPhuongId())
                    .trangThai("true")
                    .ghiChu(null)
                    .build();
            diaChiRepository.save(diaChi);
            return true;
        }
        return false;
    }

    @Override
    public boolean status(long khachHangId) {
        KhachHang khachHang = khachHangRepository.findById(khachHangId).orElse(null);
        if (khachHang != null) {
            if(khachHang.isTrangThai()){
                khachHang.setTrangThai(false);
            }else{
                khachHang.setTrangThai(true);
            }
            khachHangRepository.save(khachHang);
            return true;
        }
        return false;
    }

    @Override
    public List<KhachHangRequest> filter(String search) {
        String searchLowerCase = search.toLowerCase();
        List<KhachHang> khachHangList = khachHangRepository.findAllKH();
        List<KhachHangRequest> khachHangRequestList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        for (KhachHang khachHang : khachHangList) {
            String gioiTinh = "";
            if(khachHang.getGioiTinh().equals(false)){
                gioiTinh = "Nam";
            }else{
                gioiTinh = "Nữ";
            }
            String maKhachHang = "";
            if (khachHang.getID() < 1000) {
                if (khachHang.getID() < 10) {
                    maKhachHang = "KH00" + String.valueOf(khachHang.getID());
                } else if (khachHang.getID() < 100) {
                    maKhachHang = "KH0" + String.valueOf(khachHang.getID());
                }
            } else {
                maKhachHang = "KH" + String.valueOf(khachHang.getID());
            }
            if(khachHang.getID().equals(searchLowerCase)||
                    maKhachHang.toLowerCase().contains(searchLowerCase) ||
                    khachHang.getTenKhachHang().toLowerCase().contains(searchLowerCase) ||
                    khachHang.getEmail().contains(searchLowerCase) ||
                    khachHang.getNgayTao().equals(searchLowerCase) ||
                    khachHang.getSdt().contains(searchLowerCase) ||
                    gioiTinh.contains(searchLowerCase)
            ){
                String formattedDate = sdf.format(khachHang.getNgayTao());

                KhachHangRequest khachHangRequest = KhachHangRequest.builder()
                        .ID(khachHang.getID())
                        .tenKhachHang(khachHang.getTenKhachHang())
                        .email(khachHang.getEmail())
                        .ngayTao(formattedDate)
                        .maKhachHang(maKhachHang)
                        .gioiTinh(gioiTinh)
                        .sdt(khachHang.getSdt())
                        .trangThai(khachHang.isTrangThai())
                        .build();
                khachHangRequestList.add(khachHangRequest);
            }
        }
        khachHangRequestList.sort(Comparator.comparingLong(KhachHangRequest::getID).reversed());
        return khachHangRequestList;
    }

    @Override
    public KhachHang login(String email, String password) {
        return khachHangRepository.findKhachHangByEmailAndMatKhau(email, password);
    }

    @Override
    public boolean register(TaoKhachHangRequest khachHangRequest) {
        KhachHang khachHangOld = khachHangRepository.findKhachHangByEmail(khachHangRequest.getEmail()).get(0);
        boolean kh = false;
        if (khachHangOld != null) {
            kh = khachHangOld.isTrangThai();
        }
        if(!kh) {
            KhachHang khachHang = KhachHang.builder()
                    .tenKhachHang(khachHangRequest.getTenKhachHang())
                    .email(khachHangRequest.getEmail())
                    .matKhau(khachHangRequest.getMatKhau())
                    .kieuKhachHang(true)
                    .trangThai(true)
                    .ngayTao(new Date(System.currentTimeMillis()))
                    .anh(null)
                    .sdt(khachHangRequest.getSdt())
                    .gioiTinh(khachHangRequest.isGioiTinh())
                    .build();
            khachHangRepository.save(khachHang);
            System.out.println("tk");
            return true;
        }
        return false;
    }
}
