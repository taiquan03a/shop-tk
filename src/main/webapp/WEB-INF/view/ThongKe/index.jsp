<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/quanli.css">
    <link rel="stylesheet" href="/css/thongke.css"/>
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
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js" ></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
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
                <a href="" data-toggle="collapse" aria-expanded="false">Thống kê</a>
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
                    <security:authorize access="hasAuthority('QUANLY')">
                    <li >
                        <i class="fa-solid fa-user-group" style="margin-right: 10px"></i>
                        <a class="dropdown-item" href="/nhan-vien/index" >Nhân viên</a>
                    </li>
                    </security:authorize>
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
                <i class="fa-regular fa-bell">
                </i>
                <a href="#">Tài khoản</a>
                <c:if test="${not empty pageContext.request.remoteUser}">
                    <span>Welcome, ${email}!</span>

                    <form:form action="/signout" method="post">
                        <button type="submit">Signout</button>
                    </form:form>
                </c:if>
            </div>

        </div>

        <!-- content -->
        <div style="width: 100%; background-color: #eee; padding: 30px;">
            <div style="background-color: #fff; width: 98%; margin: auto; border-radius: 20px; padding-bottom: 6px">
                <div class="cardBox mb-4">
                    <div class="card">
                        <a href="/SanPham/list"><div>
                            <div class="numbers">${thongKe.tongSanPham}</div>
                            <div class="cardName">Sản phẩm</div>
                        </div></a>
                    </div>
                    <div class="card">
                        <a href="/khach-hang/index"><div>
                            <div class="numbers">${thongKe.tongKhachHang}</div>
                            <div class="cardName">Khách hàng</div>
                        </div></a>
                    </div>
                    <div class="card">
                        <a href="/SanPhamChiTiet/list"><div>
                            <div class="numbers">${thongKe.tongDonHang}</div>
                            <div class="cardName">Đơn hàng</div>
                        </div></a>
                    </div>
                    <div class="card">
                        <div>
                            <div class="numbers">${thongKe.tongNhanVien}</div>
                            <div class="cardName">Nhân viên</div>
                        </div>
                    </div>
                </div>

                <div class="mb-3" style="margin: auto; width: 80%;">
                    <form id="myForm" action="">
                        <select name="type" onchange="submitForm()">
                            <option value="1" <c:if test="${type == 1}">selected</c:if>>Tháng</option>
                            <option value="2" <c:if test="${type == 2}">selected</c:if>>Năm</option>
                        </select>
                    </form>
                    <div class="box w-100">
                        <canvas id="earning"></canvas>
                    </div>
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

</script>


<style>
    select {
        float: right;
        display: block;
        padding: 0.5rem 1.75rem;
        font-size: 1rem;
        line-height: 1.5;
        color: #55595c;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        border-radius: .25rem !important;
        margin-bottom: 20px;
    }

</style>

<script>
    let toggle = document.querySelector(".toggle");
    let navigation = document.querySelector(".navigation");
    let main = document.querySelector(".main");

    toggle.onclick = function () {
        navigation.classList.toggle("active");
        main.classList.toggle("active");
    };
    let list = document.querySelectorAll(".navigation li");
    function activeLink() {
        list.forEach((item) => item.classList.remove("hovered"));
        this.classList.add("hovered");
    }
    list.forEach((item) => item.addEventListener("mouseover", activeLink));

    function submitForm() {
        document.getElementById("myForm").submit();
    }
</script>
</body>
</html>

<script>
    console.log(${thongKe.thoiGian  })

    var earning = document.getElementById("earning").getContext("2d");
    var myChart = new Chart(earning, {
        type: "bar",
        data: {
            labels: ${thongKe.thoiGian},
            datasets: [
                {
                    label: "Doanh thu",
                    data: ${thongKe.doanhThu},
                    backgroundColor:  "#ffa500",
                },
            ],
        },
        options: {
            responsive: true,
        },
    });

</script>
