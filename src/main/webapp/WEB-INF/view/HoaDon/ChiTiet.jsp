<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/quanli.css">
    <link rel="stylesheet" href="/css/detail.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0-alpha1/js/bootstrap.min.js" integrity="sha512-eHx4nbBTkIr2i0m9SANm/cczPESd0DUEcfl84JpIuutE6oDxPhXvskMR08Wmvmfx5wUpVjlWdi82G5YLvqqJdA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0-alpha1/css/bootstrap.min.css" integrity="sha512-72OVeAaPeV8n3BdZj7hOkaPSEk/uwpDkaGyP4W2jSzAC8tfiO4LMEDWoL3uFp5mcZu+8Eehb4GhZWFwvrss69Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/js/bootstrap.min.js" integrity="sha512-Cy3gSrKCS8aJ7AIaammc0wLXyKRmTa8ntgHvU01Tuz4EdsqVgk/lKzFm/b/8RxOWBaoHI2uGLLU6rXMbqKcGHA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" integrity="sha512-FOS5ANNUsuvefA5Fm6hZBLsxqfF105LIysEgV8VNz29jZLVYIhI+MOLKPBmMXgkHhARFHf5pE7KbXOLE6TXW0A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>
    <script src="https://cdn.datatables.net/select/2.0.3/js/dataTables.select.js"></script>
    <script src="https://cdn.datatables.net/select/2.0.3/js/select.bootstrap5.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.0.3/css/select.bootstrap5.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <img src="/img/logo.jpg" alt="">
        </div>

        <ul class="list-unstyle components">
            <li>
                <i class="fa-solid fa-chart-simple"></i>
                <a href="" data-toggle="collapse" aria-expanded="false">Thống kê</a>
            </li>
            <li>
                <i class="fa-solid fa-money-bill"></i>
                <a href="/hoa-don/create">Bán hàng tại quầy</a>
            </li>
            <li>
                <img src="/img/order.png" alt="">
                <a href="/hoa-don/index" >Quản lí đơn hàng</a>
            </li>
            <li>
                <img src="/img/icon_ao.jpg" alt="">
                <a href="/SanPhamChiTiet/list">Quản lí sản phẩm</a>
            </li>
            <li>
                <i class="fa-solid fa-retweet"></i>
                <a href="#">Trả hàng</a>
            </li>
            <li>
                <i class="fa-solid fa-ticket"></i>
                <a href="#">Giảm giá</a>
            </li>
            <li>
                <i class="fa-solid fa-user-group"></i>
                <a href="#">Tài khoản</a>
            </li>
            <li>
                <i class="fa-solid fa-user-group"></i>
                <a href="/khach-hang/index">Khách hàng</a>
            </li>
        </ul>
    </nav>
    <div class="w-100">
        <div class="d-flex justify-content-between w-100 align-items-center nav-bar">
            <button type="button" id="sidebarCollapse" style="height: 40px; color: black; background: none !important;" class="btn">
                <i class="fas fa-align-left"></i>
            </button>
            <div class="d-flex gap-3">
                <i class="fa-regular fa-bell"></i>
                <a href="#">Tài khoản</a>
            </div>

        </div>

        <!-- content -->
        <div style="width: 100%; background-color: #eee; padding: 20px;">
            <h3>Quản lý đơn hàng / Mã đơn ${detail.maHoaDon}</h3>
            <section class="mt-5">
                <h3 style="margin-top: -30px; padding-bottom: 15px;" class="line-bottom">Trạng thái đơn hàng</h3>
                <div class="text">
                    <%--                    <c:forEach var="trangThai" items="${detail.trangThaiDonList}">--%>
                    <c:forEach var="trangThai" items="${detail.timeLineDTOList}">
                        <div class="one">
                            <h4>${trangThai.trangThaiDon.tenTrangThai}</h4>
                            <p>${trangThai.time}</p>
                        </div>
                    </c:forEach>
                </div>

                <hr />
            </section>

            <div class="filter mt-5">
                <div class="w-100 first">
                    <c:choose>
                        <c:when test="${detail.trangThaiDon.ID < 4}">
                            <div class="d-flex justify-content-between gap-4">
                                <a style="color: #ffa500 !important;" href="/hoa-don/donHangUP/${detail.id}" id="confirmBtn" class="function" onclick="return confirmChuyenTT();">Chuyển sang trạng thái kế tiếp</a>
                                <a style="color: #fff !important;" href="/hoa-don/donHangHuy/${detail.id}" id="cancelBtn" class="function cancel" onclick="return confirmHuyDon();">Hủy Đơn</a>
                            </div>
                            <br />
                        </c:when>
                        <c:otherwise>
                            <div class="d-flex justify-content-between gap-4">
                                <a style="color: #ffa500 !important;" href="http://localhost:8080/hoa-don/donHangUP/${detail.id}" id="confirmBtn2" class="function" >Xem chi tiết</a>
                            </div>
                            <br />
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="filter mt-5">
                <div class="d-flex justify-content-between w-100 line-bottom">
                    <h3 style=" padding-bottom: 15px;" >Thông tin đơn hàng</h3>
                    <c:if test="${detail.trangThaiDon.ID < 3}">
                        <a style="cursor: pointer;"><div data-toggle="modal" data-toggle="modal" data-target="#myModal1" class="function">Thay đổi thông tin</div></a>
                    </c:if>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                        <div class="modal-log modal-dialog-centered mt-4" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel1">Thông tin cá nhân</h4>
                                </div>
                                <form:form action="/hoa-don/updateKH/${detail.id}" modelAttribute="updateInfoKH" method="post">
                                <div class="modal-body">

                                        <label for="name" class="form-label">Tên khách hàng</label>
                                        <input type="text" name="ten" class="form-control" id="name" aria-describedby="emailHelp" value="${detail.tenKH}" required>
                                        <label for="name" class="form-label">Số điện thoại</label>
                                        <input type="text" name="sdt" class="form-control" id="sdt" aria-describedby="emailHelp" value="${detail.sdt}" required>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary" style="margin-bottom: 4px">Lưu</button>
                                </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="w-100">
                    <div class="mt-4 d-flex justify-content-between w-100 row">
                        <div class="col-4" ><b>Mã hóa đơn:</b> ${detail.maHoaDon}</div>
                        <div class="col-4"><b>Tên khách hàng:</b> ${detail.tenKH}</div>
                        <div class="col-4"><b>Ngày tạo hóa đơn:</b> ${detail.ngayTao}</div>

                    </div>
                    <div class="mt-4 d-flex justify-content-between w-100 row">
                        <div class="col-4" ><b>SĐT nguười nhận:</b> ${detail.sdt}</div>
                        <div class="col-4"><b>Tên người nhận:</b> ${detail.tenKH}</div>
                        <div class="col-4"><b>Hình thức thanh toán:</b> ${detail.hinhThucThanhToan}</div>
                    </div>
                    <div class="mt-4 d-flex justify-content-between w-100 row">
                        <div class="col-4" ><b>Nhân viên tiếp nhận:</b> ${detail.nhanVien}</div>
                        <div class="col-4"><b>Loại đơn hàng:</b> ${detail.loaiHoaDon ? 'Tại quầy':'Trực tuyến'}</div>
                        <div class="col-4"><b>Trạng thái: </b> ${detail.trangThai}</div>
                    </div>
                </div>
            </div>



            <div class="filter mt-5">
                <div class="d-flex justify-content-between line-bottom">
                    <h3 style=" padding-bottom: 15px;">Danh sách sản phẩm</h3>
                    <c:if test="${detail.trangThaiDon.ID < 3}">
                        <a style="cursor: pointer;"><div data-toggle="modal" data-toggle="modal" data-target="#myModal" class="function">Thêm sản phẩm</div></a>
                    </c:if>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-log modal-dialog-centered mt-4" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel">Tìm kiếm sản phẩm</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="">
                                    </form>
                                    <div class="w-100 d-flex justify-content-center align-items-center" style="background-color: #fff; border-radius: 10px;">
                                        <table id="example" class="table table-striped p-5" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>Ảnh</th>
                                                <th>Tên</th>
                                                <th>Màu sắc</th>
                                                <th>Chất liệu</th>
                                                <th>Thương hiệu</th>
                                                <th>Size</th>
                                                <th>Dáng áo</th>
                                                <th>Cổ áo</th>
                                                <th>Tay áo</th>
                                                <th>Họa tiết</th>
                                                <th>Giá bán</th>
                                                <th>Còn lại</th>
                                                <th>Hành động</th>
                                            </tr>
                                            </thead>
                                            <tbody class="index">
                                            <c:forEach var="sanPham" items="${sanPhams}">
                                            <tr>
                                                <td><img src="/img/${sanPham.anh.anh}" style="width: 50px; height: 50px;" alt=""></td>
                                                <td>${sanPham.sanPham.tenSanPham}</td>
                                                <td>${sanPham.mauSac.tenMauSac}</td>
                                                <td>${sanPham.chatLieu.tenChatLieu}</td>
                                                <td>${sanPham.thuongHieu.tenThuongHieu}</td>
                                                <td>${sanPham.kichCo.tenKichCo}</td>
                                                <td>${sanPham.dangAo.tenKieuDangAo}</td>
                                                <td>${sanPham.coAo.tenLoaiCoAo}</td>
                                                <td>${sanPham.tayAo.tenKieuTayAo}</td>
                                                <td>${sanPham.hoaTiet.tenHoaTiet}</td>
                                                <td>${sanPham.giaBan}</td>
                                                <td>${sanPham.soLuong}</td>
                                                <td><a href="#" data-dismiss="modal"><div class="function" onclick="handleSelect(${sanPham.ID})">Chọn</div></a></td>
                                            </tr>
                                            </c:forEach>

                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="w-100">
                    <c:forEach var="hoaDon" items="${detail.hoaDonChiTietList}">
                        <div class="row d-flex align-items-center line-bottom">
                            <div class="col-3 d-flex">
                                <img style="width: 60px; height: 60px; margin: auto;" src="/img/${hoaDon.sanPhamChiTiet.anh.anh}" alt="">
                            </div>
                            <div class="col-3">
                                <div>${hoaDon.sanPhamChiTiet.sanPham.tenSanPham}</div>
                                <div style="color: red;">${hoaDon.donGia} VNĐ</div>
                                <div>Size: ${hoaDon.sanPhamChiTiet.kichCo.tenKichCo}</div>
                                <div class="sl-${hoaDon.sanPhamChiTiet.ID}">Số lượng: ${hoaDon.soLuong}</div>
                            </div>
                            <div class="col-3">
                                <div class="quantity" style="display: block">
                                    <input style="width: 100px;" onblur="updateQuantity(${hoaDon.sanPhamChiTiet.ID}, ${hoaDon.donGia}, ${hoaDon.sanPhamChiTiet.soLuong})" id = "${hoaDon.sanPhamChiTiet.ID}"
                                           type="number" class="input-box" value="${hoaDon.soLuong}" min="1" max="20">
                                    <span style="color: red; margin-left: 5px" id="message-${hoaDon.sanPhamChiTiet.ID}"></span>
                                </div>
                            </div>
                            <div class="col-3 price-${hoaDon.sanPhamChiTiet.ID}" style="font-weight: 700; color: red;">${hoaDon.thanhTien} VNĐ</div>
                        </div>
                    </c:forEach>
                </div>

            </div>

            <div class="filter mt-5">
                <div class="row d-flex justify-content-between">
                    <div class="col-3">
                        <div class="d-flex justify-content-between">
                            <div>Phiếu giảm giá</div>
                            <b>${detail.tenGiamGia}</b>
                        </div>
                        <div class="d-flex justify-content-between">
                            <div>Giảm giá từ cửa hàng</div>
                            <b>${detail.giaTriGiamGia}%</b>
                        </div>
                    </div>

                    <div class="col-4" style="margin-left: 300px;">
                        <div class="d-flex justify-content-between">
                            <div>Tổng tiền hàng</div>
                            <b id = "prices">${detail.tongTienHang} VNĐ</b>
                        </div>
                        <div class="d-flex justify-content-between">
                            <div>Giảm giá</div>
                            <%--<b id="money-discount">${detail.giamGia} VNĐ</b>--%>
                            <b id="money-discount">0 VNĐ</b>
                        </div>
                        <div class="d-flex justify-content-between">
                            <div>Phí vận chuyển</div>
                            <b>${detail.phiVanChuyen} VNĐ</b>
                        </div>
                        <i>Miễn phí vận chuyển với đơn hàng có giá trị trên 1.000.000vnđ</i>
                        <div class="line-bottom"></div>
                        <div  class="d-flex justify-content-between">
                            <b >Tổng tiền</b>
                            <b id="total-money" style="color: red;">${detail.tongTien}VND</b>
                        </div>
                    </div>
                </div>
            </div>



            <div class="filter mt-5">
                <h3 style=" padding-bottom: 15px;" class="line-bottom">Lịch sử đơn hàng</h3>
                <div class="w-100">
                    <table id="" class="table p-5" style="width:100%">
                        <thead>
                        <tr>
                            <th>Thời gian</th>
                            <th>Người cập nhật</th>
                            <th>Trạng thái hóa đơn</th>
                            <th>Ghi chú</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="thanhToan" items="${detail.lichSuThanhToanList}">
                            <tr>
                                <td>${thanhToan.ngayTao}</td>
                                <td>${thanhToan.nguoiCapNhat}</td>
                                <td>${thanhToan.nhungThayDoi}</td>
                                <td>${thanhToan.ghiChu}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>



        </div>

    </div>

</div>
</body>
</html>

<script>
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });

    });

    new DataTable('#example', {
        select: false,
        searching: true
    });

    // function handleButtonClick(s) {
    //     if(!confirm("Xác nhận thay đổi trạng thái?") ){
    //         event.preventDefault();
    //     } else {
    //         window.location.href = s
    //     }
    // }
</script>

<script>
    var btnSubmit = document.getElementById('btn-submit');
    btnSubmit.addEventListener('click', function(event) {
        event.preventDefault();
        localStorage.clear();
        event.target.form.submit();
    });

    function confirmChuyenTT() {
        return confirm("Bạn có chắc chắn muốn chuyển trạng thái không?");
    }

    function confirmHuyDon() {
        return confirm("Bạn có chắc chắn muốn hủy đơn hàng này không?");
    }

</script>