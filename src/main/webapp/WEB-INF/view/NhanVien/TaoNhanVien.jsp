<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
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
                <a href="/thong-ke/index">Thống kê</a>
            </li>
            <li>
                <i class="fa-solid fa-money-bill"></i>
                <a href="/hoa-don/create">Bán hàng tại quầy</a>
            </li>
            <li>
                <img src="/img/order.png" alt="">
                <a href="/hoa-don/index">Quản lí hóa đơn</a>
            </li>
            <li>
                <img src="/img/icon_ao.jpg" alt="">
                <a href="/SanPhamChiTiet/list">Quản lí sản phẩm</a>
            </li>
            <li class="dropdown">
                <i class="fa-solid fa-user-group" style="margin-right: 10px"></i>
                <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown" style="background-color: white">Tài khoản</a>
                <ul class="dropdown-menu" style="margin: 10px">
                    <li >
                        <i class="fa-solid fa-user-group" style="margin-right: 10px"></i>
                        <a class="dropdown-item" href="/nhan-vien/index" >Nhân viên</a>
                    </li>
                    <li>
                        <i class="fa-solid fa-user-group" style="margin-right: 10px"></i>
                        <a class="dropdown-item" href="/khach-hang/index">Khách hàng</a>
                    </li>
                </ul>
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


            <div class="filter mt-5">
                <div class="d-flex justify-content-between line-bottom">
                    <h3 style=" padding-bottom: 15px;">Thêm nhân viên</h3>
                </div>
                <form:form action="create" id="myForm" method="post" modelAttribute="createNhanVien">
                    <div class="row d-flex justify-content-between">
                        <div class="col-6">
                            <div class="mb-3">
                                <label for="exampleInputName" class="form-label">Tên nhân viên</label>
                                <input type="text" name="tenNhanVien" class="form-control" id="exampleInputName" required>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email</label>
                                <input type="text" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
                                <input type="password" name="matKhau"  class="form-control" id="exampleInputPassword1" required>
                            </div>
                            <div class="type d-flex gap-2 align-items-center" style="font-size: 14px;">
                                <div style="font-weight: 700; margin-bottom: 4px;">Giới tính:</div>
                                <input type="radio" id="css" name="gioiTinh" value="0" required>
                                <label  for="css">Nam</label>
                                <input type="radio" id="javascript" name="gioiTinh" value="1" required>
                                <label  for="javascript">Nữ</label>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Số điện thoại</label>
                                <input type="number" name="sdt" class="form-control" id="total_price" required>
                            </div>
                            <button id="btn-submit" style="background-color: #ffa500;" type="submit" class="btn btn-primary">Thêm khách hàng</button>

                        </div>

                        <div class="col-4">
                            <h3 style="color: red">Chức vụ</h3>
                                <%--                            <div class="mb-3">--%>
                                <%--                                <label for="province" class="form-label">Tỉnh/Thành phố</label>--%>
                                <%--                                <select id="province" name="province" class="form-control" required>--%>
                                <%--                                    <option value="">Chọn tỉnh/thành phố</option>--%>
                                <%--                                </select>--%>
                                <%--                            </div>--%>
                            <div class="type d-flex gap-2 align-items-center" style="font-size: 14px;">
                                <div style="font-weight: 700; margin-bottom: 4px;">Chức vụ:</div>
                                <input type="radio" id="nhanVien" name="chucVu" value="1" required>
                                <label  for="css">Nhân viên</label>
                                <input type="radio" id="quanLi" name="chucVu" value="2" required>
                                <label  for="javascript">Quản lí</label>
                                <input type="radio" id="chuCuaHang" name="chucVu" value="3" required>
                                <label  for="javascript">Chủ cửa hàng</label>
                            </div>

                    </div>
                </form:form>
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

    $.ajax({
        url: 'https://esgoo.net/api-tinhthanh/1/0.htm',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            var $province = $('#thanhPho');
            $province.append('<option value="">Chọn tỉnh Tỉnh/Thành phố </option>');
            $.each(data['data'], function(index, value) {
                $province.append('<option value="' + value.id + '">' + value.name + '</option>');
            });
        },
        error: function() {
            alert('Không thể lấy dữ liệu tỉnh thành.');
        }
    });
    function populateDistricts(provinceId) {
        var $huyen = $('#huyen');
        $huyen.empty();
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/2/' + provinceId + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                $huyen.append('<option value="">Chọn Quận/Huyện </option>');
                $.each(data['data'], function(index, value) {
                    $huyen.append('<option value="' + value.id + '">' + value.name + '</option>');
                });
            },
            error: function() {
                alert('Không thể lấy dữ liệu huyện.');
            }
        });
    }

    function populateWards(districtId) {
        var $xa = $('#xa');
        $xa.empty();
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/3/' + districtId + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                $xa.append('<option value="">Xã/Phường </option>');
                $.each(data['data'], function(index, value) {
                    $xa.append('<option value="' + value.id + '">' + value.name + '</option>');
                });
            },
            error: function() {
                alert('Không thể lấy dữ liệu xa.');
            }
        });
    }

    $('#thanhPho').on('change', function() {
        var selectedProvinceId = $(this).val();
        populateDistricts(selectedProvinceId);
    });

    $('#huyen').on('change', function() {
        var selectedDistrictId = $(this).val();
        populateWards(selectedDistrictId);
    });
</script>

<script>
    var btnSubmit = document.getElementById('btn-submit');
    var form = document.getElementById('myForm');
    btnSubmit.addEventListener('click', function(event) {
        if (!confirm("Bạn có chắc chắn muốn thêm khách hàng ?")) {
            event.preventDefault();
        }else if (!form.checkValidity()) {
            event.preventDefault();
            alert("Vui lòng điền đầy đủ thông tin!");
        }else{
            alert("Thêm khách hàng thành công!");
            event.target.form.submit();
        }
    });
</script>
