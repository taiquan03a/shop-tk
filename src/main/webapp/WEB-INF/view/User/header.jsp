<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header" data-header>
    <div class="container">

        <div class="overlay" data-overlay></div>

        <a href="#" class="logo">
            <img src="/img/logo.jpg" width="100" height="100" alt="Footcap logo">
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
                    <a href="#" class="navbar-link">Trang chủ</a>
                </li>

                <li class="navbar-item">
                    <a href="#" class="navbar-link">About</a>
                </li>

                <li class="navbar-item">
                    <a href="#" class="navbar-link">Sản phẩm</a>
                </li>

                <li class="navbar-item">
                    <a href="#" class="navbar-link">Shop</a>
                </li>

                <li class="navbar-item">
                    <a href="#" class="navbar-link">Liên hệ</a>
                </li>

            </ul>

            <ul class="nav-action-list">

                <li>
                    <button class="nav-action-btn">
                        <ion-icon name="search-outline" aria-hidden="true"></ion-icon>

                        <span class="nav-action-text">Tìm kiếm</span>
                    </button>
                </li>

                <li>
                    <a href="#" class="nav-action-btn">
                        <ion-icon name="person-outline" aria-hidden="true"></ion-icon>

                        <span class="nav-action-text">Đăng nhập</span>
                    </a>
                </li>

                <li>
                    <button class="nav-action-btn">
                        <ion-icon name="heart-outline" aria-hidden="true"></ion-icon>

                        <span class="nav-action-text">Danh sách yêu thích</span>

                        <data class="nav-action-badge" value="5" aria-hidden="true">5</data>
                    </button>
                </li>

                <li>
                    <button class="nav-action-btn">
                        <ion-icon name="bag-outline" aria-hidden="true"></ion-icon>

                        <data class="nav-action-text" value="318.00">Basket: <strong>$318.00</strong></data>

                        <data class="nav-action-badge" value="4" aria-hidden="true">4</data>
                    </button>
                </li>

            </ul>

        </nav>

    </div>
</header>