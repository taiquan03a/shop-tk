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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0-alpha1/js/bootstrap.min.js" integrity="sha512-eHx4nbBTkIr2i0m9SANm/cczPESd0DUEcfl84JpIuutE6oDxPhXvskMR08Wmvmfx5wUpVjlWdi82G5YLvqqJdA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0-alpha1/css/bootstrap.min.css" integrity="sha512-72OVeAaPeV8n3BdZj7hOkaPSEk/uwpDkaGyP4W2jSzAC8tfiO4LMEDWoL3uFp5mcZu+8Eehb4GhZWFwvrss69Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/js/bootstrap.min.js" integrity="sha512-Cy3gSrKCS8aJ7AIaammc0wLXyKRmTa8ntgHvU01Tuz4EdsqVgk/lKzFm/b/8RxOWBaoHI2uGLLU6rXMbqKcGHA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" integrity="sha512-FOS5ANNUsuvefA5Fm6hZBLsxqfF105LIysEgV8VNz29jZLVYIhI+MOLKPBmMXgkHhARFHf5pE7KbXOLE6TXW0A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>
    <script src="https://cdn.datatables.net/select/2.0.3/js/dataTables.select.js"></script>
    <script src="https://cdn.datatables.net/select/2.0.3/js/select.bootstrap5.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.0.3/css/select.bootstrap5.css">

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
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Thống kê</a>
            </li>
            <li>
                <i class="fa-solid fa-money-bill"></i>
                <a href="/hoa-don/create">Bán hàng tại quầy</a>
            </li>
            <li>
                <img src="/img/order.png" alt="">
                <a href="/hoa-don/index" data-toggle="collapse" aria-expanded="false">Quản lí hóa đơn</a>
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
            <button type="button" id="sidebarCollapse" style="height: 40px; color: black; background-color: transparent !important;" class="btn">
                <i class="fas fa-align-left"></i>
            </button>
            <div class="d-flex gap-3">
                <i class="fa-regular fa-bell"></i>
                <a href="#">Tài khoản</a>
            </div>

        </div>

        <!-- content -->
        <div style="width: 100%; background-color: #eee; padding: 20px;">
            <jsp:include page="../SanPhamChiTiet/navbar.jsp"></jsp:include>
            <h3>Quản lí sản phẩm</h3>
            <div class="filter">
                <div class="w-100 first">
                    <div>
                        Trạng thái:
                        <select name="status" id="status" onchange="filterStatus()">
                            <option value="">Tất cả</option>
                            <option value="0">Hoạt động</option>
                            <option value="1">Ngừng hoạt động</option>
                        </select>
                    </div>
                    <div class="d-flex justify-content-between gap-4">
                        <a href="/SanPham/create"><div class="function">Thêm mới</div></a>
                    </div>
                </div>

                <form action="filter">
                    <div class="w-100 second mt-4">
                        <div class="text-container align-items-center">
                            <svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>
                            <input type="text" name="keyword" id="search-input" placeholder="Tìm kiếm sản phẩm">
                        </div>
                        <button type="submit" class="function">Tìm kiếm</button>
                    </div>
                </form>
            </div>
            <div class="w-100 mt-5 d-flex justify-content-center align-items-center" style="background-color: #fff; border-radius: 10px;">
                <table id="example" class="table table-striped p-5" style="width:100%">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên</th>
                        <th>Mô tả</th>
                        <th>Ngày tạo</th>
                        <th>Người tạo</th>
                        <th>Ngày cập nhật</th>
                        <th>Người câp nhât</th>
                        <th>Trạng thái</th>
                        <th>Thao Tác</th>
                    </tr>
                    </thead>
                    <tbody class="index">
                    <c:forEach var="SanPhams" items="${SanPhams}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${SanPhams.tenSanPham}</td>
                        <td>${SanPhams.moTa}</td>
                        <td>${SanPhams.ngayTao}</td>
                        <td>${SanPhams.nguoiTao}</td>
                        <td>${SanPhams.ngayCapNhat}</td>
                        <td>${SanPhams.nguoiCapNhat}</td>
                        <td>
                            <div class="d-flex align-items-center justify-content-center h-100">
                                <c:choose>
                                    <c:when test="${SanPhams.trangThai == 1}">
                                        <a data-confirm-delete="Bạn có muốn đổi trạng thái?" id="1" onclick="return confirm(this.getAttribute('data-confirm-delete'))" href="trangThai?id=${SanPhams.ID}">
                                            <i class="fa-solid fa-toggle-off fa-xl"></i>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a data-confirm-delete="Bạn có muốn đổi trạng thái?" id="0" onclick="return confirm(this.getAttribute('data-confirm-delete'))" href="trangThai?id=${SanPhams.ID}">
                                            <i class="fa-solid fa-toggle-on fa-xl"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                        <td style="vertical-align: middle; font-size: 22px;" ><a href="${pageContext.request.contextPath}/SanPham/getId?id=${SanPhams.ID}"><i class="fa-solid fa-pen-to-square" style="color: purple; font-size: 18px;"></i></a></td>

                            <%--                        <td class="d-flex justify-content-center">--%>
                            <%--                            <a href="${pageContext.request.contextPath}/SanPhamChiTiet/getId?id=${spct.ID}" class="btn btn-warning mx-3">--%>
                            <%--                                <i class="fa-solid fa-pencil"></i>--%>
                            <%--                            </a>--%>
                            <%--                        </td>--%>
                    </tr>
                    </c:forEach>


                </table>
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
        searching: true,
        language:{
            search: "Tìm kiếm theo từ khóa:",
            lengthMenu: "_MENU_ đơn hàng mỗi trang",
            info: "Hiển thị từ _START_ đến _END_ của _TOTAL_ đơn hàng",
            infoEmpty: "Không có hóa đơn nào",
        }
    });

</script>
<script>
    function filterStatus() {
        const selectedStatus = document.getElementById("status").value;
        const rows = document.querySelectorAll("table tr"); // Giả sử các hàng dữ liệu nằm trong một bảng

        rows.forEach(row => {
            const statusElement = row.querySelector("a[data-confirm-delete]"); // Giả sử phần tử trạng thái là thẻ <a>

            if (statusElement) {
                const status = statusElement.getAttribute("id"); // Lấy giá trị trạng thái

                if (selectedStatus === "" || status === selectedStatus) {
                    row.style.display = ""; // Hiển thị hàng
                } else {
                    row.style.display = "none"; // Ẩn hàng
                }
            }
        });
    }

    document.querySelector('.sp').classList.add("nav-active")

</script>