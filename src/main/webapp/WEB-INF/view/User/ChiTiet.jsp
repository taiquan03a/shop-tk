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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="wrapper">
    <div class="w-100">
        <div style="width: 100%; background-color: #eee; padding: 20px;">
            <h3> Mã đơn ${detail.maHoaDon}</h3>

            <div class="filter mt-5">
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

                                    <div class="contact-form__content-group">
                                        <!-- Country -->
                                        <div class="contact-form-input">
                                            <label for="thanhPho">Tỉnh </label>
                                            <select
                                                    id="thanhPho"
                                                    class="contact-form-input__dropdown"
                                            >

                                            </select>
                                        </div>
                                        <!-- states -->
                                        <div class="contact-form-input">
                                            <label for="huyen">Huyện </label>
                                            <select
                                                    id="huyen"
                                                    class="contact-form-input__dropdown"
                                            >

                                            </select>
                                        </div>
                                        <!-- zip -->
                                        <div class="contact-form-input">
                                            <label for="xa">Xã</label>
                                            <select id="xa" class="contact-form-input__dropdown" name="idPhuong">

                                            </select>
                                        </div>
                                    </div>
                                    <c:if test="${detail.soNha != ''}">
                                    <div class="contact-form-input mt-4">
                                        <label for="address">Địa chỉ chi tiết </label>
                                        <input
                                                type="text"
                                                id="address"
                                                name="soNha"
                                                value=""
                                                placeholder="Your Address"
                                        />
                                    </div>
                                    </c:if>
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
                        <div class="col-4"><b>Tên người nhận:</b> ${detail.tenNguoiNhan}</div>
                        <div class="col-4"><b>Hình thức thanh toán:</b> ${detail.hinhThucThanhToan}</div>
                    </div>
                    <div class="mt-4 d-flex justify-content-between w-100 row">
                        <div class="col-4" ><b>Nhân viên tiếp nhận:</b> ${detail.nhanVien}</div>
                        <div class="col-4"><b>Loại đơn hàng:</b> ${detail.loaiHoaDon ? 'Tại quầy':'Trực tuyến'}</div>
                        <div class="col-4"><b>Trạng thái: </b> ${detail.trangThai}</div>
                    </div>
                    <div class="mt-4 d-flex justify-content-between w-100 row">
                        <div class="col-4" id="detail-address"></div>

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
                    <c:forEach var="sanPham" items="${sanPhams}">
                        <div id="item-${sanPham.ID}" class="row d-flex align-items-center line-bottom d-none">
                            <div class="col-3 d-flex">
                                <img style="width: 60px; height: 60px; margin: auto;" src="/img/${sanPham.anh.anh}" alt="">
                            </div>
                            <div class="col-3">
                                <div>${sanPham.sanPham.tenSanPham}</div>
                                <div style="color: red;">${sanPham.giaBan} đ</div>
                                <div>Size ${sanPham.kichCo.tenKichCo}</div>
                                <div class="sl-${sanPham.ID}">x1</div>
                            </div>
                            <div class="col-2">
                                <div class="quantity" style="display: block !important;">
                                    <input type="number" onblur="updateQuantity(${sanPham.ID}, ${sanPham.giaBan}, ${sanPham.soLuong})" id = "${sanPham.ID}" style="width: 100px; margin-right: 210px" class="input-box" value="1" min="1">
                                    <span style="color: red; margin-left: 5px" id="message-${sanPham.ID}"></span>
                                </div>
                            </div>
                            <div class="col-2 price-${sanPham.ID}" style="font-weight: 700; color: red;"> ${sanPham.giaBan} VNĐ</div>
                            <div class="col-2" style="cursor: pointer; color: red;" onclick="handleButtonDelete(${sanPham.ID})"><i class="fa-solid fa-trash"></i></div>

                        </div>
                    </c:forEach>
                </div>
                <form:form action="/hoa-don/donHang/${detail.id}" modelAttribute="updateDonHangRequest" method="post" enctype="multipart/form-data">
                    <c:choose>
                        <c:when test="${detail.trangThaiDon.ID < 3}">
                            <button id="btn-submit" style="background-color: #ffa500; float: right; width: 80px" type="submit" class="btn btn-primary d-none">Lưu</button>
                            <input type="text" name="list_product" value="" class="form-control d-none" id="list_product">
                            <br />
                        </c:when>
                        <c:otherwise>
                            <button id="btn-submit" style="background-color: #ffa500; float: right; width: 80px" type="submit" class="btn btn-primary d-none">Lưu</button>
                            <input type="text" name="list_product" value="" class="form-control d-none" id="list_product" readonly>
                            <br />
                        </c:otherwise>
                    </c:choose>
                </form:form>
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

        </div>

    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>

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
<script>
    document.addEventListener('DOMContentLoaded', function()  {
        const inputElement1 = document.getElementById('detail-address1');
        const inputElement2 = document.getElementById('detail-address2');
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + '${detail.idPhuong}' + '.htm',
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                    inputElement1.value = '${detail.soNha} ' + data['data'].full_name;
                    inputElement2.value = '${detail.soNha} ' + data['data'].full_name;
            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
            }
        });
        console.log(inputElement1.value)
        // Sau đó form sẽ được submit với giá trị đã thay đổi
    });
</script>
<script>
    getListProductSelected()
    updateTotalPrice()
    setValueInput()
    localStorage.clear()
    function confirmChuyenTT(){
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + '${detail.idPhuong}' + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                document.getElementById('detail-address1').value = '${detail.soNha}' + data['data'].full_name;
            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
            }
        });
        //document.getElementById('next').submit()
    }

    function confirmHuyDon(){
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + '${detail.idPhuong}' + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                document.getElementById('detail-address2').value = '${detail.soNha}' + data['data'].full_name;
            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
            }
        });
        document.getElementById('cancel').submit()
    }
    function getListProductSelected(){
        const newObject = JSON.parse(localStorage.getItem('quanlity')) ?? {};
        <c:forEach var="hoaDon" items="${detail.hoaDonChiTietList}">
        newObject[${hoaDon.sanPhamChiTiet.ID}] = ${hoaDon.soLuong};
        </c:forEach>
        localStorage.setItem('quanlity', JSON.stringify(newObject));
        var listItemSelected = JSON.parse(localStorage.getItem('quanlity')) ?? {};

        <c:forEach var="sanPham" items="${sanPhams}">
        if (listItemSelected.hasOwnProperty(${sanPham.ID})){
            document.getElementById('item-${sanPham.ID}').classList.remove("d-none")
            document.getElementById('${sanPham.ID}').value = listItemSelected['${sanPham.ID}']
            document.querySelector(".price-" + ${sanPham.ID}).innerHTML = listItemSelected['${sanPham.ID}'] * ${sanPham.giaBan} + " VNĐ";
            document.querySelector(".sl-" + ${sanPham.ID}).innerHTML = 'x'+document.getElementById(${sanPham.ID}).value
        }
        </c:forEach>
    }

    function handleButtonDelete(s) {
        if( ! confirm("Bạn có muốn xóa sản phẩm này?") ){
            event.preventDefault();
        } else {
            var storedArray = localStorage.getItem('quanlity');
            var newObject = {};
            newObject = JSON.parse(storedArray);
            if (newObject.hasOwnProperty(s)) {
                delete newObject[s];
            }
            localStorage.setItem('quanlity', JSON.stringify(newObject));
            setValueInput();
            document.getElementById('item-'+s).remove()
            document.getElementById('btn-submit').classList.remove('d-none')
        }
    }

    function updateQuantity(n, price, amount) {
        document.getElementById('message-' + n).classList.remove("thua")
        var idObject = JSON.parse(localStorage.getItem('quanlity')) ?? {};
        idObject[n] = document.getElementById(n).value;
        if(document.getElementById(n).value <= amount){
            document.getElementById('message-' + n).innerHTML = ''
            localStorage.setItem('quanlity', JSON.stringify(idObject));
            document.querySelector(".price-" + n).innerHTML = document.getElementById(n).value * price + " VNĐ";
            document.querySelector(".sl-" + n).innerHTML = 'x'+document.getElementById(n).value
            updateTotalPrice()
            setValueInput(1)
        }else{
            document.getElementById('message-' + n).innerHTML = 'Không đủ hàng!'
            document.getElementById('message-' + n).classList.add("thua")
        }

    }

    function handleSelect(s) {
        var storedArray =  JSON.parse(localStorage.getItem('quanlity')) ?? {};
        const selectedObj = JSON.parse(localStorage.getItem('selected')) ?? [];
        if (!storedArray.hasOwnProperty(s)) selectedObj.push(s)
        if (!storedArray.hasOwnProperty(s)) storedArray[s] = 1;
        localStorage.setItem('selected', JSON.stringify(selectedObj));
        localStorage.setItem('quanlity', JSON.stringify(storedArray));
        document.getElementById('item-'+s).classList.remove("d-none")

    }

    function updateTotalPrice() {
        totalPrice = 0
        var listItemSelected = JSON.parse(localStorage.getItem('quanlity')) ?? {};
        <c:forEach var="sanPham" items="${sanPhams}">
        if (listItemSelected.hasOwnProperty(${sanPham.ID})) {
            var s =  document.querySelector('.price-${sanPham.ID}').innerText.trim()
            var priceValue = s.split(" ")[0];
            totalPrice += parseInt(priceValue)
        }
        </c:forEach>
        document.getElementById('prices').innerHTML = totalPrice.toFixed(1) + " VNĐ"
        // document.getElementById('money-discount').innerHTML = totalPrice.toFixed(0) + " VNĐ"
        document.getElementById('total-money').innerHTML = (totalPrice + ${detail.phiVanChuyen}).toFixed(1) + " VNĐ"
    }

    function setValueInput(check = 0){
        var idValue = localStorage.getItem('quanlity');
        if(localStorage.getItem('selected') || check === 1) document.getElementById('btn-submit').classList.remove('d-none')
        var inputElement = document.getElementById('list_product');
        inputElement.value = idValue;
    }
</script>

<script>
    var btnSubmit = document.getElementById('btn-submit');
    btnSubmit.addEventListener('click', function(event) {
        event.preventDefault();
        if(document.querySelector('.thua')){
            alert("Không đủ hàng")
        }else{
            localStorage.clear();
            event.target.form.submit();
        }
    });
</script>

<script>
    if('${detail.idPhuong}'.length) getDetailAddress('${detail.idPhuong}', '${detail.soNha}')
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

    getName('${detail.idPhuong}', '${detail.soNha}')

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

    function getDetailAddress(wardId, soNha){
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + wardId + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                var detailAddress = document.getElementById('detail-address');
                detailAddress.innerHTML = '<b>Địa chỉ chi tiết: </b>' + soNha + ' ' + data['data'].full_name;            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
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

    function getName(wardId, address) {
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + wardId + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                $('#thanhPho').val(data['data'].tinh);
                populateDistricts(data['data'].tinh);
                populateWards(data['data'].quan);
                getName2(wardId, address)
            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
            }
        });
    }

    function getName2(wardId, address) {
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + wardId + '.htm',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                $('#thanhPho').val(data['data'].tinh);
                $('#huyen').val(data['data'].quan);
                $('#xa').val(wardId);
                $('#address').val(address)
            },
            error: function () {
                alert('Không thể lấy dữ liệu xã.');
            }
        });
    }
</script>

<style>
    select, #address {
        width: 100%;
        border-radius: 4px;
        padding: 10px;
        border: 1px solid #ccc;
    }

</style>
