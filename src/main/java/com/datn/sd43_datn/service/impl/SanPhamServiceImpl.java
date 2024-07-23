package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.SanPhamHomeDto;
import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.repository.SanPhamChiTietRepository;
import com.datn.sd43_datn.repository.SanPhamRepository;
import com.datn.sd43_datn.service.SanPhamService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class SanPhamServiceImpl implements SanPhamService {
    final private SanPhamRepository sanPhamRepository;
    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;

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
    public <S extends SanPham> S save(S entity) {
        return SanphamEntityRepository.save(entity);
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
        for (SanPham sanPham : sanPhams) {
            SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findBySanPham(sanPham);
            if(sanPhamChiTiet != null) {
                SanPhamHomeDto sanPhamHomeDto = SanPhamHomeDto.builder()
                        .ID(sanPham.getID())
                        .tenSanPham(sanPham.getTenSanPham())
                        .giaBan(String.valueOf(sanPhamChiTiet.getGiaBan()))
                        .anh(sanPhamChiTiet.getAnh().getAnh())
                        .build();
                sanPhamHomeDtos.add(sanPhamHomeDto);
            }
        }
        return sanPhamHomeDtos;
    }
}