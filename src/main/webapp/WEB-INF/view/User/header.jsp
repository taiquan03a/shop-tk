<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<header class="header" data-header>
    <div class="container">

        <div class="overlay" data-overlay></div>

        <a href="#" class="logo">
            <img src="/img/logo.jpg" width="60" height="60" alt="Footcap logo">
        </a>

        <button class="nav-open-btn" data-nav-open-btn aria-label="Open Menu">
            <ion-icon name="menu-outline"></ion-icon>
        </button>

        <nav class="navbar" data-navbar>

            <button class="nav-close-btn" data-nav-close-btn aria-label="Close Menu">
                <ion-icon name="close-outline"></ion-icon>
            </button>

            <a href="#" class="logo">
                <img src="./assets/images/logo.svg" width="190" height="50" alt="Footcap logo">
            </a>

            <ul class="navbar-list">

                <li class="navbar-item">
                    <a href="/user/home" class="navbar-link">Trang chủ</a>
                </li>

                <li class="navbar-item">
                    <a href="#" class="navbar-link">About</a>
                </li>

                <li class="navbar-item">
                    <a href="/user/list" class="navbar-link">Sản phẩm</a>
                </li>

                <li class="navbar-item">
                    <a href="#" class="navbar-link">Shop</a>
                </li>

                <li class="navbar-item">
                    <a href="/user/order-history" class="navbar-link">Đơn hàng</a>
                </li>

            </ul>

            <ul class="nav-action-list" style="align-items: center">
                <li>
                    <button class="nav-action-btn">
                        <ion-icon name="heart-outline" aria-hidden="true"></ion-icon>

                        <span class="nav-action-text">Danh sách yêu thích</span>

                        <data class="nav-action-badge" value="5" aria-hidden="true">5</data>
                    </button>
                </li>

                <li>
                    <button class="nav-action-btn" onclick="goCart()">
                        <ion-icon name="bag-outline" aria-hidden="true"></ion-icon>

                        <data class="nav-action-text" value="318.00">Basket: <strong>$318.00</strong></data>

                        <data class="nav-action-badge cart-count" value="4" aria-hidden="true">4</data>
                    </button>
                </li>
                <li class="logout">
                    <a href="/user/logout" class="nav-action-btn">
                        <i style="font-size: 22px" class="fa-solid fa-right-to-bracket"></i>
                    </a>
                </li>
                <li class="avatar" style="display: none">
                    <a href="" class="nav-action-btn">
                        <img src="/img/logo.jpg" style="width: 60px; height: 60px; border-radius: 100%">
                    </a>
                </li>
                <form:form action="/user/cart" id="carttt" method="get" cssStyle="display: none">
                    <input type="text" id="spct" name="spCart">
                </form:form>
            </ul>

        </nav>

    </div>
</header>

<script>
    var dataElement = document.querySelector('.cart-count');

    var listProductSelected = JSON.parse(localStorage.getItem('product')) ?? {};

    dataElement.setAttribute('value', Object.keys(listProductSelected).length);
    dataElement.textContent = Object.keys(listProductSelected).length;

    function goCart(){
        var listProductSelected = localStorage.getItem('product') ?? {}
        document.getElementById('spct').value = listProductSelected
        document.getElementById('carttt').submit()
    }
</script>

<script>
    var check = ${khachHang.ID} ? true : false
    if (check) {
        document.querySelector('.avatar').style.display = 'block';
        document.querySelector('.logout').style.display = 'none ';
    }
</script>