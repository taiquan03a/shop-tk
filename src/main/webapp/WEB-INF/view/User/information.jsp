<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footcap - Find your footware</title>
    <link rel="stylesheet" href="/css/home.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="/css/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/css/bvselect.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/swiper-bundle.min.js"></script>
    <script src="/js/bvselect.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/script.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<jsp:include page="header.jsp"></jsp:include>
<div class="filter mt-5" style="width: 1300px; margin: auto">
    <div class="d-flex justify-content-between line-bottom">
        <h1 style=" padding-bottom: 15px;" class="">Thông tin cá nhân</h1>
    </div>
    <div class="row d-flex justify-content-between">
        <div class="col-4">
            <form:form id="myForm" action="edit/${khachHang.ID}" method="post"> <%--modelAttribute=""--%>
                <div class="mb-3">
                    <label for="exampleInputName" class="form-label">Tên khách hàng</label>
                    <input type="text" name="tenKhachHang" class="form-control" id="exampleInputName" value="${khachHang.tenKhachHang}" required>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="text" name="email" value="${khachHang.email}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
                    <input type="text" name="matKhau" value="${khachHang.matKhau}" class="form-control" id="exampleInputPassword1" required>
                </div>
                <div class="type d-flex gap-4 align-items-center" style="font-size: 14px;">
                    <div style="font-weight: 700; margin-bottom: 4px;">Giới tính:</div>
                    <input style="width: 12px" <c:if test="${khachHang.gioiTinh}"> checked </c:if> type="radio" id="css" name="gioiTinh" value="0" required>
                    <label  for="css">Nam</label>
                    <input style="width: 12px" <c:if test="${khachHang.gioiTinh}"> checked </c:if> type="radio" id="javascript" name="gioiTinh" value="1" required>
                    <label  for="javascript">Nữ</label>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Số điện thoại</label>
                    <input type="text" name="sdt" value="${khachHang.sdt}" class="form-control" id="total_price" required>
                </div>
                <button id="btn-submit" style="background-color: #ffa500;" type="submit" class="btn btn-primary">Sửa khách hàng</button>
            </form:form>
        </div>

        <div class="col-6">
            <div class="d-flex justify-content-between mb-3">
                <h3 style="color: red">Danh sách địa chỉ</h3>
                <button type="button" class="function m-0" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Thêm địa chỉ
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form:form action="21" modelAttribute="diaChiRequest" method="post">
                                <div class="modal-header d-flex justify-content-between">
                                    <h4 class="modal-title" id="myModalLabel">Thông tin</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="thanhPho" class="form-label">Tỉnh/Thành phố</label>
                                        <select id="thanhPho" name="thanhPho1" class="selected w-100 p-2" required>
                                        </select>

                                    </div>
                                    <div class="mb-3">
                                        <label for="huyen" class="form-label">Quận/Huyện</label>
                                        <select id="huyen" name="huyen1" class="selected w-100 p-2" required>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="xa" class="form-label">Xã/Phường</label>
                                        <select id="xa" name="phuongId1" class="selected w-100 p-2" required>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="huyen" class="form-label">Địa chỉ</label>
                                        <input type="text" name="soNha1" class="form-control" id="diaChi" required>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button id="btn-luu" type="submit" class="btn btn-secondary">Lưu</button>
                                </div>
                            </form:form>

                        </div>
                    </div>
                </div>

            </div>
            <c:forEach var="diachi" items="${khachHang.diaChiList}" varStatus="status">
                <div class="ms-3 line-bottom pb-4">
                    <div class="d-flex justify-content-between">
                        <h5>Địa chỉ ${status.index +1}</h5>
                        <a id="btn-delete" href="delete/${diachi.ID}"><button type="button" class="btn btn-danger">Xóa</button></a>

                    </div>

                    <div class="mb-3">
                        <label for="thanhPho" class="form-label">Tỉnh/Thành phố</label>
                        <input type="text" name="thanhPho${diachi.ID}" class="form-control" id="thanhPho${diachi.ID}" readonly>


                    </div>
                    <div class="mb-3">
                        <label for="huyen" class="form-label">Quận/Huyện</label>
                        <input type="text" name="huyen${diachi.ID}" class="form-control" id="huyen${diachi.ID}" readonly>

                    </div>
                    <div class="mb-3">
                        <label for="xa" class="form-label">Xã/Phường</label>
                        <input type="text" name="xa${diachi.ID}" class="form-control" id="xa${diachi.ID}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="huyen" class="form-label">Địa chỉ</label>
                        <input type="text" name="diaChi${diachi.ID}" class="form-control" id="diaChi${diachi.ID}" readonly>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>

<style>
    select {
        width: 100%;
        border-radius: 4px;
        padding: 10px;
        border: 1px solid #ccc;
    }
    .line-bottom{
        margin-bottom: 20px;
        border-bottom: 1px solid gray;
    }
    label{
        font-size: 15px;
    }
    input:not([type='radio']) {
        margin-bottom: 18px;
        padding: 10px;
    }
    .function{
        border: 1.5px solid #F3741F;
        margin: auto;
        padding: 5px 15px;
        border-radius: 5px;
        color: #F3741F;
        font-weight: 700;
    }
</style>
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
        success: function (data) {
            var $province = $('#thanhPho');
            $province.append('<option value="">Chọn tỉnh Tỉnh/Thành phố </option>');
            $.each(data['data'], function (index, value) {
                $province.append('<option value="' + value.id + '">' + value.name  + '</option>');
            });
        },
        error: function () {
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
            success: function (data) {
                $huyen.append('<option value="">Chọn Quận/Huyện </option>');
                $.each(data['data'], function (index, value) {
                    $huyen.append('<option value="' + value.id + '">' + value.name + '</option>');
                });
            },
            error: function () {
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
            success: function (data) {
                $xa.append('<option value="">Xã/Phường </option>');
                $.each(data['data'], function (index, value) {
                    $xa.append('<option value="' + value.id + '">' + value.name + '</option>');
                });
            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
            }
        });
    }

    $('#thanhPho').on('change', function () {
        var selectedProvinceId = $(this).val();
        populateDistricts(selectedProvinceId);
    });

    $('#huyen').on('change', function () {
        var selectedDistrictId = $(this).val();
        populateWards(selectedDistrictId);
    });

    function getName(wardId, id) {
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + wardId + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                data = data['data'].name.split(',')
                $('#huyen' + id).val(data[1]);
                $('#xa' + id).val(data[0]);
                $('#thanhPho' + id).val(data[2]);
            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
            }
        });
    }

    <c:forEach var="diachi" items="${khachHang.diaChiList}" varStatus="status">
    $('#diaChi${diachi.ID}').val('${diachi.soNha}');
    getName('${diachi.idPhuong}', '${diachi.ID}')
    </c:forEach>

</script>

<script>
    var btnSubmit = document.getElementById('btn-submit');
    var btnDelete = document.getElementById('btn-delete');
    var btnLuu = document.getElementById('btn-luu');
    var form = document.getElementById('myForm');
    btnSubmit.addEventListener('click', function(event) {
        if (!confirm("Bạn có chắc chắn muốn cập nhật khách hàng ?")) {
            event.preventDefault();
        }else if (!form.checkValidity()) {
            event.preventDefault();
            alert("Vui lòng điền đầy đủ thông tin!");
        }else{
            alert("Cập nhật khách hàng thành công!");
            event.target.form.submit();
        }
    });

    btnDelete.addEventListener('click', function(event) {
        if (!confirm("Bạn có chắc chắn muốn xóa địa chỉ này ?")) {
            event.preventDefault();
        }else{
            localStorage.clear();
            alert("Xóa địa chỉ thành công!");
            event.target.form.submit();
        }
    });

    btnLuu.addEventListener('click', function(event) {
        if (!confirm("Bạn có chắc chắn muốn thêm địa chỉ ?")) {
            event.preventDefault();
        }else{
            localStorage.clear();
            alert("Thêm địa chỉ thành công!");
            event.target.form.submit();
        }
    });

</script>



