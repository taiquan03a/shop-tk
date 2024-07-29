package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.NhanVienDto;
import com.datn.sd43_datn.entity.NVien.ChucVu;
import com.datn.sd43_datn.entity.NhanVien;
import com.datn.sd43_datn.repository.ChucVuRepository;
import com.datn.sd43_datn.repository.NhanVienRepository;
import com.datn.sd43_datn.request.KhachHangRequest;
import com.datn.sd43_datn.request.NhanVienRequest;
import com.datn.sd43_datn.request.TaoNhanVienRequest;
import com.datn.sd43_datn.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Service
public class NhanVienServiceImpl implements NhanVienService {
    @Autowired
    private NhanVienRepository nhanVienRepository;
    @Autowired
    private ChucVuRepository chucVuRepository;

    @Override
    public List<NhanVienRequest> getNhanVien() {
        List<NhanVien> nhanVienList = nhanVienRepository.findAll();
        List<NhanVienRequest> nhanVienRequestList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        for (NhanVien nhanVien : nhanVienList) {
            String formattedDate = sdf.format(nhanVien.getNgayTao());

            String maNhanVien = "";
            if (nhanVien.getID() < 1000) {
                if (nhanVien.getID() < 10) {
                    maNhanVien = "NV00" + String.valueOf(nhanVien.getID());
                } else if (nhanVien.getID() < 100) {
                    maNhanVien = "NV0" + String.valueOf(nhanVien.getID());
                }
            } else {
                maNhanVien = "NV" + String.valueOf(nhanVien.getID());
            }
            String gioiTinh = "";
            if(nhanVien.getGioiTinh().equals(false)){
                gioiTinh = "Nam";
            }else{
                gioiTinh = "Nữ";
            }

            NhanVienRequest nhanVienRequest =  NhanVienRequest.builder()
                    .ID(nhanVien.getID())
                    .maNhanVien(maNhanVien)
                    .tenNhanVien(nhanVien.getHoTen())
                    .email(nhanVien.getEmail())
                    .sdt(nhanVien.getSdt())
                    .ngayTao(formattedDate)
                    .gioiTinh(gioiTinh)
                    .chucVu(nhanVien.getChucVu())
                    .trangThai(nhanVien.isTrangThai())
                    .build();
            nhanVienRequestList.add(nhanVienRequest);
        }
        nhanVienRequestList.sort(Comparator.comparingLong(NhanVienRequest::getID).reversed());
        return nhanVienRequestList;
    }

    @Override
    public NhanVienDto getNhanVienById(long id) {
        NhanVien nhanVien = nhanVienRepository.findById(id).orElse(null);
        if (nhanVien != null) {
            NhanVienDto nhanVienDto = NhanVienDto.builder()
                    .ID(nhanVien.getID())
                    .tenNhanVien(nhanVien.getHoTen())
                    .email(nhanVien.getEmail())
                    .matKhau(nhanVien.getMatKhau())
                    .sdt(nhanVien.getSdt())
                    .gioiTinh(nhanVien.getGioiTinh())
                    .chucVu(nhanVien.getChucVu())
                    .trangThai(nhanVien.isTrangThai())
                    .build();
            return nhanVienDto;
        }
        return null;
    }

    @Override
    public boolean editNhanVien(NhanVienDto nhanVienDto, long id) {
        NhanVien nhanVien = nhanVienRepository.findById(id).orElse(null);
        if(nhanVien != null){
            nhanVien.setHoTen(nhanVienDto.getTenNhanVien());
            nhanVien.setEmail(nhanVienDto.getEmail());
            nhanVien.setMatKhau(new BCryptPasswordEncoder().encode(nhanVienDto.getMatKhau()));
            nhanVien.setGioiTinh(nhanVienDto.isGioiTinh());
            nhanVien.setSdt(nhanVienDto.getSdt());
            nhanVien.setChucVu(nhanVienDto.getChucVu());
            nhanVienRepository.save(nhanVien);
            return true;
        }
        return false;
    }

    @Override
    public boolean addNhanVien(TaoNhanVienRequest createNhanVien) {
        NhanVien nhanVien = NhanVien.builder()
                .hoTen(createNhanVien.getTenNhanVien())
                .email(createNhanVien.getEmail())
                .matKhau(new BCryptPasswordEncoder().encode(createNhanVien.getMatKhau()))
                .sdt(createNhanVien.getSdt())
                .gioiTinh(createNhanVien.isGioiTinh())
                .ngayTao(new Date(System.currentTimeMillis()))
                .chucVu(createNhanVien.getChucVu())
                .trangThai(true)
                .build();
        nhanVienRepository.save(nhanVien);
        return true;
    }

    @Override
    public boolean status(long nhanVienId) {
        NhanVien nhanVien = nhanVienRepository.findById(nhanVienId).orElse(null);
        if (nhanVien != null) {
            if(nhanVien.isTrangThai()){
                nhanVien.setTrangThai(false);
            }else {
                nhanVien.setTrangThai(true);
            }
            nhanVienRepository.save(nhanVien);
            return true;
        }
        return false;
    }

    @Override
    public List<NhanVienRequest> filter(String search) {
        String searchLowerCase = search.toLowerCase();
        List<NhanVien> nhanVienList = nhanVienRepository.findAll();
        List<NhanVienRequest> nhanVienRequestList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        for (NhanVien nhanVien : nhanVienList) {
            String gioiTinh = "";
            if (nhanVien.getGioiTinh().equals(false)) {
                gioiTinh = "Nam";
            } else {
                gioiTinh = "Nữ";
            }
            String maNhanVien = "";
            if (nhanVien.getID() < 1000) {
                if (nhanVien.getID() < 10) {
                    maNhanVien = "NV00" + String.valueOf(nhanVien.getID());
                } else if (nhanVien.getID() < 100) {
                    maNhanVien = "NV0" + String.valueOf(nhanVien.getID());
                }
            } else {
                maNhanVien = "NV" + String.valueOf(nhanVien.getID());
            }
            if (nhanVien.getID().equals(searchLowerCase) ||
                    maNhanVien.toLowerCase().contains(searchLowerCase) ||
                    nhanVien.getHoTen().toLowerCase().contains(searchLowerCase) ||
                    nhanVien.getEmail().toLowerCase().contains(searchLowerCase) ||
                    nhanVien.getNgayTao().equals(searchLowerCase) ||
                    nhanVien.getSdt().contains(searchLowerCase) ||
                    gioiTinh.contains(searchLowerCase) ||
                    nhanVien.getChucVu().getTenChucVu().equals(searchLowerCase)
            ){
                String formattedDate = sdf.format(nhanVien.getNgayTao());

                NhanVienRequest nhanVienRequest = NhanVienRequest.builder()
                        .ID(nhanVien.getID())
                        .maNhanVien(maNhanVien)
                        .tenNhanVien(nhanVien.getHoTen())
                        .email(nhanVien.getEmail())
                        .sdt(nhanVien.getSdt())
                        .ngayTao(formattedDate)
                        .gioiTinh(gioiTinh)
                        .chucVu(nhanVien.getChucVu())
                        .trangThai(nhanVien.isTrangThai())
                        .build();
                nhanVienRequestList.add(nhanVienRequest);
            }
        }
        nhanVienRequestList.sort(Comparator.comparingLong(NhanVienRequest::getID).reversed());
        return nhanVienRequestList;
    }

    @Override
    public boolean nhanVienExists(String email) {
        if(nhanVienRepository.findNhanVienByEmail(email) == null) return false;
        return true;
    }

    @Override
    public NhanVien createNewNhanVien(NhanVien nhanVien) {
        nhanVien.setMatKhau(new BCryptPasswordEncoder().encode(nhanVien.getMatKhau()));
        System.out.println(nhanVien.getChucVu().getTenChucVu());
        return nhanVienRepository.save(nhanVien);
    }
}
