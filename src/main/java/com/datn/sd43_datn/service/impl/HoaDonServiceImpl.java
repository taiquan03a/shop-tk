package com.datn.sd43_datn.service.impl;

import com.datn.sd43_datn.dto.HoaDonChiTietDto;
import com.datn.sd43_datn.dto.TimeLineDto;
import com.datn.sd43_datn.entity.*;
import com.datn.sd43_datn.entity.KHang.DiaChi;
import com.datn.sd43_datn.repository.*;
import com.datn.sd43_datn.request.*;
import com.datn.sd43_datn.service.HoaDonService;
import com.datn.sd43_datn.service.MailService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Service
@AllArgsConstructor
public class HoaDonServiceImpl implements HoaDonService {
    final private HoaDonRepository hoaDonRepository;
    final private HoaDonChiTietRepository hoaDonChiTietRepository;
    final private TrangThaiDonHangRepository trangThaiDonRepository;
    final private NhanVienRepository nhanVienRepository;
    final private KhachHangRepository khachHangRepository;
    private final SanPhamChiTietRepository sanPhamChiTietRepository;
    final private LichSuThanhToanRepository lichSuThanhToanRepository;
    private final DiaChiRepository diaChiRepository;
    final private MailService mailService;

    @Override
    public List<HoaDonRequest> getHoaDonRequests() {
        List<HoaDon> hoaDons = hoaDonRepository.findAll();
        List<HoaDonRequest> hoaDonRequests = new ArrayList<>();
        SimpleDateFormat formattedDate = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        for(HoaDon hoaDon : hoaDons){
            long tongSl = 0,tongTien = 0;
            for(HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon)){
                tongSl += hoaDonChiTiet.getSoLuong();

            }
            tongTien = hoaDon.getThanhTien();
            String ngayTao = formattedDate.format(hoaDon.getNgayTao());
            HoaDonRequest hoaDonRequest = HoaDonRequest.builder()
                    .ID(hoaDon.getID())
                    .maHoaDon(hoaDon.getMaHoaDon())
                    .tenKH(hoaDon.getKhachHang().getTenKhachHang())
                    .tongSp(tongSl)
                    .tongTien(tongTien)
                    .ngayTao(ngayTao)
                    .loaiHoaDon(hoaDon.getLoaiHoaDon())
                    .trangThaiDon(hoaDon.getTrangThaiDon().getTenTrangThai())
                    .build();
            hoaDonRequests.add(hoaDonRequest);
        }
        hoaDonRequests.sort(Comparator.comparingLong(HoaDonRequest::getID).reversed());
        return hoaDonRequests;
    }

    @Override
    public HoaDonChiTietDto getHoaDonDetail(long hoaDonId) {
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonId).get();

        String tenGiamGia = "Không sử dụng";
        float giaTriGiamGia = 0;

//        List<TrangThaiHoaDon> trangThaiDonList = new ArrayList<>();
        List<TimeLineDto> timeLineDTOList = new ArrayList<>();
        long idTrangThai = hoaDon.getTrangThaiDon().getID();

        List<String> idTrangThaiList = List.of(hoaDon.getIdStatus().split(","));
        List<String> timeList = List.of(hoaDon.getThoiGianDonHang().split(","));
        int index = 0;
        for(String id : idTrangThaiList){
            TrangThaiHoaDon trangThaiDon = trangThaiDonRepository.findById(Long.parseLong(id)).get();
//            trangThaiDonList.add(trangThaiDon);
            String time = timeList.get(index);
            TimeLineDto timeLineDTO = TimeLineDto.builder()
                    .time(time)
                    .trangThaiDon(trangThaiDon)
                    .build();
            index++;
            timeLineDTOList.add(timeLineDTO);
        }
        SimpleDateFormat formattedDate = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        String ngayTao = formattedDate.format(hoaDon.getNgayTao());
        String[] diaChi = {"", ""};
        if(hoaDon.getDiaCHiGiaoHang() != null){
            String[] DCSplit = hoaDon.getDiaCHiGiaoHang().split(" ");
            for(int i = 0 ; i < DCSplit.length - 1; i++){
                diaChi[0] += DCSplit[i] + " ";
            }
            diaChi[1] = DCSplit[DCSplit.length - 1];
        }

        HoaDonChiTietDto hoaDonDetailDTO = HoaDonChiTietDto.builder()
                .id(hoaDonId)
                .maHoaDon(hoaDon.getMaHoaDon())
                .tenKH(hoaDon.getKhachHang().getTenKhachHang())
                .sdt(hoaDon.getSdtNguoiNhan())
                .tenNguoiNhan(hoaDon.getNguoiThanhToan())
                .trangThai(hoaDon.getTrangThaiDon().getTenTrangThai())
//                .trangThaiDonList(trangThaiDonList)
                .timeLineDTOList(timeLineDTOList)
                .trangThaiDon(trangThaiDonRepository.findById(idTrangThai).get())
                .hoaDonChiTietList(hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon))
                .ngayTao(ngayTao)
                .nhanVien(hoaDon.getNguoiTao())
                .hinhThucThanhToan(hoaDon.getHinhThucThanhToan())
                .loaiHoaDon(hoaDon.getLoaiHoaDon())
                .tenGiamGia(tenGiamGia)
                .giaTriGiamGia(giaTriGiamGia)
                .giamGia(String.valueOf(hoaDon.getTienGiamGia()))
                .tongTienHang(String.valueOf(hoaDon.getTongTienDonHang()))
                .phiVanChuyen(String.valueOf(hoaDon.getPhiVanChuyen()))
                .tongTien(String.valueOf(hoaDon.getThanhTien()))
                .lichSuThanhToanList(lichSuThanhToanRepository.findLichSuThanhToansByHoaDon(hoaDon))
                .soNha(diaChi[0])
                .idPhuong(diaChi[1])
                .build();
        return hoaDonDetailDTO;
    }
    @Override
    public HoaDonChiTietDto updateTrangThai(long hoaDonId,String detailAddress) {
        SimpleDateFormat formattedDate = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonId).get();
        List<TrangThaiHoaDon> trangThaiDonList = new ArrayList<>();
        List<TimeLineDto> timeLineDTOList = new ArrayList<>();
        long idTrangThai = hoaDon.getTrangThaiDon().getID();
        String status = hoaDon.getIdStatus();
        String statusCheck = status;
        String timeLine = hoaDon.getThoiGianDonHang();
        Date now = new Date();
        String dateString = formattedDate.format(now);
        if(idTrangThai != 5 && idTrangThai != 6 && idTrangThai != 7) {
            idTrangThai += 1;
            status = status + "," + String.valueOf(idTrangThai);
            timeLine = timeLine + "," + dateString;
        }
        List<String> idTrangThaiList = List.of(status.split(","));
        List<String> timeLineList = List.of(timeLine.split(","));
        int index = 0;
        for(String id : idTrangThaiList){
            TrangThaiHoaDon trangThaiDon = trangThaiDonRepository.findById(Long.parseLong(id)).get();
            String time = timeLineList.get(0);
            TimeLineDto timeLineDTO = TimeLineDto.builder()
                    .time(timeLineList.get(index))
                    .trangThaiDon(trangThaiDon)
                    .build();
            index++;
            timeLineDTOList.add(timeLineDTO);
            //trangThaiDonList.add(trangThaiDon);
        }
        hoaDon.setTrangThaiDon(trangThaiDonRepository.findById(idTrangThai).get());
        hoaDon.setIdStatus(status);
        hoaDon.setThoiGianDonHang(timeLine);
        hoaDonRepository.save(hoaDon);
        String tenGiamGia = "Không sử dụng";
        float giaTriGiamGia = 0;

        String ngayTao = formattedDate.format(hoaDon.getNgayTao());

        List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon);
        HoaDonChiTietDto hoaDonDetailDTO = HoaDonChiTietDto.builder()
                .id(hoaDonId)
                .maHoaDon(hoaDon.getMaHoaDon())
                .tenKH(hoaDon.getKhachHang().getTenKhachHang())
                .sdt(hoaDon.getSdtNguoiNhan())
                .timeLineDTOList(timeLineDTOList)
                .tenNguoiNhan(hoaDon.getNguoiThanhToan())
                .trangThai(hoaDon.getTrangThaiDon().getTenTrangThai())
                .trangThaiDonList(trangThaiDonList)
                .trangThaiDon(trangThaiDonRepository.findById(idTrangThai).get())
                .hoaDonChiTietList(hoaDonChiTietList)
                .ngayTao(ngayTao)
                .nhanVien(hoaDon.getNguoiTao())
                .tenGiamGia(tenGiamGia)
                .giaTriGiamGia(giaTriGiamGia)
                .giamGia(String.valueOf(hoaDon.getTienGiamGia()))
                .tongTienHang(String.valueOf(hoaDon.getTongTienDonHang()))
                .phiVanChuyen(String.valueOf(hoaDon.getPhiVanChuyen()))
                .tongTien(String.valueOf(hoaDon.getThanhTien()))
                .build();

        if(!statusCheck.equals(status)){
            String title = "Đơn hàng đã được cập nhật trạng thái!!!!";
            String userEmail = hoaDon.getKhachHang().getEmail();
            Context context = new Context();
            context.setVariable("userEmail", userEmail);
            context.setVariable("userName", hoaDon.getKhachHang().getTenKhachHang());
            context.setVariable("orders", hoaDon);
            context.setVariable("orderItems", hoaDonChiTietList);
            context.setVariable("orderDate", hoaDon.getNgayTao());
            context.setVariable("address",detailAddress);
            mailService.sendEmailWithHtmlTemplate(userEmail, title, "confirm-order", context);
        }

        return hoaDonDetailDTO;

    }

    @Override
    public HoaDonChiTietDto huyTrangThai(long hoaDonId,String detailAddress) {
        Date hienTai = new Date();

        NhanVien nhanVien = nhanVienRepository.findById(1L).get();
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonId).get();
//        List<TrangThaiHoaDon> trangThaiDonList = new ArrayList<>();

        List<TimeLineDto> timeLineDTOList = new ArrayList<>();
        String timeLine = hoaDon.getThoiGianDonHang();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        String formattedDate = sdf.format(hienTai);

        long idTrangThai = hoaDon.getTrangThaiDon().getID();
        String status = hoaDon.getIdStatus();
        String statusCheck = status;

        if (idTrangThai != 4 && idTrangThai != 5 && idTrangThai != 6 && idTrangThai != 7) {
            idTrangThai = 6;
            status = status + "," + String.valueOf(idTrangThai);
            timeLine = timeLine + "," + formattedDate;
        } else if (idTrangThai == 5 && idTrangThai != 6 && idTrangThai != 7) {
            idTrangThai = 7;
            status = status + "," + String.valueOf(idTrangThai);
            timeLine = timeLine + "," + formattedDate;
        }

        List<String> idTrangThaiList = List.of(status.split(","));
        List<String> timeLineList = List.of(timeLine.split(","));
        int index = 0;

        for (String id : idTrangThaiList) {
            TrangThaiHoaDon trangThaiDon = trangThaiDonRepository.findById(Long.parseLong(id)).get();
//            trangThaiDonList.add(trangThaiDon);
            String time = timeLineList.get(0);
            TimeLineDto timeLineDTO = TimeLineDto.builder()
                    .time(timeLineList.get(index))
                    .trangThaiDon(trangThaiDon)
                    .build();
            index++;
            timeLineDTOList.add(timeLineDTO);
        }
        List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon);
        if(idTrangThai == 6 || idTrangThai == 7){
            for(HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietList){
                SanPhamChiTiet sanPhamChiTiet = hoaDonChiTiet.getSanPhamChiTiet();
                long current = sanPhamChiTiet.getSoLuong();
                sanPhamChiTiet.setSoLuong(current + hoaDonChiTiet.getSoLuong());
                sanPhamChiTietRepository.save(sanPhamChiTiet);
            }
        }

        hoaDon.setTrangThaiDon(trangThaiDonRepository.findById(idTrangThai).get());
        hoaDon.setIdStatus(status);
        hoaDon.setThoiGianDonHang(timeLine);
        hoaDonRepository.save(hoaDon);
        String tenGiamGia = "Không sử dụng";
        float giaTriGiamGia = 0;


//        String thayDoi;
//        if (idTrangThai == 6) {
//            thayDoi = "Đơn hàng hủy";
//        } else if (idTrangThai == 7) {
//            thayDoi = "Hoàn trả";
//        } else {
//            thayDoi = "Bị lỗi";
//        }
//        LichSuThanhToan lichSuThanhToan = LichSuThanhToan.builder()
//                .hoaDon(hoaDon)
//                .ngayTao(new Date())
//                .nguoiCapNhat(nhanVien.getHoTen())
//                .nhungThayDoi(thayDoi)
//                .ghiChu("Thay đổi trạng thái sang " + thayDoi)
//                .build();
//        lichSuThanhToanRepository.save(lichSuThanhToan);

        String ngayTao = sdf.format(hoaDon.getNgayTao());
        HoaDonChiTietDto hoaDonDetailDTO = HoaDonChiTietDto.builder()
                .id(hoaDonId)
                .maHoaDon(hoaDon.getMaHoaDon())
                .tenKH(hoaDon.getKhachHang().getTenKhachHang())
                .sdt(hoaDon.getSdtNguoiNhan())
                .tenNguoiNhan(hoaDon.getNguoiThanhToan())
                .trangThai(hoaDon.getTrangThaiDon().getTenTrangThai())
//                .trangThaiDonList(trangThaiDonList)
                .timeLineDTOList(timeLineDTOList)
                .trangThaiDon(trangThaiDonRepository.findById(idTrangThai).get())
                .hoaDonChiTietList(hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon))
                .ngayTao(ngayTao)
                .nhanVien(hoaDon.getNguoiTao())
                .hinhThucThanhToan(hoaDon.getHinhThucThanhToan())
                .loaiHoaDon(hoaDon.getLoaiHoaDon())
                .tenGiamGia(tenGiamGia)
                .giaTriGiamGia(giaTriGiamGia)
                .giamGia(String.valueOf(hoaDon.getTienGiamGia()))
                .tongTienHang(String.valueOf(hoaDon.getTongTienDonHang()))
                .phiVanChuyen(String.valueOf(hoaDon.getPhiVanChuyen()))
                .tongTien(String.valueOf(hoaDon.getThanhTien()))
                .lichSuThanhToanList(lichSuThanhToanRepository.findLichSuThanhToansByHoaDon(hoaDon))
                .build();
        if(!status.equals(statusCheck)){
            String title = "Đơn hàng đã được cập nhật trạng thái!!!!";
            String userEmail = hoaDon.getKhachHang().getEmail();
            Context context = new Context();
            context.setVariable("userEmail", userEmail);
            context.setVariable("userName", hoaDon.getKhachHang().getTenKhachHang());
            context.setVariable("orders", hoaDon);
            context.setVariable("orderItems", hoaDonChiTietList);
            context.setVariable("orderDate", hoaDon.getNgayTao());
            context.setVariable("address",detailAddress);
            mailService.sendEmailWithHtmlTemplate(userEmail, title, "confirm-order", context);
        }
        return hoaDonDetailDTO;
    }

    @Override
    public List<HoaDonRequest> filterHoaDonRequest(String search, String status, String batDau, String ketThuc) throws ParseException {
        List<HoaDon> hoaDons = hoaDonRepository.findAll();
        List<HoaDonRequest> hoaDonRequests = new ArrayList<>();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date bd = null, kt = null;

        if (!batDau.isEmpty() && !ketThuc.isEmpty()) {
            bd = formatter.parse(batDau);
            kt = formatter.parse(ketThuc);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        String searchLowerCase = search != null ? search.toLowerCase() : null;
        Long statusLong = status != null ? Long.valueOf(status) : null;

        for (HoaDon hoaDon : hoaDons) {
            boolean matchesSearch = (searchLowerCase == null) ||
                    hoaDon.getMaHoaDon().toLowerCase().contains(searchLowerCase) ||
                    hoaDon.getKhachHang().getTenKhachHang().toLowerCase().contains(searchLowerCase) ||
                    hoaDon.getTrangThaiDon().getTenTrangThai().toLowerCase().contains(searchLowerCase);

            boolean matchesStatus = (statusLong == null || statusLong == 0) ||
                    hoaDon.getTrangThaiDon().getID().equals(statusLong);

            boolean matchesDate = (bd == null || kt == null) ||
                    (hoaDon.getNgayTao().after(bd) && hoaDon.getNgayTao().before(kt));

            if (matchesSearch && matchesStatus && matchesDate) {
                long tongSl = 0, tongTien = 0;
                for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon)) {
                    tongSl += hoaDonChiTiet.getSoLuong();
                    tongTien += hoaDonChiTiet.getThanhTien();
                }

                HoaDonRequest hoaDonRequest = HoaDonRequest.builder()
                        .ID(hoaDon.getID())
                        .maHoaDon(hoaDon.getMaHoaDon())
                        .tenKH(hoaDon.getKhachHang().getTenKhachHang())
                        .tongSp(tongSl)
                        .tongTien(tongTien)
                        .ngayTao(sdf.format(hoaDon.getNgayTao()))
                        .trangThaiDon(hoaDon.getTrangThaiDon().getTenTrangThai())
                        .loaiHoaDon(hoaDon.getLoaiHoaDon())
                        .build();
                hoaDonRequests.add(hoaDonRequest);
            }
        }

        hoaDonRequests.sort(Comparator.comparingLong(HoaDonRequest::getID).reversed());
        return hoaDonRequests;
    }


    @Override
    public boolean addHoaDon(TaoDonHangRequest createDonHangRequest) {
        Date ngayHienTai = new Date();
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        NhanVien nhanVien = nhanVienRepository.findNhanVienByEmail(email);
        KhachHang khachHang = KhachHang.builder()
                .tenKhachHang(createDonHangRequest.getName())
                .kieuKhachHang(false)
                .sdt(createDonHangRequest.getPhone())
                .ngayTao(ngayHienTai)
                .trangThai(true)
                .build();
        khachHangRepository.save(khachHang);

        List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
        String strippedInput = createDonHangRequest.getList_product().substring
                (1, createDonHangRequest.getList_product().length() - 1);
        String[] pairs = strippedInput.split(",");
        for (String pair : pairs) {
            pair = pair.replace("\"", "");
            String[] numbers = pair.split(":");
            String id = numbers[0];
            String sl = numbers[1];

            SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(Long.valueOf(id)).get();
            HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                    .sanPhamChiTiet(sanPhamChiTiet)
                    .soLuong(Long.valueOf(sl))
                    .donGia(sanPhamChiTiet.getGiaBan())
                    .thanhTien(Long.parseLong(sl) * sanPhamChiTiet.getGiaBan())
                    .trangThai(true)
                    .build();
            hoaDonChiTietList.add(hoaDonChiTiet);

            sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - Long.parseLong(sl));
            sanPhamChiTietRepository.save(sanPhamChiTiet);
        }

        long tongTienDonHang = 0;
        long tienGiamGia = 0, thanhTien = 0;
        for (HoaDonChiTiet hd : hoaDonChiTietList) {
            tongTienDonHang += hd.getThanhTien();
        }

        thanhTien = tongTienDonHang - tienGiamGia;
        String hinhThuc = "";
        if (createDonHangRequest.getType().equals("2")) {
            hinhThuc = "Chuyển khoản";
        } else {
            hinhThuc = "Tiền mặt";
        }

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        String formattedDate = sdf.format(ngayHienTai);

        TrangThaiHoaDon trangThaiDon = trangThaiDonRepository.findById(5L).get();
        HoaDon hoaDon = HoaDon.builder()
                .khachHang(khachHang)
                .nhanVien(nhanVien)
                .ngayTao(ngayHienTai)
                .nguoiTao(nhanVien.getHoTen())
                .tongTienDonHang(tongTienDonHang)
                .tienGiamGia(tienGiamGia)
                .thanhTien((thanhTien))
                .hinhThucThanhToan(hinhThuc)
                .loaiHoaDon(true)
                .phiVanChuyen(0L)
                .diaCHiGiaoHang(null)
                .thoiGianGiaoHang(null)
                .sdtNguoiNhan(khachHang.getSdt())
                .nhanVien(nhanVien)
                .trangThaiDon(trangThaiDon)
                .idStatus("1,5")
                .thoiGianDonHang(formattedDate + "," + formattedDate)
                .build();
        hoaDonRepository.save(hoaDon);

        if (hoaDon.getID() < 1000) {
            if (hoaDon.getID() < 10) {
                hoaDon.setMaHoaDon("HD00" + String.valueOf(hoaDon.getID()));
            } else if (hoaDon.getID() < 100) {
                hoaDon.setMaHoaDon("HD0" + String.valueOf(hoaDon.getID()));
            }
        } else {
            hoaDon.setMaHoaDon("HD" + String.valueOf(hoaDon.getID()));
        }

        for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietList) {
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTietRepository.save(hoaDonChiTiet);
        }

        LichSuThanhToan lichSuThanhToan = LichSuThanhToan.builder()
                .hoaDon(hoaDon)
                .ngayTao(ngayHienTai)
                .nguoiCapNhat(nhanVien.getHoTen())
                .nhungThayDoi(trangThaiDon.getTenTrangThai())
                .ghiChu("Bán hàng tại quầy")
                .build();
        lichSuThanhToanRepository.save(lichSuThanhToan);
        return true;
    }

    @Override
    public boolean updateKH(long hoaDonID, UpdateInfoKH updateInfoKH) {
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonID).get();
        KhachHang khachHang = hoaDon.getKhachHang();
        khachHang.setTenKhachHang(updateInfoKH.getTen());
        hoaDon.setKhachHang(khachHang);
        hoaDon.setDiaCHiGiaoHang(updateInfoKH.getSoNha() + " " + updateInfoKH.getIdPhuong());
        hoaDon.setSdtNguoiNhan(updateInfoKH.getSdt());
        khachHangRepository.save(khachHang);
        hoaDonRepository.save(hoaDon);
        return true;
    }

    @Override
    public boolean updateHoaDon(UpdateDonHangRequest updateDonHangRequest, long hoaDonId) {
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonId).get();
        System.out.println("hihi");

        //hoaDonChiTietRepository.deleteAll(hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon));

        List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
        String strippedInput = updateDonHangRequest.getList_product().substring(1, updateDonHangRequest.getList_product().length() - 1);
        String[] pairs = strippedInput.split(",");
        List<Long> listID = new ArrayList<>();
        for (String pair : pairs) {
            pair = pair.replace("\"", "");
            String[] numbers = pair.split(":");
            String id = numbers[0];
            listID.add(Long.parseLong(id));
            String sl = numbers[1];
            SanPhamChiTiet  sanPhamChiTiet = sanPhamChiTietRepository.findById(Long.valueOf(id)).get();
            HoaDonChiTiet hoaDonCurrent = hoaDonChiTietRepository.findHoaDonChiTietBySanPhamChiTietAndAndHoaDon(sanPhamChiTiet,hoaDon);
            if(hoaDonCurrent != null){
                if(hoaDonCurrent.getSoLuong() != Long.parseLong(sl)){
                    hoaDonCurrent.setSoLuong(Long.parseLong(sl));
                    hoaDonCurrent.setDonGia(sanPhamChiTiet.getGiaBan());
                    hoaDonCurrent.setThanhTien(sanPhamChiTiet.getGiaBan() * Long.parseLong(sl));
                }
                hoaDonChiTietList.add(hoaDonCurrent);
            }else {
                HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                        .hoaDon(hoaDon)
                        .sanPhamChiTiet(sanPhamChiTiet)
                        .soLuong(Long.valueOf(sl))
                        .donGia(sanPhamChiTiet.getGiaBan())
                        .thanhTien(Long.parseLong(sl) * sanPhamChiTiet.getGiaBan())
                        .trangThai(true)
                        .build();
                hoaDonChiTietRepository.save(hoaDonChiTiet);
                hoaDonChiTietList.add(hoaDonChiTiet);
            }
        }
        List<HoaDonChiTiet> hoaDonDB = hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon);
        for (HoaDonChiTiet it : hoaDonDB){
            long idSP = it.getSanPhamChiTiet().getID();
            if (!listID.contains(idSP)){
                hoaDonChiTietRepository.delete(it);
            }
        }
        long tongTienDonHang = 0,giamGiaNguyen = 0,thanhTien = 0;
        float tienGiamGia = 0;
        for(HoaDonChiTiet hd : hoaDonChiTietList){
            tongTienDonHang += hd.getThanhTien();
        }
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        NhanVien nhanVien = nhanVienRepository.findNhanVienByEmail(email);
        //thanhTien = tongTienDonHang - giamGiaNguyen;
        thanhTien = tongTienDonHang - giamGiaNguyen + hoaDon.getPhiVanChuyen();
        hoaDon.setTongTienDonHang((tongTienDonHang));
        hoaDon.setTienGiamGia(giamGiaNguyen);
        hoaDon.setThanhTien(thanhTien);
        hoaDon.setNgayCapNhat(new Date(System.currentTimeMillis()));
        hoaDon.setNguoiCapNhat(nhanVien.getHoTen());
        hoaDonRepository.save(hoaDon);
        return true;
    }


    @Override
    public boolean checkout(KhachHang khachHang, CheckoutRequest checkoutRequest) {
        List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
        String strippedInput = checkoutRequest.getSpct().substring
                (0, checkoutRequest.getSpct().length() - 1);
        String[] pairs = strippedInput.split(",");
        for (String pair : pairs) {
            //pair = pair.replace("\"", "");
            String[] numbers = pair.split(":");
            String id = numbers[0];
            String sl = numbers[1];
            SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(Long.valueOf(id)).get();
            HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                    .sanPhamChiTiet(sanPhamChiTiet)
                    .soLuong(Long.valueOf(sl))
                    .donGia(Long.valueOf(sanPhamChiTiet.getGiaBan()))
                    .thanhTien(Long.valueOf(sl) * Long.valueOf(sanPhamChiTiet.getGiaBan()))
                    .trangThai(true)
                    .build();
            hoaDonChiTietList.add(hoaDonChiTiet);
            sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - Long.valueOf(sl));
            sanPhamChiTietRepository.save(sanPhamChiTiet);
        }
        long tongTienDonHang = 0, tienShip = 15000, thanhTien = 0;
        for (HoaDonChiTiet hd : hoaDonChiTietList) {
            tongTienDonHang += hd.getThanhTien();
        }

        thanhTien = tongTienDonHang + tienShip;
        Date ngayHienTai = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        String formattedDate = sdf.format(ngayHienTai);
        TrangThaiHoaDon trangThaiDon = trangThaiDonRepository.findById(1L).get();
        KhachHang khachHangCheck = new KhachHang();
        DiaChi diaChi = new DiaChi();
        if(khachHang != null){
            khachHangCheck = khachHang;
            long idDc = Long.valueOf(checkoutRequest.getIdDiaChi().split(" ")[0]);
            if(idDc != 0) diaChi = diaChiRepository.findById(idDc).get();
            else {
                diaChi.setKhachHang(khachHangCheck);
                diaChi.setTrangThai("true");
                diaChi.setIdPhuong(checkoutRequest.getIdPhuong());
                diaChi.setSoNha(checkoutRequest.getSoNha());
                diaChiRepository.save(diaChi);
            }
        }else {
            khachHangCheck.setKieuKhachHang(true);
            //khachHangCheck.setEmail(checkoutRequest.getEmail());
            khachHangCheck.setNgayTao(new Date(System.currentTimeMillis()));
            khachHangCheck.setGioiTinh(true);
            khachHangCheck.setTenKhachHang("Ẩn danh");
            diaChi.setGhiChu("địa chỉ của khách hàng ẩn danh");
            khachHangCheck.setSdt(checkoutRequest.getSdt());
            khachHangCheck.setEmail(checkoutRequest.getEmail());
            khachHangRepository.save(khachHangCheck);
            diaChi.setKhachHang(khachHangCheck);
            diaChi.setKhachHang(khachHangCheck);
            diaChi.setTrangThai("true");
            diaChi.setIdPhuong(checkoutRequest.getIdPhuong());
            diaChi.setSoNha(checkoutRequest.getSoNha());
            diaChiRepository.save(diaChi);
        }
        HoaDon hoaDon = HoaDon.builder()
                .khachHang(khachHangCheck)
                .ngayTao(ngayHienTai)
                .nguoiTao(null)
                .nguoiThanhToan(checkoutRequest.getTenKhachHang())
                .tongTienDonHang(tongTienDonHang)
                .tienGiamGia(0L)
                .thanhTien(thanhTien)
                .hinhThucThanhToan("Thanh toán khi nhận được hàng")
                .loaiHoaDon(false)
                .phiVanChuyen(tienShip)
                .diaCHiGiaoHang(null)
                .thoiGianGiaoHang(null)
                .diaCHiGiaoHang(diaChi.getSoNha() + " " + diaChi.getIdPhuong())
                .sdtNguoiNhan(khachHangCheck.getSdt())
                .nhanVien(null)
                .trangThaiDon(trangThaiDon)
                .idStatus("1")
                .thoiGianDonHang(formattedDate)
                .build();
        hoaDonRepository.save(hoaDon);

        if (hoaDon.getID() < 1000) {
            if (hoaDon.getID() < 10) {
                hoaDon.setMaHoaDon("HD00" + String.valueOf(hoaDon.getID()));
            } else if (hoaDon.getID() < 100) {
                hoaDon.setMaHoaDon("HD0" + String.valueOf(hoaDon.getID()));
            }
        } else {
            hoaDon.setMaHoaDon("HD" + String.valueOf(hoaDon.getID()));
        }

        for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietList) {
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTietRepository.save(hoaDonChiTiet);
        }
        String title = "Đặt hàng thành công!";
        String userEmail = khachHangCheck.getEmail();
        Context context = new Context();
        context.setVariable("userEmail", userEmail);
        context.setVariable("userName", khachHangCheck.getTenKhachHang());
        context.setVariable("orders", hoaDon);
        context.setVariable("orderItems", hoaDonChiTietList);
        context.setVariable("orderDate", hoaDon.getNgayTao());
        context.setVariable("address",checkoutRequest.getDetailAddress());
        mailService.sendEmailWithHtmlTemplate(userEmail, title, "confirm-order", context);
        return true;
    }

    @Override
    public List<HoaDonRequest> orderHistory(KhachHang khachHang) {
        List<HoaDon> hoaDons = hoaDonRepository.findHoaDonsByKhachHang(khachHang);
        List<HoaDonRequest> hoaDonRequests = new ArrayList<>();
        SimpleDateFormat formattedDate = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        for(HoaDon hoaDon : hoaDons){
            long tongSl = 0,tongTien = 0;
            for(HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietRepository.findHoaDonChiTietsByHoaDon(hoaDon)){
                tongSl += hoaDonChiTiet.getSoLuong();
            }
            tongTien = hoaDon.getThanhTien();
            String ngayTao = formattedDate.format(hoaDon.getNgayTao());
            HoaDonRequest hoaDonRequest = HoaDonRequest.builder()
                    .ID(hoaDon.getID())
                    .maHoaDon(hoaDon.getMaHoaDon())
                    .tenKH(hoaDon.getKhachHang().getTenKhachHang())
                    .tongSp(tongSl)
                    .tongTien(tongTien)
                    .ngayTao(ngayTao)
                    .loaiHoaDon(hoaDon.getLoaiHoaDon())
                    .trangThaiDon(hoaDon.getTrangThaiDon().getTenTrangThai())
                    .build();
            hoaDonRequests.add(hoaDonRequest);
        }
        hoaDonRequests.sort(Comparator.comparingLong(HoaDonRequest::getID).reversed());
        return hoaDonRequests;
    }
}