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
    <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet">
    <link rel="preload" href="/img/hero-banner.png" as="image">
    <script src="/js/script.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<jsp:include page="header.jsp"></jsp:include>
<main>
    <article>
        <section class="section hero" style="background-image: url('/img/hero-banner.png')">
            <div class="container">

                <h2 class="h1 hero-title">
                    Mùa hè <strong>Bộ sưu tập</strong>
                </h2>

                <p class="hero-text">
                    Có khả năng thúc đẩy các lợi ích thay thế đồng thời là chất xúc tác hàng đầu cho sự thay đổi. Đòn bẩy toàn cầu
                    hiện có một
                    phạm vi lãnh đạo được mở rộng.
                </p>

                <button class="btn btn-primary">
                    <span>Mua ngay</span>

                    <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                </button>

            </div>
        </section>
        <section class="section product">
            <div class="container">

                <h2 class="h2 section-title">Sản phẩm bán chạy</h2>

                <ul class="product-list">
                <c:forEach var="sanPham" items="${sanPham}" varStatus="status">
                    <li class="product-item">
                        <div class="product-card" tabindex="0">

                            <figure class="card-banner">
                                <a href="detail/${sanPham.ID}">
                                <img src="${pageContext.request.contextPath}/img/${sanPham.anh}" width="312" height="350" loading="lazy"
                                     alt="Running Sneaker Shoes" class="image-contain">
                                </a>
                                <div class="card-badge">New</div>

                                <ul class="card-action-list">

                                    <li class="card-action-item">
                                        <button class="card-action-btn" aria-labelledby="card-label-1">
                                            <ion-icon name="cart-outline"></ion-icon>
                                        </button>

                                        <div class="card-action-tooltip" id="card-label-1">Thêm vào giỏ hàng</div>
                                    </li>

                                    <li class="card-action-item">
                                        <button class="card-action-btn" aria-labelledby="card-label-2">
                                            <ion-icon name="heart-outline"></ion-icon>
                                        </button>

                                        <div class="card-action-tooltip" id="card-label-2">Thêm vào danh sách yêu thích</div>
                                    </li>

                                    <li class="card-action-item">
                                        <button class="card-action-btn" aria-labelledby="card-label-3">
                                            <ion-icon name="eye-outline"></ion-icon>
                                        </button>

                                        <div class="card-action-tooltip" id="card-label-3">Xem nhanh</div>
                                    </li>

                                    <li class="card-action-item">
                                        <button class="card-action-btn" aria-labelledby="card-label-4">
                                            <ion-icon name="repeat-outline"></ion-icon>
                                        </button>

                                        <div class="card-action-tooltip" id="card-label-4">So sánh</div>
                                    </li>

                                </ul>
                            </figure>

                            <div class="card-content">

                                <div class="card-cat">
                                    <a href="#" class="card-cat-link">Men</a> /
                                    <a href="#" class="card-cat-link">Women</a>
                                </div>

                                <h3 class="h3 card-title">
                                    <a href="detail/${sanPham.ID}">${sanPham.tenSanPham}</a>
                                </h3>

                                <data class="card-price" value="180.85">${sanPham.giaBan} VNĐ</data>

                            </div>

                        </div>
                    </li>
                </c:forEach>
                </ul>


            </div>
        </section>

        <section class="section cta">
            <div class="container">

                <ul class="cta-list">

                    <li>
                        <div class="cta-card" style="background-image: url('/img/cta-1.jpg')">
                            <p class="card-subtitle">Adidas Shoes</p>

                            <h3 class="h2 card-title">Giảm giá mùa hè lên tới 50%</h3>

                            <a href="#" class="btn btn-link">
                                <span>Mua ngay</span>

                                <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                            </a>
                        </div>
                    </li>

                    <li>
                        <div class="cta-card" style="background-image: url('/img/cta-2.jpg')">
                            <p class="card-subtitle">Nike Shoes</p>

                            <h3 class="h2 card-title">Luôn làm mới bản thân</h3>

                            <a href="#" class="btn btn-link">
                                <span>Mua ngay</span>

                                <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                            </a>
                        </div>
                    </li>

                </ul>

            </div>
        </section>

        <section class="section special">
            <div class="container">

                <div class="special-banner" style="background-image: url('/img/special-banner.jpg')">
                    <h2 class="h3 banner-title">New Trend Edition</h2>

                    <a href="#" class="btn btn-link">
                        <span>Xem tất cả</span>

                        <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                    </a>
                </div>

                <div class="special-product">

                    <h2 class="h2 section-title">
                        <span class="text">Nike Special</span>

                        <span class="line"></span>
                    </h2>

                    <ul class="has-scrollbar">
                    <c:forEach var="sanPham" items="${sanPham}" varStatus="status">
                        <li class="product-item">
                            <div class="product-card" tabindex="0">
                                <figure class="card-banner">
                                    <img src="${pageContext.request.contextPath}/img/${sanPham.anh}" width="312" height="350" loading="lazy"
                                         alt="Running Sneaker Shoes" class="image-contain">
                                    <div class="card-badge">New</div>

                                    <ul class="card-action-list">

                                        <li class="card-action-item">
                                            <button class="card-action-btn" aria-labelledby="card-label-1">
                                                <ion-icon name="cart-outline"></ion-icon>
                                            </button>

                                            <div class="card-action-tooltip" id="card-label-1">Thêm vào giỏ hàng</div>
                                        </li>

                                        <li class="card-action-item">
                                            <button class="card-action-btn" aria-labelledby="card-label-2">
                                                <ion-icon name="heart-outline"></ion-icon>
                                            </button>

                                            <div class="card-action-tooltip" id="card-label-2">Thêm vào danh sách yêu thích</div>
                                        </li>

                                        <li class="card-action-item">
                                            <button class="card-action-btn" aria-labelledby="card-label-3">
                                                <ion-icon name="eye-outline"></ion-icon>
                                            </button>

                                            <div class="card-action-tooltip" id="card-label-3">Xem nhanh</div>
                                        </li>

                                        <li class="card-action-item">
                                            <button class="card-action-btn" aria-labelledby="card-label-4">
                                                <ion-icon name="repeat-outline"></ion-icon>
                                            </button>

                                            <div class="card-action-tooltip" id="card-label-4">So sánh</div>
                                        </li>

                                    </ul>
                                </figure>

                                <div class="card-content">

                                    <div class="card-cat">
                                        <a href="#" class="card-cat-link">Men</a> /
                                        <a href="#" class="card-cat-link">Women</a>
                                    </div>

                                    <h3 class="h3 card-title">
                                        <a href="detail/${sanPham.ID}">${sanPham.tenSanPham}</a>
                                    </h3>

                                    <data class="card-price" value="180.85">${sanPham.giaBan} VNĐ</data>

                                </div>

                            </div>
                        </li>
                    </c:forEach>
                    </ul>

                </div>

            </div>
        </section>

        <section class="section service">
            <div class="container">

                <ul class="service-list">

                    <li class="service-item">
                        <div class="service-card">

                            <div class="card-icon">
                                <img src="/img/service-1.png" width="53" height="28" loading="lazy" alt="Service icon">
                            </div>

                            <div>
                                <h3 class="h4 card-title">Miễn phí vận chuyển</h3>

                                <p class="card-text">
                                    Tất cả đơn hàng có giá trị từ <span>1.000.000 vnđ</span>
                                </p>
                            </div>

                        </div>
                    </li>

                    <li class="service-item">
                        <div class="service-card">

                            <div class="card-icon">
                                <img src="/img/service-2.png" width="43" height="35" loading="lazy" alt="Service icon">
                            </div>

                            <div>
                                <h3 class="h4 card-title">Thanh toán ngay</h3>

                                <p class="card-text">
                                    100% bảo mật
                                </p>
                            </div>

                        </div>
                    </li>

                    <li class="service-item">
                        <div class="service-card">

                            <div class="card-icon">
                                <img src="/img/service-3.png" width="40" height="40" loading="lazy" alt="Service icon">
                            </div>

                            <div>
                                <h3 class="h4 card-title">Miễn phí hoàn trả</h3>

                                <p class="card-text">
                                    Tiền sẽ được hoàn trong 30 ngày
                                </p>
                            </div>

                        </div>
                    </li>

                    <li class="service-item">
                        <div class="service-card">

                            <div class="card-icon">
                                <img src="/img/service-4.png" width="40" height="40" loading="lazy" alt="Service icon">
                            </div>

                            <div>
                                <h3 class="h4 card-title">Hỗ trợ 24/7</h3>

                                <p class="card-text">
                                    Get Quick Support
                                </p>
                            </div>

                        </div>
                    </li>

                </ul>

            </div>
        </section>

        <section class="section insta-post">

            <ul class="insta-post-list has-scrollbar">

                <li class="insta-post-item">
                    <img src="/img/insta-1.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

                <li class="insta-post-item">
                    <img src="/img/insta-2.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

                <li class="insta-post-item">
                    <img src="/img/insta-3.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

                <li class="insta-post-item">
                    <img src="/img/insta-4.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

                <li class="insta-post-item">
                    <img src="/img/insta-5.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

                <li class="insta-post-item">
                    <img src="/img/insta-6.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

                <li class="insta-post-item">
                    <img src="/img/insta-7.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

                <li class="insta-post-item">
                    <img src="/img/insta-8.jpg" width="100" height="100" loading="lazy" alt="Instagram post"
                         class="insta-post-banner image-contain">

                    <a href="#" class="insta-post-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>

            </ul>

        </section>

    </article>
</main>
<jsp:include page="footer.jsp"></jsp:include>

