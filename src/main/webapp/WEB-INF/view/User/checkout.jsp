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
<section class="section billing section--xl pt-0">
    <div class="container">
        <form:form action="checkout" method="post" modelAttribute="checkoutRequest">
        <div class="row billing__content">

            <div class="col-lg-8">
                <div class="billing__content-card">
                    <div class="billing__content-card-header">
                        <h2 class="font-body--xxxl-500">Billing Information</h2>
                    </div>
                    <div class="billing__content-card-body">

                            <div class="contact-form__content">
                                <div class="contact-form__content-group">
                                    <div class="contact-form-input">
                                        <label for="fname1">Full Name </label>
                                        <input
                                                type="text"
                                                id="fname1"
                                                name="tenKhachHang"
                                                placeholder="Your full name"
                                                value="${khachHang.tenKhachHang}"
                                        />
                                    </div>
                                </div>
                                <div class="contact-form__content-group">
                                    <div class="contact-form-input">
                                        <label for="email"> email </label>
                                        <input
                                                type="text"
                                                id="email"
                                                name="email"
                                                value="${khachHang.email}"
                                                placeholder="Email Address"
                                        />
                                    </div>
                                    <div class="contact-form-input">
                                        <label for="phone"> Phone </label>
                                        <input
                                                type="number"
                                                id="phone"
                                                name="sdt"
                                                value="${khachHang.sdt}"
                                                placeholder="Phone number"
                                        />
                                    </div>
                                    <input type="hidden" name="spct" value="${spCart.spct}">
                                </div>
                                <select class="mt-4 w-50" style="float: right" onchange="getAddress(this)" name="address" id="diachi">
                                    <option value="0"> Chọn địa chỉ</option>
                                </select>
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
                                <div class="contact-form-input">
                                    <label for="address">Street Address </label>
                                    <input
                                            type="text"
                                            id="address"
                                            name="soNha"
                                            value=""
                                            placeholder="Your Address"
                                    />
                                </div>

                            </div>

                    </div>
                </div>
                <div class="billing__content-card">
                    <div class="billing__content-card-header">
                        <h2 class="font-body--xxxl-500">Additional Information</h2>
                    </div>
                    <div class="billing__content-card-body">
                        <div class="contact-form-input contact-form-textarea">
                            <label for="note">Order Notes <span>(Optional)</span> </label>
                            <!-- <input type="text" id="fname1" placeholder="Your first name" /> -->
                            <textarea
                                    name="notes"
                                    id="note"
                                    placeholder="Notes about your order, e.g. special notes for delivery"
                            ></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="bill-card">
                    <div class="bill-card__content">
                        <div class="bill-card__header">
                            <h2 class="bill-card__header-title font-body--xxl-500">
                                Order Summery
                            </h2>
                        </div>
                        <div class="bill-card__body">
                            <!-- Product Info -->
                            <div class="bill-card__product">
                                <c:forEach var="sanPham" items="${spCart.hoaDonChiTietList}" varStatus="status">
                                <div class="bill-card__product-item">
                                    <div class="bill-card__product-item-content">
                                        <div class="img-wrapper">
                                            <img
                                                    src="${pageContext.request.contextPath}/img/${sanPham.sanPhamChiTiet.anh.anh}"
                                                    alt="product-img"
                                            />
                                        </div>
                                        <h5 class="font-body--md-400">
                                                ${sanPham.sanPhamChiTiet.sanPham.tenSanPham} <span class="quantity"> x${sanPham.soLuong}</span>
                                        </h5>
                                    </div>

                                    <p class="bill-card__product-price font-body--md-500">
                                            ${sanPham.donGia}
                                    </p>
                                </div>
                                </c:forEach>
                            </div>
                            <!-- memo  -->
                            <div class="bill-card__memo">
                                <!-- Subtotal  -->
                                <div class="bill-card__memo-item subtotal">
                                    <p class="font-body--md-400">Subtotal:</p>
                                    <span class="font-body--md-500">${spCart.thanhTien} VNĐ</span>
                                </div>
                                <!-- Shipping  -->
                                <div class="bill-card__memo-item shipping">
                                    <p class="font-body--md-400">Shipping:</p>
                                    <span class="font-body--md-500">${spCart.tienShip} VNĐ</span>
                                </div>
                                <!-- total  -->
                                <div class="bill-card__memo-item total">
                                    <p class="font-body--lg-400">Total:</p>
                                    <span class="font-body--xl-500">${spCart.tongTien} VNĐ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bill-card__content">
                        <div class="bill-card__header">
                            <div class="bill-card__header">
                                <h2 class="bill-card__header-title font-body--xxl-500">
                                    Payment Method
                                </h2>
                            </div>
                        </div>
                        <div class="bill-card__body">

                                <button class="button button--lg w-100" type="submit">
                                    Place Order
                                </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        </form:form>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>

<style>
    select {
        width: 100%;
        border-radius: 4px;
        padding: 10px;
        border: 1px solid #ccc;
    }
</style>
<script>
    <c:forEach var="dc" items="${diaChi}" varStatus="status">
        $('#diachi').append('<option id="${dc.ID}" value="${dc.ID} ${dc.idPhuong}"></option>');
        getDetailAddress('${dc.ID}', '${dc.idPhuong}', ${dc.soNha})
    </c:forEach>
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

    function getAddress(e){
        var wardId = e.value.split(' ')[1]
        getName(wardId, e.selectedOptions[0].textContent.split(' ')[0])
    }

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

    function getDetailAddress(id, wardId, soNha){
        $.ajax({
            url: 'https://esgoo.net/api-tinhthanh/5/' + wardId + '.htm',
            method: 'GET',
            dataType: 'json',
            success: async function (data) {
                $('#'+id).text(soNha + ' ' + data['data'].name)
            },
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
            success: async function (data) {
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


