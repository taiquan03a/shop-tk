package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.SanPhamHomeDto;
import com.datn.sd43_datn.entity.HoaDonChiTiet;
import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.repository.HoaDonChiTietRepository;
import com.datn.sd43_datn.repository.SanPhamChiTietRepository;
import com.datn.sd43_datn.repository.SanPhamRepository;
import com.datn.sd43_datn.request.FilterRequest;
import com.datn.sd43_datn.request.HoaDonRequest;
import com.datn.sd43_datn.service.SanPhamService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class SanPhamServiceImpl implements SanPhamService {
    final private SanPhamRepository sanPhamRepository;
    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Override
    public List<SanPham> getAllSanPham() {
        return sanPhamRepository.findAll();
    }

    @Override
    public List<SanPham> findBySanPhamKeyWord(String keyword) {
        String key = keyword.toLowerCase();
        List<SanPham> sanPhamList = sanPhamRepository.findAll();
        List<SanPham> sanPhamDto = new ArrayList<SanPham>();
        for (SanPham sanPham : sanPhamList) {
            if(sanPham.getNguoiCapNhat() != null){
                if(sanPham.getTenSanPham().toLowerCase().contains(key) ||
                        sanPham.getNguoiCapNhat().toLowerCase().contains(key) ||
                        sanPham.getNguoiTao().toLowerCase().contains(key) ||
                        sanPham.getMoTa().toLowerCase().contains(key)
                ){
                    sanPhamDto.add(sanPham);
                }
            }else{
                if(sanPham.getTenSanPham().toLowerCase().contains(key) ||
                        sanPham.getNguoiTao().toLowerCase().contains(key) ||
                        sanPham.getMoTa().toLowerCase().contains(key)
                ){
                    sanPhamDto.add(sanPham);
                }
            }
        }
        return sanPhamDto;
    }


    @Autowired
    SanPhamRepository SanphamEntityRepository;

    @Override
    public List<SanPham> findAll() {
        return SanphamEntityRepository.findAll();
    }

    @Override
    public List<SanPham> findAllById(Iterable<Long> longs) {
        return SanphamEntityRepository.findAllById(longs);
    }

    @Override
    public boolean save(SanPham sanPham) {
        boolean check = sanPhamRepository.existsSanPhamByTenSanPham(sanPham.getTenSanPham());
        if(check){
            return false;
        }
        SanphamEntityRepository.save(sanPham);
        return true;
    }

    @Override
    public Optional<SanPham> findById(Long longs) {
        return SanphamEntityRepository.findById(longs);
    }

    @Override
    public void deleteById(Long longs) {
        SanphamEntityRepository.deleteById(longs);    }
    @Override
    public Page<SanPham> Page(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return SanphamEntityRepository.findByKeyWord(pageable, keyword);
        }
        return SanphamEntityRepository.findAll(pageable);
    }
    @Override
    public void findTrangThai1(Long id){
        SanPham sanPham = sanPhamRepository.findById(id).get();
        if(sanPham.getTrangThai() == 0){
            sanPham.setTrangThai(1);
            sanPhamRepository.save(sanPham);
        }else {
            sanPham.setTrangThai(0);
            sanPhamRepository.save(sanPham);
        }
    }
    @Override
    public void findTrangThai0(Integer id){
        SanphamEntityRepository.updateTrangThai0(id);
    }

    @Override
    public List<SanPhamHomeDto> getSanPhamHome() {
        List<SanPham> sanPhams = sanPhamRepository.findAll();
        List<SanPhamHomeDto> sanPhamHomeDtos = new ArrayList<>();
        for(SanPham sanPham : sanPhams) {
            long luotBan = 0;
            SanPhamChiTiet sanPhamChiTietMin = sanPhamChiTietRepository.findBySanPham(sanPham);
            List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietRepository.findSanPhamChiTietBySanPham(sanPham);
            for(SanPhamChiTiet sanPhamChiTiet : sanPhamChiTietList) {
                List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietRepository.findHoaDonChiTietsBySanPhamChiTiet(sanPhamChiTiet);
                for(HoaDonChiTiet hoaDonChiTiet : hoaDonChiTiets) {
                    luotBan += hoaDonChiTiet.getSoLuong();
                }
            }
            if(sanPhamChiTietMin != null){
                SanPhamHomeDto sanPhamHomeDto = SanPhamHomeDto.builder()
                        .ID(sanPham.getID())
                        .tenSanPham(sanPham.getTenSanPham())
                        .giaBan(sanPhamChiTietMin.getGiaBan())
                        .anh(sanPhamChiTietMin.getAnh().getAnh())
                        .luotBan(luotBan)
                        .build();
                sanPhamHomeDtos.add(sanPhamHomeDto);
            }

        }
        return sanPhamHomeDtos;
    }

    @Override
    public List<SanPhamHomeDto> filter(FilterRequest filterRequest) {
        List<SanPham> sanPhams = sanPhamRepository.findAll();
        List<SanPhamHomeDto> sanPhamHomeDtos = new ArrayList<>();
        String searchLowerCase = filterRequest.getKeyword() != null ? filterRequest.getKeyword().toLowerCase() : null;
        for (SanPham sanPham : sanPhams) {
            boolean matchesSearch = (searchLowerCase == null) ||
                    sanPham.getTenSanPham().toLowerCase().contains(searchLowerCase);
            if(matchesSearch){
                SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findBySanPham(sanPham);
                List<SanPhamChiTiet> sanPhamChiTietTT = sanPhamChiTietRepository.findAllByFilter(
                        filterRequest.getIdMauSac(),filterRequest.getIdThuongHieu(),filterRequest.getIdTayAo(),filterRequest.getIdKichCo(),
                        filterRequest.getIdHoaTiet(),filterRequest.getIdDangAo(),filterRequest.getIdChatLieu(),filterRequest.getIdCoAo(),sanPham
                ) ;
                if(sanPhamChiTiet != null && !sanPhamChiTietTT.isEmpty()) {
                    SanPhamHomeDto sanPhamHomeDto = SanPhamHomeDto.builder()
                            .ID(sanPham.getID())
                            .tenSanPham(sanPham.getTenSanPham())
                            .giaBan(sanPhamChiTiet.getGiaBan())
                            .anh(sanPhamChiTiet.getAnh().getAnh())
                            .build();
                    if(!filterRequest.getPriceMin().equals("") && !filterRequest.getPriceMax().equals("")){
                        if(sanPhamHomeDto.getGiaBan() >= Long.parseLong(filterRequest.getPriceMin()) && sanPhamHomeDto.getGiaBan() <= Long.parseLong(filterRequest.getPriceMax())){
                            sanPhamHomeDtos.add(sanPhamHomeDto);
                        }
                    }
                    else sanPhamHomeDtos.add(sanPhamHomeDto);
                }
            }
        }
        if(filterRequest.getSort().equals("0")) {
            sanPhamHomeDtos.sort(Comparator.comparingLong(SanPhamHomeDto::getGiaBan));
        }else if(filterRequest.getSort().equals("1")) {
            sanPhamHomeDtos.sort(Comparator.comparingLong(SanPhamHomeDto::getGiaBan).reversed());
        }
        return sanPhamHomeDtos;
    }

    @Override
    public List<SanPhamHomeDto> getNewProduct() {
        List<SanPham> sanPhams = sanPhamRepository.findAll10();
        List<SanPhamHomeDto> sanPhamHomeDtos = new ArrayList<>();
        for(SanPham sanPham : sanPhams) {
            long luotBan = 0;
            SanPhamChiTiet sanPhamChiTietMin = sanPhamChiTietRepository.findBySanPham(sanPham);
            List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietRepository.findSanPhamChiTietBySanPham(sanPham);
            for(SanPhamChiTiet sanPhamChiTiet : sanPhamChiTietList) {
                List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietRepository.findHoaDonChiTietsBySanPhamChiTiet(sanPhamChiTiet);
                for(HoaDonChiTiet hoaDonChiTiet : hoaDonChiTiets) {
                    luotBan += hoaDonChiTiet.getSoLuong();
                }
            }
            if(sanPhamChiTietMin != null){
                SanPhamHomeDto sanPhamHomeDto = SanPhamHomeDto.builder()
                        .ID(sanPham.getID())
                        .tenSanPham(sanPham.getTenSanPham())
                        .giaBan(sanPhamChiTietMin.getGiaBan())
                        .anh(sanPhamChiTietMin.getAnh().getAnh())
                        .luotBan(luotBan)
                        .build();
                sanPhamHomeDtos.add(sanPhamHomeDto);
            }

        }
        return sanPhamHomeDtos;
    }

    @Override
    public List<SanPhamHomeDto> getHotProduct() {
        List<SanPham> sanPhams = sanPhamRepository.findAll();
        List<SanPhamHomeDto> sanPhamHomeDtos = new ArrayList<>();
        for(SanPham sanPham : sanPhams) {
            long luotBan = 0;
            SanPhamChiTiet sanPhamChiTietMin = sanPhamChiTietRepository.findBySanPham(sanPham);
            List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietRepository.findSanPhamChiTietBySanPham(sanPham);
            for(SanPhamChiTiet sanPhamChiTiet : sanPhamChiTietList) {
                List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietRepository.findHoaDonChiTietsBySanPhamChiTiet(sanPhamChiTiet);
                for(HoaDonChiTiet hoaDonChiTiet : hoaDonChiTiets) {
                    luotBan += hoaDonChiTiet.getSoLuong();
                }
            }
            if(sanPhamChiTietMin != null){
                SanPhamHomeDto sanPhamHomeDto = SanPhamHomeDto.builder()
                        .ID(sanPham.getID())
                        .tenSanPham(sanPham.getTenSanPham())
                        .giaBan(sanPhamChiTietMin.getGiaBan())
                        .anh(sanPhamChiTietMin.getAnh().getAnh())
                        .luotBan(luotBan)
                        .build();
                sanPhamHomeDtos.add(sanPhamHomeDto);
            }

        }
        sanPhamHomeDtos.sort(Comparator.comparingLong(SanPhamHomeDto::getLuotBan).reversed());
        List<SanPhamHomeDto> limit10 = sanPhamHomeDtos.subList(0,Math.min(sanPhamHomeDtos.size(), 9));
        System.out.println(sanPhamHomeDtos);
        return limit10;
    }
}