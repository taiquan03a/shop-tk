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
    <style>
        .input-group-text{
            width: 23%;
            margin-bottom: 10px;
        }
        .input-group-text a{
            margin-bottom: 6px;
        }
    </style>
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
                <a href="/thong-ke/index" data-toggle="collapse" aria-expanded="false">Thống kê</a>
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

        <section id="modal-for" class="p-0">
            <%--Image--%>
            <div class="modal fade" id="myModalAnh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addAnh" method="post" enctype="multipart/form-data">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title" id="myModalLabel">Thêm ảnh</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Ảnh</label>
                                    <input type="file" accept="image/jpeg, image/png" name="photo" class="form-control" id="diaChi" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--sản phẩm--%>
            <div class="modal fade" id="myModalItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addSanPham" modelAttribute="sanpham" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm sản phẩm</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên sản phẩm</label>
                                    <input type="text" name="tenSanPham" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Mô tả</label>
                                    <input type="text" name="moTa" class="form-control" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--chất liệu--%>
            <div class="modal fade" id="myModalMaterial" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addChatLieu" modelAttribute="chatlieu" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm chất liệu</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên chất liệu</label>
                                    <input type="text" name="tenChatLieu" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--tay--%>
            <div class="modal fade" id="myModalSleeve" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addTayAo" modelAttribute="tayao" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm kiểu tay áo</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên kiểu tay áo</label>
                                    <input type="text" name="tenKieuTayAo" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--cổ--%>
            <div class="modal fade" id="myModalCollar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addCoAo" modelAttribute="coao" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm kiểu cổ áo</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên kiểu cổ áo</label>
                                    <input type="text" name="tenLoaiCoAo" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--Dáng--%>
            <div class="modal fade" id="myModalDang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addDangAo" modelAttribute="dangao" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm kiểu dáng áo</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên kiểu dáng áo</label>
                                    <input type="text" name="tenKieuDangAo" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--Họa tiết--%>
            <div class="modal fade" id="myModalPatten" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addHoaTiet" modelAttribute="hoatiet" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm kiểu họa tiết</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên kiểu họa tiết</label>
                                    <input type="text" name="tenHoaTiet" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--Kích cỡ--%>
            <div class="modal fade" id="myModalSize" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addKichCo" modelAttribute="kichco" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm kích cỡ</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên kích cỡ</label>
                                    <input type="text" name="tenKichCo" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--Màu sắc--%>
            <div class="modal fade" id="myModalColor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addMauSac" modelAttribute="mauSac" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm màu sắc</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên màu sắc</label>
                                    <input type="text" name="tenMauSac" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <%--Thương hiệu--%>
            <div class="modal fade" id="myModalTrademark" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-log modal-dialog-centered mt-4" role="document">
                    <div class="modal-content">
                        <form:form action="addThuongHieu" modelAttribute="thuongHieu" method="post">
                            <div class="modal-header d-flex justify-content-between">
                                <h4 class="modal-title">Thêm thương hiệu</h4>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label class="form-label">Tên thương hiệu</label>
                                    <input type="text" name="tenThuongHieu" class="form-control"  required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-secondary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

        </section>

        <!-- content -->
        <div style="width: 100%; background-color: #eee; padding: 20px;">


            <div class="filter mt-5">
                <div class="d-flex justify-content-between line-bottom">
                    <h3 style=" padding-bottom: 15px;">Thêm sản phẩm</h3>
                </div>
                <form action="${pageContext.request.contextPath}/SanPhamChiTiet/add" method="post" modelAttribute="spct" class="row">

                    <div class="col-4">
                        <label>Ảnh</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="anh">
                                <c:forEach var="item" items="${anh}" varStatus="status">
                                    <c:if test="${item.trangThai == 0}">
                                        <option value="${item.ID}">
                                                ${item.anh}
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon1">
                                <a href="" class="btn" data-toggle="modal" data-target="#myModalAnh"><i class="fa-solid fa-plus"></i></a>
                            </span>

                        </div>
                    </div>

                    <div class="col-4">
                        <label>Sản phẩm</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="sanPham">
                                <c:forEach var="sanpham" items="${sanpham}" varStatus="status">
                                    <c:if test="${sanpham.trangThai == 0}">
                                        <option value="${sanpham.ID}">${sanpham.tenSanPham}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon2">
                                <a href="" data-toggle="modal" data-target="#myModalItem" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Chất liệu</label>
                        <div class="input-group">

                            <select aria-label="Default select example" name="chatLieu">
                                <c:forEach var="chatlieu" items="${chatlieu}" varStatus="status">
                                    <c:if test="${chatlieu.trangThai == 0}">
                                        <option value="${chatlieu.ID}">${chatlieu.tenChatLieu}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon3">
                                <a href="" data-toggle="modal" data-target="#myModalMaterial" class="btn"><i class="fa-solid fa-plus"></i></a>
                        </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Tay áo</label>
                        <div class="input-group">

                            <select aria-label="Default select example" name="tayAo">
                                <c:forEach var="tayao" items="${tayao}" varStatus="status">
                                    <c:if test="${tayao.trangThai == 0}">
                                        <option value="${tayao.ID}">${tayao.tenKieuTayAo}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon4">
                                <a href="" data-toggle="modal" data-target="#myModalSleeve" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Cổ áo</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="coAo">
                                <c:forEach var="coao" items="${coao}" varStatus="status">
                                    <c:if test="${coao.trangThai == 0}">
                                        <option value="${coao.ID}">${coao.tenLoaiCoAo}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon5">
                                <a href="" data-toggle="modal" data-target="#myModalCollar" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Dáng áo</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="dangAo">
                                <c:forEach var="dangao" items="${dangao}" varStatus="status">
                                    <c:if test="${dangao.trangThai == 0}">
                                        <option value="${dangao.ID}">${dangao.tenKieuDangAo}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon6">
                                <a href="" data-toggle="modal" data-target="#myModalDang" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Họa tiết</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="hoaTiet">
                                <c:forEach var="hoatiet" items="${hoatiet}" varStatus="status">
                                    <c:if test="${hoatiet.trangThai == 0}">
                                        <option value="${hoatiet.ID}">${hoatiet.tenHoaTiet}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon7">
                                <a href="" data-toggle="modal" data-target="#myModalPatten" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Kích cỡ</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="kichCo">
                                <c:forEach var="kichco" items="${kichco}" varStatus="status">
                                    <c:if test="${kichco.trangThai == 0}">
                                        <option value="${kichco.ID}">${kichco.tenKichCo}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon8">
                                <a href="" data-toggle="modal" data-target="#myModalSize" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Màu sắc</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="mauSac">
                                <c:forEach var="mausac" items="${mausac}" varStatus="status">
                                    <c:if test="${mausac.trangThai == 0}">
                                        <option value="${mausac.ID}">${mausac.tenMauSac}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon9">
                                <a href="" data-toggle="modal" data-target="#myModalColor" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="col-4">
                        <label>Thương hiệu</label>
                        <div class="input-group">
                            <select aria-label="Default select example" name="thuongHieu">
                                <c:forEach var="thuonghieu" items="${thuonghieu}" varStatus="status">
                                    <c:if test="${thuonghieu.trangThai == 0}">
                                        <option value="${thuonghieu.ID}">${thuonghieu.tenThuongHieu}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="input-group-text btn btn-outline-success" id="basic-addon10">
                                <a href="" data-toggle="modal" data-target="#myModalTrademark" class="btn"><i class="fa-solid fa-plus"></i></a>
                            </span>
                        </div>

                    </div>

                    <div class="col-4">
                        <label>Giá nhập</label>
                        <input class="form-control" type="number" name="giaNhap" min="0" required>
                    </div>
                    <div class="col-4">
                        <label>Giá bán</label>
                        <input class="form-control" type="number" name="giaBan" min="0" required>
                    </div>
                    <div class="col-4">
                        <label>Số lượng</label>
                        <input class="form-control" type="number" name="soLuong" min="0" required>
                    </div>
                    <div class="col-4">
                        <label>Mô tả</label>
                        <textarea rows="5" cols="70" placeholder="Mô tả sản phẩm" class="form-control" name="moTa" maxlength="225"></textarea>
                    </div>

                    <input type="hidden" name="trangThai" value="0">

                    <div>
                        <button type="submit" class="btn btn-outline-success mx-2" onclick="return confirm('Bạn có muốn thêm mới?')">
                            <i class="fa-solid fa-plus"></i> Thêm
                        </button>
                        <a href="javascript:history.back()" class="btn-outline-danger" onclick="return confirm('Bạn có muốn hủy thông tin vừa thêm?')">
                            <i class="fa-solid fa-arrow-right-from-bracket fa-rotate-180"></i> Hủy
                        </a>
                    </div>
                </form>
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

</script>


<style>
    select {
        display: block;
        width: 75%;
        padding: .375rem .75rem;
        font-size: 1rem;
        line-height: 1.5;
        color: #55595c;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        border-radius: .25rem !important;
        margin-bottom: 20px;
    }

    .input-group{
        display: flex;
        justify-content: space-between;
    }

    .btn:hover {
        color: #fff;
        background-color: #fff;
        border-color: #fff;
    }
    .modal-log {
        width: 600px !important;
    }

</style>