package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.SanPhamDetailDto;
import com.datn.sd43_datn.dto.ThuocTinhDto;
import com.datn.sd43_datn.entity.SanPham;
import com.datn.sd43_datn.entity.SanPhamChiTiet;
import com.datn.sd43_datn.entity.ThuocTinhSp.*;
import com.datn.sd43_datn.repository.SanPhamChiTietRepository;
import com.datn.sd43_datn.repository.SanPhamRepository;
import com.datn.sd43_datn.repository.ThuocTinhSpRepository.*;
import com.datn.sd43_datn.service.SanPhamChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class SanPhamChiTietServiceImpl implements SanPhamChiTietService {
    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;




    @Autowired
    AnhRepository anhEntityRepository;
    @Autowired
    ChatLieuRepository chatlieuEntityRepository;
    @Autowired
    CoAoRepository CoaoEntityRepository;
    @Autowired
    DangAoRepository dangaoEntityRepository;
    @Autowired
    HoaTietRepository hoatietEntityRepository;
    @Autowired
    KichCoRepository kichcoEntityRepository;
    @Autowired
    MauSacRepository  mausacEntityRepository;
    @Autowired
    SanPhamRepository sanphamEntityRepository;
    @Autowired
    TayAoRepository  tayaoEntityRepository;
    @Autowired
    ThuongHieuRepository thuonghieuEntityRepository;
    @Autowired
    private SanPhamChiTietRepository sanphamchitietEntityRepository;



    @Override
    public List<SanPhamChiTiet> getSanPhamChiTiet() {
        return sanPhamChiTietRepository.findAll();
    }



    @Override
    public List<SanPhamChiTiet> findAllById(Iterable<Long> integers) {
        return sanphamchitietEntityRepository.findAllById(integers);
    }

    @Override
    public <S extends SanPhamChiTiet> S save(S entity) {
        return sanphamchitietEntityRepository.save(entity);
    }

    @Override
    public SanPhamChiTiet findById(Long integer) {
        return sanphamchitietEntityRepository.findById(integer).get();
    }

    @Override
    public void deleteById(Long integer) {
        sanphamchitietEntityRepository.deleteById(integer);

    }

    @Override
    public List<SanPhamChiTiet> findBySanPhamKeyWord(String keyword){
        String searchLowerCase = keyword.toLowerCase();
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietRepository.findAll();
        List<SanPhamChiTiet> dto = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        for (SanPhamChiTiet sanPhamChiTiet : sanPhamChiTietList) {
            if(sanPhamChiTiet.getID().equals(searchLowerCase)||
                    sanPhamChiTiet.getSanPham().getTenSanPham().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getHoaTiet().getTenHoaTiet().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getChatLieu().getTenChatLieu().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getCoAo().getTenLoaiCoAo().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getDangAo().getTenKieuDangAo().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getKichCo().getTenKichCo().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getMauSac().getTenMauSac().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getTayAo().getTenKieuTayAo().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getThuongHieu().getTenThuongHieu().toLowerCase().contains(searchLowerCase) ||
                    sanPhamChiTiet.getGiaBan().equals(searchLowerCase) ||
                    sanPhamChiTiet.getGiaNhap().equals(searchLowerCase) ||
                    sanPhamChiTiet.getSoLuong().equals(searchLowerCase) ||
                    sanPhamChiTiet.getMoTa().toLowerCase().contains(searchLowerCase)
            ){

                dto.add(sanPhamChiTiet);
            }
        }
        dto.sort(Comparator.comparingLong(SanPhamChiTiet::getID).reversed());
        return dto;
    }
    @Override
    public Page<SanPhamChiTiet> sanphamchitietEntityPage(String keyword, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        if (keyword != null) {
            return sanphamchitietEntityRepository.pageSpct(pageable, keyword);
        }
        return sanphamchitietEntityRepository.findAll(pageable);
    }
    @Override
    public List<Anh> findAnhCreateAt(){
        return anhEntityRepository.getAnhCreateAt();
    }
    @Override
    public List<ChatLieu> findChatLieuCreateAt(){
        return chatlieuEntityRepository.getCreateAt();
    }
    @Override
    public List<CoAo> findCoAoCreateAt(){
        return CoaoEntityRepository.getCreateAt();
    }
    @Override
    public List<DangAo> findDangAoCreateAt(){
        return dangaoEntityRepository.getCreateAt();
    }
    @Override
    public List<HoaTiet> findHoaTietCreateAt(){
        return hoatietEntityRepository.getCreateAt();
    }  @Override
    public List<KichCo> findKichCoCreateAt(){
        return kichcoEntityRepository.getCreateAt();

    }
    @Override
    public List<MauSac> findMauSacCreateAt(){
        return mausacEntityRepository.getCreateAt();

    }
    @Override
    public List<SanPham> findSanPhamCreateAt(){
        return sanphamEntityRepository.getCreateAt();
    }
    @Override
    public List<TayAo> findTayAoCreateAt(){
        return tayaoEntityRepository.getCreateAt();

    }
    @Override
    public List<ThuongHieu> findThuongHieuCreateAt(){
        return thuonghieuEntityRepository.getCreateAt();

    }

    @Override
    public void findTrangThai1(Long id){
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(id).get();
        if(sanPhamChiTiet.getTrangThai() == 0){
            sanPhamChiTiet.setTrangThai(1);
            sanPhamChiTietRepository.save(sanPhamChiTiet);
        }else {
            sanPhamChiTiet.setTrangThai(0);
            sanPhamChiTietRepository.save(sanPhamChiTiet);
        }
    }
    @Override
    public void findTrangThai0(Long id){
        sanphamchitietEntityRepository.updateTrangThai0(id);
    }

    @Override
    public List<SanPhamChiTiet> getBySanPham(SanPham sanPham) {
        return sanPhamChiTietRepository.findSanPhamChiTietBySanPham(sanPham);
    }

    @Override
    public SanPhamDetailDto getListThuocTinhs(SanPham sanPham) {
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietRepository.findSanPhamChiTietBySanPham(sanPham);
        List<SanPhamDetailDto> sanPhamDetailDtoList = new ArrayList<>();
        List<Anh> anh = new ArrayList<>();
        List<MauSac> mauSac = new ArrayList<>();
        List<ChatLieu> chatLieu = new ArrayList<>();
        List<ThuongHieu> thuongHieu = new ArrayList<>();
        List<KichCo> kichCo = new ArrayList<>();
        List<DangAo> dangAo = new ArrayList<>();
        List<CoAo> coAo = new ArrayList<>();
        List<TayAo> tayAo = new ArrayList<>();
        List<HoaTiet> hoaTiet = new ArrayList<>();
        for(SanPhamChiTiet sanPhamChiTiet : sanPhamChiTietList){
            boolean check = true;
            Anh ttAnh = Anh.builder()
                    .ID(sanPhamChiTiet.getAnh().getID())
                    .anh(sanPhamChiTiet.getAnh().getAnh())
                    .build();
            if(anh.isEmpty()){
                anh.add(ttAnh);
            }else {
                check = true;
                for(Anh anh1 : anh){
                    if(anh1.getID() == ttAnh.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) anh.add(ttAnh);
            }
            MauSac ttMauSac = MauSac.builder()
                    .ID(sanPhamChiTiet.getMauSac().getID())
                    .tenMauSac(sanPhamChiTiet.getMauSac().getTenMauSac())
                    .build();
            if(mauSac.isEmpty()){
                mauSac.add(ttMauSac);
            }else {
                check = true;
                for(MauSac mauSac1 : mauSac){
                    if(mauSac1.getID() == ttMauSac.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) mauSac.add(ttMauSac);
            }

            ChatLieu ttChatLieu = ChatLieu.builder()
                    .ID(sanPhamChiTiet.getChatLieu().getID())
                    .tenChatLieu(sanPhamChiTiet.getChatLieu().getTenChatLieu())
                    .build();
            if(chatLieu.isEmpty()){
                chatLieu.add(ttChatLieu);
            }else {
                check = true;
                for(ChatLieu chatLieu1 : chatLieu){
                    if(chatLieu1.getID() == ttChatLieu.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) chatLieu.add(ttChatLieu);
            }
            ThuongHieu ttThuongHieu = ThuongHieu.builder()
                    .ID(sanPhamChiTiet.getThuongHieu().getID())
                    .tenThuongHieu(sanPhamChiTiet.getThuongHieu().getTenThuongHieu())
                    .build();
            if(thuongHieu.isEmpty()){
                thuongHieu.add(ttThuongHieu);
            }else {
                check = true;
                for(ThuongHieu thuongHieu1 : thuongHieu){
                    if(thuongHieu1.getID() == ttThuongHieu.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) thuongHieu.add(ttThuongHieu);
            }
            KichCo ttKichCo = KichCo.builder()
                    .ID(sanPhamChiTiet.getKichCo().getID())
                    .tenKichCo(sanPhamChiTiet.getKichCo().getTenKichCo())
                    .build();

            if(kichCo.isEmpty()){
                kichCo.add(ttKichCo);
            }else {
                check = true;
                for(KichCo kichCo1 : kichCo){
                    if(kichCo1.getID() == ttKichCo.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) kichCo.add(ttKichCo);
            }
            DangAo ttDangAo = DangAo.builder()
                    .ID(sanPhamChiTiet.getDangAo().getID())
                    .tenKieuDangAo(sanPhamChiTiet.getDangAo().getTenKieuDangAo())
                    .build();
            if(dangAo.isEmpty()){
                dangAo.add(ttDangAo);
            }else {
                check = true;
                for(DangAo dangAo1 : dangAo){
                    if(dangAo1.getID() == ttDangAo.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) dangAo.add(ttDangAo);
            }
            CoAo ttCoAo = CoAo.builder()
                    .ID(sanPhamChiTiet.getCoAo().getID())
                    .tenLoaiCoAo(sanPhamChiTiet.getCoAo().getTenLoaiCoAo())
                    .build();
            if(coAo.isEmpty()){
                coAo.add(ttCoAo);
            }else {
                check = true;
                for(CoAo coAo1 : coAo){
                    if(coAo1.getID() == ttCoAo.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) coAo.add(ttCoAo);
            }
            TayAo ttTayAo = TayAo.builder()
                    .ID(sanPhamChiTiet.getTayAo().getID())
                    .tenKieuTayAo(sanPhamChiTiet.getTayAo().getTenKieuTayAo())
                    .build();

            if(tayAo.isEmpty()){
                tayAo.add(ttTayAo);
            }else {
                check = true;
                for(TayAo tayAo1 : tayAo){
                    if(tayAo1.getID() == ttTayAo.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) tayAo.add(ttTayAo);
            }
            HoaTiet ttHoaTiet = HoaTiet.builder()
                    .ID(sanPhamChiTiet.getHoaTiet().getID())
                    .tenHoaTiet(sanPhamChiTiet.getHoaTiet().getTenHoaTiet())
                    .build();

            if(hoaTiet.isEmpty()){
                hoaTiet.add(ttHoaTiet);
            }else {
                check = true;
                for(HoaTiet hoaTiet1 : hoaTiet){
                    if(hoaTiet1.getID() == ttHoaTiet.getID()){
                        check = false;
                        break;
                    }
                }
                if (check) hoaTiet.add(ttHoaTiet);
            }
        }
        SanPhamDetailDto sanPhamDetail = SanPhamDetailDto.builder()
                .anh(anh)
                .mauSac(mauSac)
                .chatLieu(chatLieu)
                .thuongHieu(thuongHieu)
                .kichCo(kichCo)
                .dangAo(dangAo)
                .coAo(coAo)
                .tayAo(tayAo)
                .hoaTiet(hoaTiet)
                .build();
        return sanPhamDetail;
    }
}