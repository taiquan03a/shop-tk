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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="/css/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/css/bvselect.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet">
    <link rel="preload" href="/img/hero-banner.png" as="image">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/swiper-bundle.min.js"></script>
    <script src="/js/bvselect.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/script.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<jsp:include page="header.jsp"></jsp:include>

<section class="shoping-cart section section--xl">
    <div class="container">
        <div class="section__head justify-content-center">
            <h2 class="section--title-four font-title--sm">My Shopping Cart</h2>
        </div>
        <div class="row shoping-cart__content">
            <div class="col-lg-8">
                <div class="cart-table">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" class="cart-table-title">Product</th>
                                <th scope="col" class="cart-table-title">Price</th>
                                <th scope="col" class="cart-table-title">quantity</th>
                                <th scope="col" class="cart-table-title">Subtotal</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sanPham" items="${spCart.hoaDonChiTietList}" varStatus="status">
                            <tr>
                                <!-- Product item  -->
                                <td class="cart-table-item align-middle">
                                    <a
                                            href="product-details.html"
                                            class="cart-table__product-item"
                                    >
                                        <div class="cart-table__product-item-img">
                                            <img
                                                    src="${pageContext.request.contextPath}/img/${sanPham.sanPhamChiTiet.anh.anh}"
                                                    alt="product"
                                            />
                                        </div>
                                        <h5 class="font-body--lg-400">${sanPham.sanPhamChiTiet.sanPham.tenSanPham}</h5>
                                    </a>
                                </td>
                                <!-- Price  -->
                                <td class="cart-table-item order-date align-middle">
                                        ${sanPham.sanPhamChiTiet.giaBan} VNĐ
                                </td>
                                <!-- quantity -->
                                <td class="cart-table-item order-total align-middle">
                                    <div class="counter-btn-wrapper">
                                        <button
                                                class="counter-btn-dec counter-btn"
                                                onclick="decrement(this, ${sanPham.sanPhamChiTiet.ID}, ${sanPham.sanPhamChiTiet.giaBan})"
                                        >
                                            -
                                        </button>
                                        <input
                                                type="number"
                                                id="product-${sanPham.sanPhamChiTiet.ID}"
                                                class="counter-btn-counter"
                                                min="1"
                                                value="${sanPham.soLuong}"
                                                placeholder="1"
                                                onchange="updateProduct(this, ${sanPham.sanPhamChiTiet.ID}, ${sanPham.sanPhamChiTiet.giaBan})"
                                        />
                                        <button
                                                class="counter-btn-inc counter-btn"
                                                onclick="increment(this, ${sanPham.sanPhamChiTiet.ID}, ${sanPham.sanPhamChiTiet.giaBan})"
                                        >
                                            +
                                        </button>
                                    </div>
                                </td>
                                <!-- Subtotal  -->
                                <td class="cart-table-item order-subtotal align-middle">
                                    <div
                                            class="
                            d-flex
                            justify-content-between
                            align-items-center
                          "
                                    >
                                        <p class="font-body--md-500 gia" id="subtotal${sanPham.sanPhamChiTiet.ID}">${sanPham.thanhTien} VNĐ</p>
                                        <button class="delete-item" onclick="deleteItem(this, ${sanPham.sanPhamChiTiet.ID}, ${sanPham.sanPhamChiTiet.giaBan})">
                                            <svg
                                                    width="24"
                                                    height="25"
                                                    viewBox="0 0 24 25"
                                                    fill="none"
                                                    xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                        d="M12 23.5C18.0748 23.5 23 18.5748 23 12.5C23 6.42525 18.0748 1.5 12 1.5C5.92525 1.5 1 6.42525 1 12.5C1 18.5748 5.92525 23.5 12 23.5Z"
                                                        stroke="#CCCCCC"
                                                        stroke-miterlimit="10"
                                                />
                                                <path
                                                        d="M16 8.5L8 16.5"
                                                        stroke="#666666"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                />
                                                <path
                                                        d="M16 16.5L8 8.5"
                                                        stroke="#666666"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                />
                                            </svg>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- Action Buttons  -->
                    <form action="#">
                        <div class="cart-table-action-btn d-flex">
                            <a
                                    href="shop-01.html"
                                    class="button button--md button--disable shop"
                            >Continue Shopping</a
                            >
                            <a href="#" class="button button--md button--disable update"
                            >Update to Cart</a
                            >
                        </div>
                    </form>
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
                            <!-- memo  -->
                            <div class="bill-card__memo">
                                <!-- Subtotal  -->
                                <div class="bill-card__memo-item subtotal">
                                    <p class="font-body--md-400">Subtotal:</p>
                                    <span class="font-body--md-500" id="subtotall">${spCart.thanhTien} VNĐ</span>
                                </div>
                                <!-- Shipping  -->
                                <div class="bill-card__memo-item shipping">
                                    <p class="font-body--md-400">Shipping:</p>
                                    <span class="font-body--md-500">${spCart.tienShip} VNĐ</span>
                                </div>
                                <!-- total  -->
                                <div class="bill-card__memo-item total">
                                    <p class="font-body--lg-400">Total:</p>
                                    <span class="font-body--xl-500" id="final-total">${spCart.tongTien} VNĐ</span>
                                </div>
                            </div>
                            <form:form id="checkout" action="/user/checkout" method="get">

                                <input type="hidden" name="spct1" id="spct1" value="">
                                <button
                                        class="button button--lg w-100"
                                        style="margin-top: 20px"
                                        type="button"
                                        onclick="handleOrder(this)"
                                >
                                    Place Order
                                </button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    var listProduct = {}
    <c:forEach items="${spCart.hoaDonChiTietList}" var="spct">
        listProduct['${spct.sanPhamChiTiet.ID}'] = ${spct.sanPhamChiTiet.soLuong}
    </c:forEach>
    var tmpListItemSelected = JSON.parse(localStorage.getItem('product')) ?? {};
    var listProductSelected = JSON.parse(localStorage.getItem('product')) ?? {};
    document.getElementById('spct1').value = JSON.stringify(listProductSelected)
    function increment(e, product_id, price) {
        (e.parentNode.querySelector("input")).stepUp();
        updateProduct(e.parentNode.querySelector("input"), product_id, price)
    }

    function decrement(e, product_id, price) {
        (e.parentNode.querySelector("input")).stepDown();
        updateProduct(e.parentNode.querySelector("input"), product_id, price)
    }

    function updateProduct(e, product_id, price){
        var listProductSelected = JSON.parse(localStorage.getItem('product')) ?? {};
        listProductSelected[product_id] = e.value
        localStorage.setItem('product', JSON.stringify(listProductSelected));
        document.getElementById('spct1').value = JSON.stringify(listProductSelected)
        document.getElementById('subtotal' + product_id.toString()).innerHTML = e.value * price + ' VNĐ'
        var tong = 0
        document.querySelectorAll('.gia').forEach(e => tong += parseInt(e.textContent.split(' ')[0]))
        document.getElementById('subtotall').innerHTML = tong + ' VNĐ'
        document.getElementById('final-total').innerHTML = tong - 15000  + ' VNĐ'
    }

    function deleteItem(e, product_id, price) {
        if(confirm("Bạn có muốn xóa sản phẩm này?")){
            var trNode = e.parentNode.parentNode.parentNode
            trNode.remove()
            var listProductSelected = JSON.parse(localStorage.getItem('product')) ?? {};

            if (listProductSelected.hasOwnProperty(product_id)) {
                delete listProductSelected[product_id];
            }
            localStorage.setItem('product', JSON.stringify(listProductSelected));
            var tong = 0
            document.querySelectorAll('.gia').forEach(e => tong += parseInt(e.textContent.split(' ')[0]))
            document.getElementById('subtotall').innerHTML = tong + ' VNĐ'
            document.getElementById('final-total').innerHTML = (tong - 15000) > 0 ? (tong - 15000) : 0  + ' VNĐ'
        }
    }

    function handleOrder(e){
        check = true
        var listProductSelected = JSON.parse(localStorage.getItem('product')) ?? {};
        for (const key in listProductSelected) {
                const item = listProductSelected[key];
                if(item > listProduct[key]){
                    check = false
                    alert("Không đủ " + item + " sản phẩm")
                    document.getElementById('product-' + key).value = tmpListItemSelected[key]

                }
        }
        if (check){
            document.getElementById('checkout').submit()
            e.submit()
        }else{
            localStorage.setItem('product', JSON.stringify(tmpListItemSelected));
            document.getElementById('spct1').value = JSON.stringify(tmpListItemSelected)

        }
    }
</script>

