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
    <script src="/js/script.js"></script>    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<jsp:include page="header.jsp"></jsp:include>
<main class="box-layout">
        <div class="header__center">
            <div class="container">
                <div class="header__center-content d-flex justify-content-center">
                    <form:form action="filter" modelAttribute="filterRequest" method="get">
                        <div class="header__input-form">
                            <input type="text" name="keyword" placeholder="Search" />
                            <span class="search-icon">
                                        <svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                    d="M9.16667 16.3333C12.8486 16.3333 15.8333 13.3486 15.8333 9.66667C15.8333 5.98477 12.8486 3 9.16667 3C5.48477 3 2.5 5.98477 2.5 9.66667C2.5 13.3486 5.48477 16.3333 9.16667 16.3333Z"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            />
                                            <path d="M17.4999 18L13.8749 14.375" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                        </svg>
                            </span>
                            <div class="d-flex justify-content-center select-box gap-3">
                                <select name="idMauSac">
                                    <option value="">Mau sac</option>
                                    <c:forEach items="${mauSac}" var="mauSac">
                                        <option value="${mauSac.ID}">${mauSac.tenMauSac}</option>
                                    </c:forEach>
                                </select>
                                <select name="idChatLieu">
                                    <option value="">Chat lieu</option>
                                    <c:forEach items="${chatLieu}" var="chatLieu">
                                        <option value="${chatLieu.ID}">${chatLieu.tenChatLieu}</option>
                                    </c:forEach>
                                </select>
                                <select name="idThuongHieu">
                                    <option value="">Thuong hieu</option>
                                    <c:forEach items="${thuongHieu}" var="thuongHieu">
                                        <option value="${thuongHieu.ID}">${thuongHieu.tenThuongHieu}</option>
                                    </c:forEach>
                                </select>
                                <select name="idKichCo">
                                    <option value="">Kich co</option>
                                    <c:forEach items="${kichCo}" var="kichCo">
                                        <option value="${kichCo.ID}">${kichCo.tenKichCo}</option>
                                    </c:forEach>
                                </select>
                                <select name="idDangAo">
                                    <option value="">Dang ao</option>
                                    <c:forEach items="${dangAo}" var="dangAo">
                                        <option value="${dangAo.ID}">${dangAo.tenKieuDangAo}</option>
                                    </c:forEach>
                                </select>
                                <select name="idCoAo">
                                    <option value="">Co Ao</option>
                                    <c:forEach items="${coAo}" var="coAo">
                                        <option value="${coAo.ID}">${coAo.tenLoaiCoAo}</option>
                                    </c:forEach>
                                </select>
                                <select name="idTayAo">
                                    <option value="">Tay Ao</option>
                                    <c:forEach items="${tayAo}" var="tayAo">
                                        <option value="${tayAo.ID}">${tayAo.tenKieuTayAo}</option>
                                    </c:forEach>
                                </select>
                                <select name="idHoaTiet">
                                    <option value="">Hoa Tiet</option>
                                    <c:forEach items="${hoaTiet}" var="hoaTiet">
                                        <option value="${hoaTiet.ID}">${hoaTiet.tenHoaTiet}</option>
                                    </c:forEach>
                                </select>
                                <select  name="sort" style="border-radius: 5px">
                                    <option value="0">Sắp xếp theo giá tăng dần</option>
                                    <option value="1">Sắp xếp theo giá giảm dần</option>
                                </select>
                            </div>
                            <button type="submit" class="search-btn button button--md">
                                Search
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <div class="header__sidebar">
            <button class="header__cross">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18 6L6 18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M6 6L18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
            </button>
            <div class="header__mobile-sidebar">
                <div class="header__mobile-top">
                    <form action="#">
                        <div class="header__mobile-input">
                            <input type="text" placeholder="Search" />
                            <button class="search-btn">
                                <svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                            d="M9.16667 16.3333C12.8486 16.3333 15.8333 13.3486 15.8333 9.66667C15.8333 5.98477 12.8486 3 9.16667 3C5.48477 3 2.5 5.98477 2.5 9.66667C2.5 13.3486 5.48477 16.3333 9.16667 16.3333Z"
                                            stroke="currentColor"
                                            stroke-width="1.5"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                    />
                                    <path d="M17.4999 18L13.8749 14.375" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <!-- Header  Section start -->

    <section class="section product" style="margin-top: 90px">
        <div class="container">

            <h1 class="h2 section-title">Sản phẩm bán chạy</h1>

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
                    <!-- <li class="product-item">
                      <div class="product-card" tabindex="0">

                        <figure class="card-banner">
                          <img src="/img/product-2.jpg" width="312" height="350" loading="lazy"
                            alt="Leather Mens Slipper" class="image-contain">

                          <ul class="card-action-list">

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-1">
                                <ion-icon name="cart-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-1">Add to Cart</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-2">
                                <ion-icon name="heart-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-2">Add to Whishlist</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-3">
                                <ion-icon name="eye-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-3">Quick View</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-4">
                                <ion-icon name="repeat-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-4">Compare</div>
                            </li>

                          </ul>
                        </figure>

                        <div class="card-content">

                          <div class="card-cat">
                            <a href="#" class="card-cat-link">Men</a> /
                            <a href="#" class="card-cat-link">Sports</a>
                          </div>

                          <h3 class="h3 card-title">
                            <a href="#">Leather Mens Slipper</a>
                          </h3>

                          <data class="card-price" value="190.85">$190.85</data>

                        </div>

                      </div>
                    </li>

                    <li class="product-item">
                      <div class="product-card" tabindex="0">

                        <figure class="card-banner">
                          <img src="/img/product-3.jpg" width="312" height="350" loading="lazy"
                            alt="Simple Fabric Shoe" class="image-contain">

                          <div class="card-badge">New</div>

                          <ul class="card-action-list">

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-1">
                                <ion-icon name="cart-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-1">Add to Cart</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-2">
                                <ion-icon name="heart-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-2">Add to Whishlist</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-3">
                                <ion-icon name="eye-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-3">Quick View</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-4">
                                <ion-icon name="repeat-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-4">Compare</div>
                            </li>

                          </ul>
                        </figure>

                        <div class="card-content">

                          <div class="card-cat">
                            <a href="#" class="card-cat-link">Men</a> /
                            <a href="#" class="card-cat-link">Women</a>
                          </div>

                          <h3 class="h3 card-title">
                            <a href="#">Simple Fabric Shoe</a>
                          </h3>

                          <data class="card-price" value="160.85">$160.85</data>

                        </div>

                      </div>
                    </li>

                    <li class="product-item">
                      <div class="product-card" tabindex="0">

                        <figure class="card-banner">
                          <img src="/img/product-4.jpg" width="312" height="350" loading="lazy"
                            alt="Air Jordan 7 Retro " class="image-contain">

                          <div class="card-badge"> -25%</div>

                          <ul class="card-action-list">

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-1">
                                <ion-icon name="cart-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-1">Add to Cart</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-2">
                                <ion-icon name="heart-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-2">Add to Whishlist</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-3">
                                <ion-icon name="eye-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-3">Quick View</div>
                            </li>

                            <li class="card-action-item">
                              <button class="card-action-btn" aria-labelledby="card-label-4">
                                <ion-icon name="repeat-outline"></ion-icon>
                              </button>

                              <div class="card-action-tooltip" id="card-label-4">Compare</div>
                            </li>

                          </ul>
                        </figure>

                        <div class="card-content">

                          <div class="card-cat">
                            <a href="#" class="card-cat-link">Men</a> /
                            <a href="#" class="card-cat-link">Sports</a>
                          </div>

                          <h3 class="h3 card-title">
                            <a href="#">Air Jordan 7 Retro </a>
                          </h3>

                          <data class="card-price" value="170.85">$170.85 <del>$200.21</del></data>

                        </div>

                      </div>
                    </li> -->

                </ul>

            </div>

        </div>
    </section>


    <!-- Banner  Section Start  -->
    <section class="banner banner--02">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 order-2 order-xl-0">
                    <ul class="card-category">
                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip)">
                                                    <path
                                                            d="M19.3526 7.3028C17.6067 5.92914 15.1337 6.30945 13.1746 6.79431C12.8595 6.8725 12.5363 6.9104 12.2124 6.9245C12.161 6.66577 12.0969 6.40631 12.0185 6.14886L13.5326 5.92328C15.4719 5.6347 16.9693 4.13727 17.2581 2.198L17.4815 0.697266C17.5009 0.645081 17.5082 0.590698 17.5054 0.535583L17.5847 0L15.3867 0.32721C13.4475 0.616333 11.95 2.11322 11.6613 4.05267L11.5296 4.93781C11.0803 4.07538 10.4339 3.3208 9.54237 2.84509C9.34406 2.73926 9.09925 2.8147 8.99342 3.01208C8.88795 3.21002 8.96284 3.45538 9.16041 3.56085C10.3982 4.22076 11.081 5.55615 11.3795 6.89813C11.1901 6.87433 11.0024 6.841 10.8171 6.79486C8.85792 6.30981 6.38416 5.92914 4.63898 7.30334C3.07563 8.53381 2.32453 10.9695 2.34412 14.7491C2.35841 17.5417 3.96644 20.7631 6.25489 22.5831C7.76606 23.7854 9.39112 24.2358 10.9517 23.8835C11.6353 23.7294 12.3563 23.7294 13.0395 23.8835C13.385 23.9614 13.7329 23.9998 14.0819 23.9998C15.3129 23.9998 16.559 23.5197 17.7363 22.5831C20.0248 20.7627 21.6325 17.5413 21.6471 14.7491C21.6669 10.9689 20.9161 8.53345 19.3526 7.3028ZM13.4128 5.12109L13.0573 5.17419L16.5082 1.72321L16.4551 2.0788C16.22 3.66248 14.9971 4.88544 13.4128 5.12109ZM15.5063 1.12958L16.0338 1.05103L12.3851 4.69977L12.4638 4.17188C12.6993 2.5882 13.9222 1.3656 15.5063 1.12958ZM17.2319 21.9485C16.3173 22.6767 14.8795 23.4675 13.2182 23.092C12.8185 23.0021 12.4072 22.957 11.9958 22.957C11.5847 22.957 11.1735 23.0021 10.7738 23.092C9.11573 23.4666 7.67469 22.6769 6.76008 21.9485C4.68439 20.2971 3.16846 17.2679 3.15546 14.7448C3.13715 11.2313 3.78681 9.00568 5.14069 7.94019C6.2873 7.03802 7.97883 6.9278 10.6229 7.58167C10.9166 7.65436 11.2161 7.69446 11.5173 7.71954C11.5404 7.92719 11.5558 8.1319 11.5624 8.33075C11.5692 8.54993 11.7493 8.72314 11.967 8.72314H11.98C12.2042 8.71582 12.3794 8.52887 12.3724 8.30511C12.3664 8.11743 12.3518 7.92389 12.332 7.72852C12.6812 7.70819 13.0289 7.66608 13.3691 7.58221C16.0131 6.92853 17.7043 7.03894 18.8514 7.94055C20.2057 9.00623 20.8548 11.2322 20.8367 14.7455C20.824 17.2674 19.3076 20.2971 17.2319 21.9485Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M8.02069 8.18552C6.00854 8.18552 4.37158 10.0045 4.37158 12.24C4.37158 12.464 4.55286 12.6456 4.77698 12.6456C5.00128 12.6456 5.18256 12.464 5.18256 12.24C5.18256 10.4516 6.45605 8.99631 8.02069 8.99631C8.245 8.99631 8.42627 8.81467 8.42627 8.59091C8.42627 8.36716 8.245 8.18552 8.02069 8.18552Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M13.1616 8.30435C12.8324 8.63358 12.3953 8.81485 11.931 8.81485C11.4668 8.81485 11.0288 8.63358 10.7 8.30435C10.5414 8.14578 10.2852 8.14578 10.1267 8.30435C9.96828 8.46292 9.9681 8.71945 10.1267 8.87766C10.6088 9.35959 11.2502 9.62564 11.931 9.62564C12.6118 9.62564 13.2528 9.36014 13.7349 8.87766C13.8935 8.71909 13.8935 8.46237 13.7349 8.30435C13.5764 8.14578 13.32 8.14578 13.1616 8.30435Z"
                                                            fill="currentColor"
                                                    />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                Fresh Fruit
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#vegetables)">
                                                    <path
                                                            d="M23.7383 11.4858C23.5573 11.2921 23.3018 11.1812 23.0376 11.1812H22.9589C23.3152 10.5677 23.5089 9.87158 23.5089 9.15436C23.5089 7.53754 22.5418 6.08203 21.0736 5.44244C21.0392 3.2373 19.2371 1.45312 17.0241 1.45312C14.8112 1.45312 13.0097 3.23621 12.9739 5.44043C12.8914 5.42102 12.806 5.40967 12.7194 5.40967C12.3591 5.40967 12.0198 5.58563 11.8127 5.87988L11.7118 6.02344C11.6287 6.14081 11.4727 6.18347 11.3421 6.12268L11.1832 6.04889C10.8561 5.89655 10.4747 5.91431 10.1622 6.0943C9.8498 6.27429 9.64417 6.59656 9.61176 6.95526L9.59602 7.12994C9.59034 7.19238 9.56269 7.27954 9.52662 7.37274C9.43378 7.32861 9.36732 7.23779 9.35761 7.12958L9.34187 6.95581C9.3111 6.61523 9.1291 6.33307 8.86835 6.15436L10.1441 4.34418C10.3925 3.99115 10.4888 3.56104 10.4143 3.13385C10.3402 2.70575 10.105 2.33331 9.75239 2.08484C9.02125 1.57013 8.00794 1.74518 7.49305 2.4765L5.15845 5.78979C5.08045 5.90039 5.02296 6.02032 4.97553 6.14355C4.93781 6.1452 4.89771 6.14154 4.85633 6.1225L4.69758 6.04871C4.37037 5.89709 3.98823 5.91449 3.67658 6.09448C3.36439 6.27448 3.15894 6.59637 3.12653 6.95508L3.11079 7.12976C3.09779 7.27368 2.98389 7.38757 2.83997 7.40057L2.66566 7.41632C2.30695 7.44873 1.98469 7.65472 1.8047 7.96637C1.62434 8.27875 1.60731 8.66034 1.75892 8.9881L1.83234 9.1463C1.89313 9.27759 1.85139 9.43323 1.7331 9.51636L1.58991 9.61725C1.2953 9.82526 1.11933 10.1646 1.11933 10.5249C1.11933 10.7651 1.20374 10.9922 1.34309 11.1806H0.962044C0.697822 11.1806 0.44239 11.2917 0.261299 11.4855C0.0783766 11.6808 -0.0159227 11.9467 0.00220476 12.2139C0.242256 15.7593 2.49738 17.5395 5.81013 19.1215C6.17982 19.2982 6.48505 19.5917 6.67036 19.9493C6.85108 20.2987 6.82233 20.7493 6.59162 21.1329C6.41785 21.4215 6.41291 21.7689 6.57862 22.0624C6.74451 22.3557 7.04444 22.5304 7.38135 22.5304H16.6188C16.9556 22.5304 17.2555 22.3553 17.4214 22.0624C17.5871 21.7689 17.5823 21.4215 17.4044 21.1256C17.1777 20.749 17.1495 20.2987 17.3298 19.9497C17.5146 19.5923 17.8198 19.2982 18.1899 19.1215C21.5019 17.5395 23.7576 15.7597 23.998 12.2142C24.0156 11.9467 23.9207 11.6812 23.7383 11.4858ZM22.6987 9.15436C22.6987 9.89209 22.4454 10.6051 21.9822 11.1812H19.8615V9.55975C19.8615 9.33563 19.6802 9.15436 19.4561 9.15436C19.2319 9.15436 19.0507 9.33563 19.0507 9.55975V11.1812H17.6195C17.6523 11.1365 17.6807 11.0894 17.7063 11.0409C17.7074 11.0389 17.7091 11.0369 17.7103 11.0347C17.7459 10.9658 17.7715 10.892 17.7922 10.8171C17.7973 10.7985 17.8019 10.7798 17.8059 10.7604C17.8226 10.6833 17.8343 10.6051 17.8343 10.5249C17.8343 10.1642 17.6583 9.82526 17.3641 9.61853L17.2709 9.55243C17.3033 9.55042 17.3344 9.5451 17.3665 9.54272C17.4152 9.5387 17.4639 9.53375 17.512 9.52771C17.5919 9.51782 17.6708 9.50574 17.7492 9.49164C17.7953 9.48303 17.842 9.47534 17.8878 9.46527C17.9722 9.44696 18.0551 9.42426 18.1375 9.40082C18.1743 9.3902 18.2117 9.38177 18.2481 9.37006C18.3637 9.33307 18.4768 9.29205 18.5874 9.24554C18.6182 9.23254 18.6475 9.21716 18.6773 9.20343C18.7575 9.16736 18.8375 9.13019 18.9148 9.08881C18.9582 9.06555 19.0005 9.04047 19.0426 9.01575C19.1045 8.97968 19.1662 8.94324 19.2261 8.90387C19.2708 8.87476 19.3145 8.84473 19.3579 8.81396C19.4127 8.77496 19.4665 8.7345 19.5192 8.69312C19.5626 8.65906 19.6055 8.62555 19.6472 8.58984C19.6972 8.54718 19.7446 8.50269 19.7924 8.45801C19.8333 8.41992 19.8746 8.3822 19.914 8.34247C19.9591 8.29669 20.0008 8.24817 20.0433 8.2002C20.124 8.10992 20.2002 8.01617 20.2727 7.91858C20.2982 7.88416 20.3254 7.85083 20.3502 7.81512C20.3943 7.75159 20.4349 7.68549 20.4754 7.61975C20.4956 7.58661 20.5166 7.55365 20.5362 7.51978C20.577 7.44873 20.6148 7.37622 20.6512 7.3028C20.6655 7.27368 20.6796 7.24493 20.6933 7.21527C20.731 7.1347 20.7664 7.05322 20.7988 6.96973C20.8055 6.95178 20.8121 6.93329 20.8186 6.91534C20.892 6.71796 20.9544 6.51544 20.9965 6.30542C22.032 6.86517 22.6987 7.95428 22.6987 9.15436ZM17.0241 2.26373C18.8119 2.26373 20.2667 3.71851 20.2667 5.50653C20.2667 5.56769 20.2615 5.62775 20.2579 5.68817C20.2579 5.68817 20.2566 5.69055 20.2566 5.6922C20.2328 6.1181 20.1266 6.52057 19.9547 6.88586C19.953 6.88953 19.9514 6.89319 19.9497 6.89685C19.91 6.98071 19.8662 7.06183 19.8197 7.14166C19.814 7.15137 19.8087 7.16107 19.803 7.17078C19.7597 7.24347 19.7126 7.31396 19.6637 7.38245C19.6531 7.39746 19.643 7.41248 19.6324 7.42694C19.5866 7.48938 19.5375 7.54944 19.4874 7.60822C19.4716 7.62689 19.4561 7.64594 19.4399 7.66425C19.3925 7.71771 19.3422 7.76843 19.2911 7.8186C19.27 7.83966 19.2493 7.86072 19.2275 7.88141C19.1788 7.92682 19.1278 7.96948 19.0763 8.01196C19.0499 8.03394 19.0239 8.05609 18.9968 8.07678C18.947 8.11487 18.8956 8.15057 18.8438 8.18628C18.8124 8.2077 18.7817 8.22968 18.7493 8.24982C18.6986 8.28186 18.6464 8.31061 18.594 8.3399C18.5585 8.35968 18.5228 8.38037 18.4862 8.39905C18.4351 8.42505 18.3825 8.44812 18.3301 8.47119C18.29 8.48914 18.2503 8.50763 18.2093 8.52356C18.158 8.5437 18.1051 8.5611 18.0526 8.57867C18.0082 8.59369 17.965 8.60907 17.92 8.62189C17.8689 8.6369 17.8162 8.64825 17.764 8.66052C17.7156 8.67188 17.6679 8.68396 17.6188 8.6933C17.5682 8.70264 17.5166 8.70886 17.4657 8.716C17.4133 8.72333 17.3615 8.73102 17.3088 8.73596C17.2987 8.73669 17.2881 8.73669 17.2777 8.73761V8.73706C17.2784 8.73193 17.2784 8.72699 17.2793 8.72168C17.2925 8.64844 17.2971 8.5741 17.2954 8.49994C17.2951 8.47614 17.2923 8.45288 17.2903 8.42908C17.2853 8.37067 17.2756 8.31354 17.2619 8.25677C17.2562 8.23407 17.2518 8.21136 17.2445 8.18903C17.2205 8.11285 17.1909 8.03778 17.15 7.96729C16.9697 7.65527 16.6478 7.44965 16.2891 7.41742L16.1144 7.40149C16.0069 7.39178 15.9161 7.32568 15.8716 7.23248L16.7377 6.36676C16.8962 6.20819 16.8962 5.95203 16.7377 5.79364C16.5793 5.63507 16.3231 5.63507 16.1647 5.79364L15.5863 6.37207C15.5008 6.26385 15.4003 6.16644 15.2778 6.09558C15.1959 6.04816 15.1088 6.01373 15.0196 5.98883C14.9896 5.98041 14.9592 5.97949 14.9288 5.974C14.868 5.9621 14.8081 5.95129 14.7464 5.95001C14.7387 5.95001 14.731 5.94672 14.7233 5.94672C14.6766 5.94672 14.6309 5.95569 14.5847 5.96173C14.556 5.96539 14.5272 5.96539 14.4987 5.97107C14.4161 5.9881 14.335 6.01318 14.2568 6.04926L14.0988 6.12268C14.0581 6.14136 14.0151 6.14868 13.9719 6.14703C13.9693 6.14703 13.9673 6.14648 13.9649 6.14648C13.9224 6.14374 13.8798 6.13202 13.841 6.11041C13.8016 5.90533 13.7816 5.70264 13.7816 5.50653C13.7814 3.71851 15.2358 2.26373 17.0241 2.26373ZM10.4033 7.20319L10.4193 7.0285C10.4277 6.93036 10.4821 6.84558 10.5676 6.79669C10.6525 6.74762 10.7531 6.74231 10.8422 6.78461L11.0021 6.85876C11.488 7.08325 12.0661 6.92798 12.3745 6.49072L12.4755 6.34717C12.5892 6.18549 12.8511 6.18658 12.9642 6.3468L13.0653 6.49017C13.272 6.78333 13.5994 6.94574 13.9396 6.95599H13.9514C14.0004 6.95673 14.0499 6.95599 14.0989 6.95032C14.122 6.94794 14.1447 6.94263 14.1678 6.9386C14.2009 6.93256 14.2339 6.92798 14.2667 6.91919C14.3251 6.90344 14.3826 6.88348 14.4386 6.85748L14.597 6.78369C14.6865 6.74249 14.7871 6.74689 14.8718 6.79578C14.957 6.84521 15.0114 6.92963 15.0198 7.02814L15.0355 7.2019C15.0842 7.73621 15.507 8.15936 16.0408 8.20715L16.2151 8.22308C16.3136 8.23151 16.3984 8.28589 16.4475 8.3714C16.4969 8.45636 16.5013 8.55688 16.4599 8.64569L16.3854 8.80627C16.3821 8.8136 16.381 8.82001 16.3781 8.82733C16.2338 9.15802 16.2638 9.5257 16.4348 9.82324C16.4372 9.82727 16.4398 9.83167 16.4421 9.83569C16.4639 9.87268 16.4872 9.90784 16.5134 9.94244C16.5277 9.96149 16.5434 9.97888 16.559 9.99719C16.5787 10.0199 16.5978 10.0433 16.6196 10.0644C16.661 10.1054 16.7053 10.1439 16.7538 10.1779L16.8977 10.2797C16.9779 10.3372 17.0241 10.4264 17.0241 10.5249C17.0241 10.6234 16.9779 10.7122 16.8977 10.769L16.7534 10.8702C16.7521 10.8712 16.7514 10.8723 16.7498 10.8735C16.697 10.9113 16.6489 10.9537 16.6038 11.0001C16.5859 11.0182 16.5705 11.0389 16.5538 11.0583C16.5297 11.087 16.5057 11.1163 16.4846 11.1475C16.4766 11.1594 16.466 11.1694 16.4583 11.1815H11.1343C11.1671 11.137 11.1954 11.0896 11.2214 11.0409C11.2225 11.0389 11.2238 11.0372 11.2251 11.0352C11.2606 10.966 11.2866 10.8922 11.3073 10.8168C11.3126 10.7981 11.3167 10.78 11.3207 10.7613C11.3377 10.6846 11.3491 10.6064 11.3494 10.5266V10.5258C11.3494 10.4738 11.3381 10.4244 11.3313 10.3738C11.326 10.3365 11.3267 10.298 11.3174 10.2614C11.2879 10.1407 11.2315 10.0302 11.1643 9.92633C11.0881 9.80914 10.996 9.70166 10.8789 9.6189L10.7355 9.51764C10.6174 9.43451 10.5762 9.27924 10.6366 9.14886L10.7108 8.98956C10.7468 8.91174 10.7716 8.83026 10.7886 8.74768C10.7939 8.72278 10.7939 8.69824 10.7972 8.67334C10.8052 8.61511 10.8113 8.55707 10.81 8.49866C10.8093 8.46826 10.8045 8.43823 10.8012 8.40784C10.7955 8.35565 10.7886 8.30365 10.7756 8.25275C10.7672 8.21942 10.7558 8.18774 10.7445 8.15533C10.7347 8.1286 10.7298 8.10059 10.7185 8.0744C10.7115 8.05847 10.6994 8.04675 10.6917 8.03174C10.6816 8.01105 10.6763 7.98871 10.665 7.96857C10.6436 7.93158 10.6143 7.90118 10.5888 7.86731C10.5676 7.83893 10.5489 7.80927 10.5255 7.7829C10.4764 7.72815 10.4205 7.68164 10.3621 7.63824C10.3447 7.62524 10.3317 7.60693 10.3136 7.59521C10.3555 7.47198 10.3912 7.33649 10.4033 7.20319ZM8.15626 2.9436C8.4137 2.57794 8.92072 2.49042 9.28584 2.74786C9.4618 2.87183 9.57935 3.05823 9.61616 3.27228C9.65314 3.48669 9.60572 3.70203 9.48176 3.87744L7.90046 6.1214C7.90046 6.1214 7.90009 6.1214 7.90009 6.12195L7.14661 7.19073C7.02247 7.36707 6.83662 7.48462 6.62257 7.52142C6.40888 7.55713 6.19318 7.51099 6.01722 7.38647C6.01649 7.38611 6.01612 7.38519 6.0152 7.38483C5.95734 7.34381 5.90864 7.29401 5.86451 7.24127C5.85316 7.22791 5.84272 7.21381 5.8321 7.19952C5.79365 7.14642 5.76032 7.09021 5.7356 7.02979C5.73396 7.02576 5.73158 7.02246 5.72993 7.01843C5.70521 6.95435 5.69147 6.8866 5.68342 6.81775C5.6814 6.80035 5.68049 6.78296 5.67939 6.76538C5.67573 6.69653 5.67774 6.6264 5.69239 6.55627C5.71473 6.45007 5.75721 6.34827 5.82111 6.25763L8.15626 2.9436ZM2.19984 10.8699L2.05628 10.7688C1.97572 10.712 1.92957 10.6234 1.92957 10.5245C1.92957 10.4257 1.97572 10.3369 2.05628 10.2797L2.19892 10.179C2.63801 9.87067 2.79292 9.29315 2.56751 8.80499L2.49409 8.64697C2.45234 8.55743 2.45728 8.45691 2.50617 8.3714C2.55561 8.28625 2.64002 8.23187 2.73853 8.22327L2.91248 8.20752C3.4466 8.15973 3.86939 7.73694 3.9181 7.20282L3.93385 7.02814C3.94245 6.92999 3.99665 6.84558 4.08179 6.79614C4.16657 6.74707 4.26746 6.74268 4.35664 6.78406L4.5163 6.85822C4.63221 6.91187 4.75507 6.94299 4.87995 6.9527C4.88105 6.9613 4.88471 6.96973 4.88636 6.97833C4.88764 6.98566 4.88673 6.9928 4.88801 6.99976C4.89606 7.0459 4.91309 7.08856 4.925 7.13342C4.93873 7.18579 4.94917 7.23889 4.96784 7.28998C4.99018 7.34985 5.02094 7.40533 5.04969 7.4621C5.06928 7.50037 5.08411 7.53955 5.10682 7.57599C5.14655 7.64044 5.19526 7.69885 5.24378 7.75726C5.26447 7.78198 5.28077 7.80908 5.30256 7.8327C5.37727 7.9118 5.45948 7.98468 5.5503 8.04822C5.63013 8.10461 5.71528 8.15076 5.80189 8.19141C5.82954 8.20386 5.85755 8.21411 5.88593 8.22491C5.94782 8.24982 6.01063 8.27087 6.07508 8.28735C6.10749 8.29596 6.13953 8.30402 6.17286 8.31006C6.24134 8.32343 6.31055 8.33112 6.38068 8.33569C6.40705 8.33734 6.43269 8.34137 6.45887 8.34174C6.46583 8.34174 6.47224 8.34338 6.47919 8.34338C6.57276 8.34338 6.66688 8.33533 6.76081 8.31903C7.18854 8.24451 7.56098 8.0094 7.80946 7.65674L8.40565 6.81042C8.4734 6.85547 8.52576 6.92834 8.53455 7.02814L8.5503 7.2019C8.59901 7.73621 9.0218 8.159 9.55555 8.20715L9.72987 8.2229C9.76795 8.2262 9.80128 8.24194 9.83369 8.25787C9.84943 8.26593 9.86536 8.27325 9.87946 8.28406C9.90125 8.30035 9.9192 8.32141 9.93568 8.34338C9.9463 8.35712 9.95802 8.36975 9.96626 8.3855C9.98566 8.42358 9.9994 8.46368 10.0014 8.50507C10.0014 8.50671 10.001 8.50909 10.001 8.51074C10.0027 8.55615 9.99409 8.60229 9.97431 8.64514L9.89997 8.80444C9.81538 8.98737 9.78443 9.18256 9.80201 9.37189C9.80238 9.37445 9.80311 9.37683 9.80311 9.37958C9.80933 9.44 9.8194 9.49951 9.83515 9.55829C9.90034 9.80237 10.0488 10.0237 10.2676 10.1777L10.3662 10.2469L10.4112 10.2786C10.4921 10.3374 10.5385 10.4262 10.5385 10.5247C10.5385 10.5742 10.5271 10.6207 10.5051 10.6626C10.4991 10.6747 10.4861 10.682 10.478 10.6934C10.4586 10.7208 10.4399 10.7488 10.4112 10.7692L10.4059 10.7726L10.2673 10.8701C10.2118 10.9094 10.1607 10.9548 10.1137 11.0034C10.0992 11.0184 10.0875 11.0354 10.0739 11.0508C10.0432 11.0865 10.0135 11.1229 9.98713 11.1623C9.98273 11.1687 9.97669 11.1744 9.97266 11.1808H2.49537C2.41792 11.0596 2.31776 10.9528 2.19984 10.8699ZM17.8403 18.39C17.3123 18.6422 16.8754 19.0637 16.6093 19.5771C16.3001 20.1746 16.3387 20.928 16.7135 21.5506C16.7412 21.5969 16.7298 21.6374 16.7148 21.663C16.7003 21.6885 16.6718 21.7198 16.6179 21.7198H7.38117C7.3277 21.7198 7.29896 21.689 7.28431 21.663C7.26984 21.6374 7.25794 21.5969 7.28999 21.5435C7.66096 20.9277 7.69941 20.1742 7.39014 19.5764C7.12464 19.0627 6.6872 18.6412 6.15949 18.3895C3.01612 16.8889 1.02522 15.3232 0.811165 12.1595C0.807136 12.0991 0.83625 12.0582 0.853828 12.0392C0.87397 12.0172 0.909309 11.9918 0.96241 11.9918H23.0378C23.0905 11.9918 23.1259 12.0172 23.1466 12.0392C23.1639 12.0582 23.1931 12.0987 23.1887 12.1595C22.9744 15.3232 20.9833 16.8889 17.8403 18.39Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M14.9971 18.8823H11.4679C11.2441 18.8823 11.0625 19.0636 11.0625 19.2877C11.0625 19.5118 11.2441 19.6931 11.4679 19.6931H14.9971C15.2208 19.6931 15.4025 19.5118 15.4025 19.2877C15.4025 19.0636 15.2208 18.8823 14.9971 18.8823Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M8.91711 19.6931H10.2895C10.5132 19.6931 10.6949 19.5118 10.6949 19.2877C10.6949 19.0636 10.5132 18.8823 10.2895 18.8823H8.91711C8.69336 18.8823 8.51172 19.0636 8.51172 19.2877C8.5119 19.5118 8.69299 19.6931 8.91711 19.6931Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M14.9971 20.0984H8.91711C8.69336 20.0984 8.51172 20.2797 8.51172 20.5038C8.51172 20.7279 8.69336 20.9092 8.91711 20.9092H14.9971C15.2209 20.9092 15.4025 20.7279 15.4025 20.5038C15.4025 20.2797 15.2209 20.0984 14.9971 20.0984Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M16.1645 5.22C16.2436 5.2991 16.3472 5.33865 16.451 5.33865C16.5548 5.33865 16.6585 5.29892 16.7376 5.22C16.8961 5.06143 16.8961 4.80527 16.7376 4.64688L15.591 3.50064C15.4324 3.34207 15.1762 3.34207 15.0179 3.50064C14.8593 3.65903 14.8593 3.91519 15.0179 4.07358L16.1645 5.22Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M18.4568 7.51248C18.5359 7.59158 18.6397 7.63132 18.7435 7.63132C18.8472 7.63132 18.951 7.59158 19.0301 7.51248C19.1885 7.35391 19.1881 7.09775 19.0301 6.93936L17.8833 5.79312C17.7249 5.63455 17.4688 5.63455 17.3102 5.79312C17.1518 5.95151 17.1518 6.20767 17.3102 6.36624L18.4568 7.51248Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M17.5972 5.33865C17.701 5.33865 17.8048 5.29892 17.8839 5.22L19.0306 4.07358C19.1886 3.91519 19.1891 3.65903 19.0306 3.50064C18.872 3.34207 18.6158 3.34207 18.4574 3.50064L17.3108 4.64688C17.1523 4.80527 17.1523 5.06143 17.3108 5.22C17.3897 5.29892 17.4936 5.33865 17.5972 5.33865Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M19.8613 8.74915C19.8613 8.97327 20.0424 9.15436 20.2665 9.15436H21.8879C22.1121 9.15436 22.2933 8.97327 22.2933 8.74915C22.2933 8.52502 22.1121 8.34375 21.8879 8.34375H20.2665C20.0424 8.34375 19.8613 8.52502 19.8613 8.74915Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M12.3628 8.95187C12.4666 8.95187 12.5705 8.91214 12.6494 8.83304L13.2575 8.22513C13.416 8.06656 13.416 7.81039 13.2575 7.65201C13.0989 7.49344 12.8427 7.49344 12.6844 7.65201L12.0764 8.25992C11.9179 8.41849 11.9179 8.67465 12.0764 8.83304C12.1554 8.91214 12.259 8.95187 12.3628 8.95187Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M14.3059 9.84628C14.385 9.92538 14.4888 9.96512 14.5924 9.96512C14.6963 9.96512 14.7999 9.92538 14.879 9.84628C15.0376 9.6879 15.0376 9.43173 14.879 9.27316L14.4738 8.86795C14.3152 8.70938 14.0591 8.70938 13.9007 8.86795C13.7421 9.02634 13.7421 9.2825 13.9007 9.44107L14.3059 9.84628Z"
                                                            fill="currentColor"
                                                    ></path>
                                                    <path
                                                            d="M12.6845 9.67862L12.2791 10.0838C12.1205 10.2424 12.1205 10.4986 12.2791 10.657C12.3582 10.7361 12.4618 10.7758 12.5656 10.7758C12.6695 10.7758 12.7731 10.7361 12.8522 10.657L13.2576 10.2517C13.4162 10.0932 13.4162 9.83701 13.2576 9.67862C13.099 9.52005 12.8425 9.52005 12.6845 9.67862Z"
                                                            fill="currentColor"
                                                    ></path>
                                                </g>
                                                <defs>
                                                    <clipPath id="vegetables">
                                                        <rect width="24" height="24" fill="white"></rect>
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                Vegetables
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                        d="M4.63245 16.2938C4.04102 15.7038 3.08026 15.7038 2.48993 16.2938C2.2041 16.5796 2.0459 16.9605 2.0459 17.3655C2.0459 17.7702 2.2041 18.151 2.48993 18.4369C2.78546 18.7324 3.17328 18.8798 3.5611 18.8798C3.9491 18.8798 4.3371 18.7324 4.63245 18.4369C4.91828 18.151 5.07648 17.7702 5.07648 17.3655C5.07648 16.9605 4.91883 16.5802 4.63245 16.2938ZM3.91834 17.7226C3.72077 17.9201 3.40161 17.9201 3.20422 17.7226C3.10919 17.6272 3.05609 17.5005 3.05609 17.3655C3.05609 17.2302 3.10864 17.1039 3.20422 17.0085C3.30274 16.9098 3.43201 16.8609 3.56128 16.8609C3.69055 16.8609 3.81983 16.9099 3.91834 17.0085V17.009C4.01392 17.1039 4.06629 17.2302 4.06629 17.3655C4.06629 17.4999 4.01373 17.6266 3.91834 17.7226Z"
                                                        fill="currentColor"
                                                />
                                                <path
                                                        d="M23.9376 6.91259C23.8612 6.54144 23.6139 6.22924 23.2764 6.08038C23.0486 5.97875 22.9638 5.74639 22.8501 5.37634C22.7344 4.99639 22.5238 4.29437 21.7288 4.36193C21.4596 4.38867 21.2232 4.31195 21.0615 4.151C20.9004 3.98986 20.8252 3.75238 20.8504 3.48376C20.9035 2.90991 20.7252 2.38604 20.3474 2.00775C19.9909 1.65179 19.5035 1.47949 18.9423 1.49871C18.9357 1.46685 18.9291 1.43151 18.9236 1.40167C18.8513 1.01971 18.7024 0.232907 17.6043 0.0847746C17.4104 0.0232512 16.8785 -0.105106 16.437 0.165707C16.2265 0.295529 15.9642 0.560666 15.9091 1.13891L15.8976 4.30242H10.7406C9.93751 4.30242 9.15858 4.39984 8.40601 4.57012C8.1363 3.55371 7.6897 2.59222 7.05231 1.71222L6.80183 1.36633L6.41895 1.55511C6.323 1.60272 4.06073 2.74365 3.43689 4.70599C3.18439 5.49938 3.23218 6.30615 3.5777 7.11016C1.47107 9.0487 0.140625 11.8191 0.140625 14.9007V24H9.16975C12.02 24 14.699 22.8902 16.7142 20.8744C16.9587 20.6299 17.189 20.3745 17.4068 20.1114C17.629 20.1295 17.8594 20.1425 18.107 20.1425C19.5317 20.1425 21.3435 19.7931 23.1442 18.4883L23.4901 18.2378L23.3002 17.855C23.2421 17.7372 21.9436 15.1785 19.7316 14.7715C19.7954 14.2967 19.8399 13.8173 19.8393 13.3304V8.20367L23.0299 8.23351L23.0704 8.22692C23.3002 8.19158 23.5064 8.0819 23.6681 7.90923L23.6695 7.90777C23.9118 7.64611 24.0119 7.27386 23.9376 6.91259ZM4.39655 6.41674C4.25043 5.9425 4.25208 5.47979 4.39911 5.01617C4.75654 3.88623 5.89106 3.05218 6.49073 2.6781C6.92451 3.35394 7.24366 4.07611 7.44471 4.83325C6.98823 4.98339 6.54877 5.16815 6.1214 5.37634C6.01795 5.42633 5.9123 5.47283 5.81086 5.5263C5.66932 5.60119 5.53345 5.68341 5.39557 5.76379C5.25477 5.84619 5.11487 5.92895 4.97791 6.01776C4.85358 6.09869 4.73291 6.18292 4.6128 6.26879C4.54102 6.31915 4.46631 6.36419 4.39655 6.41674ZM19.5539 15.7608C20.8272 15.9988 21.7724 17.2771 22.1768 17.9262C20.7191 18.8648 19.277 19.1294 18.1214 19.1319C18.7784 18.1223 19.2492 17.0121 19.5306 15.8432C19.5377 15.8154 19.5474 15.7886 19.5539 15.7608ZM22.929 7.22241L18.8291 7.18487V13.331C18.8291 13.9153 18.7705 14.49 18.67 15.0533L18.6568 15.1245C18.6281 15.277 18.5933 15.429 18.5568 15.5801C18.5413 15.6453 18.5252 15.7099 18.5085 15.7745C18.1765 17.0383 17.5862 18.2375 16.7749 19.2739L16.5795 19.5234C16.3956 19.7426 16.2052 19.9568 16.0007 20.1612C14.1762 21.9856 11.7503 22.9909 9.1703 22.9909H1.15082V14.9013C1.15082 11.9672 2.4787 9.3402 4.56116 7.57928C5.35071 6.91259 6.22706 6.38433 7.17866 6.00494C7.18616 6.00201 7.19367 5.99999 7.20081 5.99707C7.51447 5.87274 7.83619 5.7647 8.1656 5.67315C8.98628 5.4439 9.8476 5.31152 10.741 5.31152H16.9041L16.9173 1.19037C16.9279 1.08233 16.9547 1.03289 16.9668 1.02575C17.0167 0.994442 17.1916 1.00708 17.3088 1.04992L17.435 1.08123C17.8442 1.12664 17.8664 1.24292 17.931 1.58935C17.9835 1.86273 18.122 2.58691 18.9659 2.51074C19.2341 2.48547 19.4715 2.56073 19.6337 2.72186C19.7948 2.88336 19.8701 3.12085 19.8448 3.38946C19.7917 3.96331 19.9701 4.48718 20.3478 4.86492C20.7146 5.23114 21.223 5.40728 21.7811 5.37158C21.815 5.44482 21.8555 5.57647 21.8848 5.67114C22.0106 6.08312 22.201 6.70642 22.8662 7.00305C22.9142 7.0241 22.94 7.07574 22.9481 7.11657C22.9527 7.13745 22.9587 7.1889 22.9283 7.22167L22.929 7.22241ZM22.9977 7.29949V7.28539L23.2991 7.56481L22.9977 7.29949Z"
                                                        fill="currentColor"
                                                />
                                                <path d="M3.56104 12.5742V13.5846C7.46045 13.5846 10.6324 16.7565 10.6324 20.6558H11.6426C11.6426 16.1999 8.01709 12.5742 3.56104 12.5742Z" fill="currentColor" />
                                                <path d="M5.20508 10.9307V11.9409C9.1045 11.9409 12.2764 15.113 12.2764 19.0122H13.2866C13.2866 14.5558 9.66114 10.9307 5.20508 10.9307Z" fill="currentColor" />
                                                <path d="M6.77539 9.35999V10.3702C10.6748 10.3702 13.8467 13.5421 13.8467 17.4415H14.8569C14.8569 12.9855 11.232 9.35999 6.77539 9.35999Z" fill="currentColor" />
                                                <path d="M8.41968 7.71588V8.72608C12.3191 8.72608 15.491 11.898 15.491 15.7974H16.5012C16.5012 11.3414 12.8761 7.71588 8.41968 7.71588Z" fill="currentColor" />
                                            </svg>
                                        </span>
                                River Fish
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip1)">
                                                    <path
                                                            d="M4.82135 12.3867C4.09515 12.3867 3.50391 12.9778 3.50391 13.7042C3.50391 14.4305 4.09497 15.0216 4.82135 15.0216C5.54773 15.0216 6.13879 14.4305 6.13879 13.7042C6.13879 12.9774 5.54773 12.3867 4.82135 12.3867ZM4.82135 14.1432C4.57892 14.1432 4.38226 13.9464 4.38226 13.7042C4.38226 13.4617 4.57892 13.2649 4.82135 13.2649C5.06378 13.2649 5.26044 13.4617 5.26044 13.7042C5.26044 13.9464 5.06378 14.1432 4.82135 14.1432Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M23.6388 2.76785C23.3647 2.35586 22.973 2.05648 22.5063 1.90304C22.4202 1.87503 22.3592 1.81405 22.331 1.72708C22.1778 1.26071 21.8788 0.869411 21.466 0.594936C20.6813 0.0745502 19.6213 0.121608 18.887 0.709194C18.3311 1.15487 18.0321 1.81625 18.0658 2.52413C18.0909 3.04708 17.9323 3.50723 17.6201 3.81942L14.9182 6.52133L14.4335 6.52883C13.683 6.53982 12.9822 6.83316 12.46 7.35519C10.7646 9.05111 8.51536 10.0976 5.95536 10.3812C4.43284 10.5504 3.00041 11.2436 1.92063 12.3336C-0.560995 14.8396 -0.649618 18.9972 1.72379 21.6008C2.97843 22.9776 4.69193 23.7591 6.54844 23.8023C6.60246 23.8036 6.65611 23.8045 6.71012 23.8045C8.50749 23.8045 10.1915 23.1076 11.4667 21.8322C12.4437 20.8552 13.0884 19.6227 13.3312 18.2666C13.7611 15.8689 14.9766 13.6128 16.8468 11.7429C16.9684 11.6214 17.0783 11.4851 17.1929 11.3145L17.6509 10.6308H16.3094C16.4429 10.55 16.5711 10.4586 16.6844 10.3453L20.4152 6.61489C20.727 6.3027 21.1793 6.14779 21.711 6.16922C22.4242 6.19686 23.0798 5.9039 23.5256 5.34762C24.1134 4.613 24.1595 3.55246 23.6388 2.76785ZM12.4662 18.1106C12.2555 19.2898 11.6946 20.3612 10.8454 21.211C9.7028 22.3532 8.19657 22.9582 6.56822 22.9239C4.95414 22.8866 3.46403 22.2065 2.37235 21.0088C0.308939 18.7453 0.385843 15.1308 2.54411 12.9514C3.49626 11.9901 4.70896 11.4031 6.05094 11.2542C8.81144 10.9481 11.2418 9.81466 13.08 7.9761C13.2891 7.76754 13.5403 7.61209 13.8159 7.51632L12.9399 10.4358L14.4822 9.92196V11.508H15.8518C14.0655 13.4279 12.8987 15.6999 12.4662 18.1106ZM22.8395 4.79776C22.572 5.13192 22.1737 5.31466 21.7522 5.29104C20.974 5.25497 20.2821 5.50344 19.7934 5.99325L16.063 9.72348C15.8742 9.91281 15.6252 10.0199 15.3604 10.034V8.70339L14.2678 9.06796L14.5485 8.13302L18.241 4.44052C18.7303 3.95181 18.98 3.25619 18.9432 2.48202C18.9225 2.05813 19.1022 1.66207 19.436 1.39419C19.8679 1.04776 20.5174 1.01882 20.9799 1.32663C21.1993 1.47238 21.3606 1.67489 21.4589 1.91146C21.0154 2.01821 20.6078 2.25589 20.2991 2.60012C20.1371 2.78048 20.1521 3.05844 20.3324 3.22012C20.4163 3.29556 20.5214 3.33255 20.6258 3.33255C20.7457 3.33255 20.866 3.28329 20.9524 3.18679C21.2086 2.90133 21.5743 2.73306 21.9564 2.72573C22.0165 2.72427 22.0736 2.71127 22.1254 2.68783C22.1618 2.70413 22.1948 2.72482 22.2331 2.73745C22.5105 2.82827 22.7438 3.00698 22.9074 3.25381C23.2145 3.71633 23.1856 4.36581 22.8395 4.79776Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M11.658 16.4385C11.4143 16.3929 11.1907 16.5553 11.1486 16.7937C11.0664 17.254 10.9225 17.7026 10.72 18.1291C10.616 18.3483 10.7095 18.6099 10.9285 18.7139C10.9897 18.7425 11.0532 18.7566 11.1166 18.7566C11.2808 18.7566 11.4385 18.6639 11.5135 18.5059C11.7494 18.0091 11.9175 17.4853 12.0132 16.9484C12.0559 16.7089 11.8964 16.4811 11.658 16.4385Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M9.97272 19.3025C9.03705 20.4372 7.66614 21.2273 6.21173 21.4701C5.97241 21.51 5.81073 21.7361 5.85083 21.9751C5.88635 22.1897 6.07257 22.342 6.28333 22.342C6.3075 22.342 6.33112 22.3404 6.35584 22.336C8.0166 22.0589 9.58252 21.1564 10.6504 19.8606C10.8049 19.6736 10.7782 19.3969 10.5907 19.2428C10.4041 19.0882 10.1265 19.1155 9.97272 19.3025Z"
                                                            fill="currentColor"
                                                    />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip1">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                Chicken & Meat
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                        d="M19.9111 2.61823H19.699V2.25677C19.699 1.49414 19.0794 0.873596 18.3519 0.873596C18.3516 0.873596 18.351 0.873596 18.3499 0.873596L5.66071 0C4.89697 0 4.27643 0.621094 4.27643 1.38373V2.61823H4.06476C3.21936 2.61823 2.53125 3.30615 2.53125 4.15173V6.10895C2.53125 6.95435 3.21918 7.64246 4.06476 7.64246H4.11292L5.59735 22.6163C5.59735 23.3789 6.2179 24 6.98145 24H17.0178C17.2084 24 17.3904 23.9612 17.556 23.8916C18.0524 23.6836 18.401 23.2006 18.3995 22.6663L19.8865 7.64191H19.9116C20.757 7.64191 21.4451 6.95398 21.4451 6.1084V4.15173C21.4446 3.30634 20.7565 2.61823 19.9111 2.61823ZM5.29871 1.38373C5.29871 1.18433 5.46075 1.02228 5.62537 1.02136L18.3153 1.89496C18.5147 1.89496 18.6771 2.05701 18.6771 2.25677V2.61823H5.29871V1.38373ZM18.4426 11.7078L15.698 12.1976C14.7693 11.1134 13.4401 10.4974 12.0048 10.4974C10.5688 10.4974 9.23987 11.1134 8.31097 12.1981L5.55634 11.7074L5.14178 7.64246H18.8575L18.4426 11.7078ZM18.353 12.7625L17.9562 16.7781L15.2715 16.2839L15.0815 16.5364C14.3443 17.5164 13.223 18.0787 12.0053 18.0787C10.7871 18.0787 9.66559 17.5164 8.92859 16.5364L8.73834 16.2845L6.04449 16.7787L5.64679 12.7625L8.73944 13.3125L8.92859 13.062C9.66577 12.082 10.7873 11.5197 12.0053 11.5197C13.223 11.5197 14.3445 12.082 15.0815 13.062L15.2706 13.313L18.353 12.7625ZM17.0173 22.9775H6.9809C6.93201 22.9775 6.88495 22.9675 6.84192 22.9479C6.71265 22.8896 6.61908 22.7507 6.61707 22.5656L6.61047 22.4993L6.15198 17.7975L8.31226 17.4012C9.24097 18.485 10.5696 19.1005 12.0049 19.1005C13.4398 19.1005 14.7684 18.485 15.6971 17.4018L17.8477 17.7975L17.3795 22.6163C17.3787 22.812 17.2136 22.9775 17.0173 22.9775ZM20.4223 6.10895C20.4223 6.39111 20.1929 6.62018 19.9111 6.62018H4.06476C3.78314 6.62018 3.55371 6.39111 3.55371 6.10895V4.15173C3.55371 3.86957 3.78314 3.6405 4.06476 3.6405H19.9111C20.1929 3.6405 20.4223 3.86957 20.4223 4.15173V6.10895Z"
                                                        fill="currentColor"
                                                />
                                                <path
                                                        d="M11.9879 12.2681C10.4376 12.2681 9.17651 13.4147 9.17651 14.8239C9.17651 16.2332 10.4376 17.3798 11.9879 17.3798C13.5383 17.3798 14.7995 16.2332 14.7995 14.8239C14.7995 13.4147 13.5377 12.2681 11.9879 12.2681ZM11.9879 16.3575C11.0013 16.3575 10.1988 15.6694 10.1988 14.8239C10.1988 13.9785 11.0013 13.2903 11.9879 13.2903C12.9745 13.2903 13.777 13.9785 13.777 14.8239C13.777 15.6694 12.9739 16.3575 11.9879 16.3575Z"
                                                        fill="currentColor"
                                                />
                                            </svg>
                                        </span>
                                Drink & Water
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip2)">
                                                    <path
                                                            d="M12.2113 0H11.7577C8.53142 0 5.90625 2.62518 5.90625 5.85148V17.8222C5.90625 18.9457 6.82013 19.8597 7.94402 19.8597H10.4474V22.7588C10.4474 23.4431 11.0043 23.9999 11.6887 23.9999H12.1025C12.7868 23.9999 13.3436 23.4431 13.3436 22.7588V19.8594H16.0246C17.1483 19.8594 18.0624 18.9453 18.0624 17.8216V5.85148C18.0628 2.62518 15.4376 0 12.2113 0V0ZM12.5165 22.7583C12.5165 22.9866 12.3312 23.1721 12.1029 23.1721H11.6891C11.4607 23.1721 11.2753 22.9866 11.2753 22.7583V19.8621H12.5165V22.7583ZM17.2351 17.8216C17.2351 18.4887 16.692 19.0317 16.025 19.0317H7.94439C7.27752 19.0317 6.73425 18.4887 6.73425 17.8216V5.85148C6.73425 3.08111 8.98791 0.827451 11.7583 0.827451H12.2117C14.9817 0.827451 17.2357 3.08111 17.2357 5.85148V17.8216H17.2351Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M15.4176 8.81598C15.1889 8.81598 15.004 9.00092 15.004 9.22961V11.2707C15.004 11.6678 14.6812 11.9905 14.284 11.9905C13.8868 11.9905 13.564 11.6678 13.564 11.2707V9.22961C13.564 9.00092 13.3791 8.81598 13.1504 8.81598C12.9215 8.81598 12.7366 9.00092 12.7366 9.22961V11.2707C12.7366 12.1241 13.4309 12.8181 14.284 12.8181C15.1371 12.8181 15.8314 12.1238 15.8314 11.2707V9.22961C15.8314 9.00092 15.6465 8.81598 15.4176 8.81598Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M11.4799 14.5047C11.251 14.5047 11.0661 14.6896 11.0661 14.9185V16.0521C11.0661 16.4493 10.7429 16.7721 10.3458 16.7721C9.94861 16.7721 9.62598 16.4493 9.62598 16.0521V14.9185C9.62598 14.6896 9.44104 14.5047 9.21216 14.5047C8.98328 14.5047 8.79834 14.6896 8.79834 14.9185V16.0521C8.79834 16.9058 9.49268 17.5995 10.3458 17.5995C11.1989 17.5995 11.8936 16.9052 11.8936 16.0521V14.9185C11.8936 14.6896 11.7083 14.5047 11.4799 14.5047Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M10.171 8.26648C11.0244 8.26648 11.7182 7.57214 11.7182 6.71906V5.58545C11.7182 5.35657 11.5333 5.17163 11.3046 5.17163C11.0757 5.17163 10.8907 5.35657 10.8907 5.58545V6.71906C10.8907 7.11621 10.5681 7.43903 10.171 7.43903C9.77362 7.43903 9.45099 7.11621 9.45099 6.71906V5.58545C9.45099 5.35657 9.26605 5.17163 9.03717 5.17163C8.80847 5.17163 8.62354 5.35657 8.62354 5.58545V6.71906C8.62317 7.57269 9.31732 8.26648 10.171 8.26648Z"
                                                            fill="currentColor"
                                                    />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip2">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                Yoguart & Ice Cream
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip3)">
                                                    <path
                                                            d="M12.1725 9.21849C12.2278 9.42229 12.412 9.55632 12.6138 9.55632C12.6531 9.55632 12.6934 9.55138 12.7335 9.54039L14.7074 9.00609C14.9513 8.94035 15.0952 8.68913 15.0295 8.44542C14.9636 8.20134 14.7129 8.05485 14.4683 8.12352L12.4944 8.65764C12.2507 8.72355 12.1065 8.97459 12.1725 9.21849Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M4.99516 11.688L6.36717 12.1454C6.41514 12.1613 6.46421 12.1692 6.51164 12.1692C6.70335 12.1692 6.88169 12.048 6.94578 11.8563C7.0258 11.6168 6.89634 11.3573 6.65666 11.2778L5.28465 10.8205C5.04442 10.7399 4.78606 10.8699 4.70604 11.1094C4.62602 11.3496 4.75548 11.6085 4.99516 11.688Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M9.97185 10.8812C9.98137 10.8818 9.99053 10.8821 9.99968 10.8821C10.2399 10.8821 10.4415 10.6952 10.4556 10.4522L10.4941 9.80655C10.5093 9.55405 10.3172 9.33762 10.065 9.32261C9.80852 9.30942 9.5963 9.50003 9.58129 9.75162L9.54284 10.3974C9.52764 10.6503 9.71971 10.8666 9.97185 10.8812Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M18.0794 12.847C18.1688 12.9362 18.2858 12.9811 18.4028 12.9811C18.52 12.9811 18.637 12.9362 18.7262 12.847C18.905 12.6682 18.905 12.379 18.7262 12.2003L18.2689 11.7429C18.09 11.5642 17.8009 11.5642 17.6222 11.7429C17.4433 11.9218 17.4433 12.2109 17.6222 12.3896L18.0794 12.847Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M13.9241 11.7426C13.7452 11.5637 13.4562 11.5637 13.2773 11.7426C13.0986 11.9213 13.0986 12.2104 13.2773 12.3891L13.7347 12.8465C13.8239 12.9357 13.9411 12.9805 14.0581 12.9805C14.1753 12.9805 14.2923 12.9357 14.3815 12.8465C14.5604 12.6676 14.5604 12.3787 14.3815 12.1998L13.9241 11.7426Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M12.386 4.71444C12.4382 4.92244 12.6243 5.06105 12.8291 5.06105C12.8663 5.06105 12.9033 5.05648 12.9408 5.04732C13.186 4.98616 13.3347 4.73769 13.2737 4.49306L12.8163 2.66366C12.755 2.41811 12.5058 2.27035 12.2615 2.33077C12.0165 2.39211 11.8678 2.6404 11.9286 2.88503L12.386 4.71444Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M10.3046 7.46301C10.3937 7.55219 10.5107 7.59705 10.6279 7.59705C10.7449 7.59705 10.8621 7.55219 10.9513 7.46301C11.1302 7.28412 11.1302 6.99518 10.9513 6.81628L10.4939 6.35889C10.315 6.18018 10.0261 6.18018 9.84717 6.35889C9.66846 6.53778 9.66846 6.8269 9.84717 7.00562L10.3046 7.46301Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M23.7557 14.5091C23.389 14.1464 22.9627 13.8792 22.509 13.7014C22.5148 13.6111 22.5194 13.5234 22.5194 13.4383C22.5194 11.367 21.1553 9.59711 19.2065 9.04559C19.2805 8.76379 19.318 8.47375 19.318 8.17877C19.318 6.3338 17.8541 4.82446 16.0265 4.7514C16.064 4.53735 16.0827 4.32202 16.0827 4.10522C16.0827 1.84167 14.4747 0 12.499 0H11.978C10.0018 0 8.39374 1.84131 8.39374 4.10522C8.39374 4.32147 8.4126 4.53699 8.44958 4.75104C6.61414 4.81494 5.14069 6.32794 5.14069 8.17877C5.14069 8.43896 5.16943 8.69513 5.22656 8.94489C3.08533 9.336 1.48187 11.2088 1.48187 13.4383C1.48187 13.5244 1.48627 13.6126 1.49231 13.7032C1.03857 13.881 0.612854 14.1467 0.246094 14.5082L0 14.7501L4.38776 22.8181C4.66461 23.5009 5.34009 23.9573 6.07874 23.9573H17.9218C18.6605 23.9573 19.3359 23.5009 19.6126 22.8181L24 14.7508L23.7557 14.5091ZM2.39612 13.4694C2.39612 13.4594 2.39612 13.4489 2.39612 13.4388C2.39612 11.4983 3.91534 9.89575 5.85498 9.79047C6.00366 9.78186 6.13898 9.70276 6.21771 9.57605C6.29681 9.44989 6.30927 9.29333 6.25159 9.15582C6.12122 8.84564 6.05493 8.51733 6.05493 8.17896C6.05493 6.7923 7.18323 5.66345 8.57025 5.66345C8.62207 5.66345 8.74365 5.66931 8.98004 5.70996C9.14008 5.73615 9.30396 5.67719 9.40778 5.55176C9.51251 5.42706 9.54218 5.25586 9.48651 5.10315C9.36804 4.77667 9.30817 4.44141 9.30817 4.10522C9.30817 2.34576 10.5059 0.914795 11.9777 0.914795H12.4986C13.9702 0.914795 15.1677 2.34576 15.1677 4.10522C15.1677 4.44177 15.1077 4.77795 14.9888 5.10406C14.933 5.25824 14.9636 5.43018 15.0692 5.55505C15.1745 5.67993 15.3387 5.73981 15.5006 5.71051C15.7128 5.67169 15.8286 5.66345 15.8881 5.66345C17.2751 5.66345 18.4034 6.79211 18.4034 8.17896C18.4034 8.53015 18.3307 8.87183 18.1877 9.19464C18.1304 9.32446 18.1364 9.47314 18.204 9.59802C18.2712 9.72235 18.3935 9.80878 18.5334 9.83167C20.3134 10.119 21.605 11.636 21.605 13.4388V13.4685C21.5641 13.4636 21.5235 13.4636 21.4823 13.4599C21.4197 13.4544 21.3571 13.4489 21.2939 13.4462C21.2441 13.4443 21.1943 13.4443 21.1445 13.4449C21.0749 13.4449 21.0053 13.4462 20.9359 13.4504C20.8914 13.4531 20.8477 13.4562 20.8037 13.4604C20.7277 13.4672 20.6519 13.4767 20.5763 13.4886C20.5389 13.4947 20.5014 13.5005 20.4642 13.5075C20.382 13.5225 20.3002 13.5414 20.2187 13.5624C20.1881 13.5701 20.1575 13.5775 20.1273 13.5862C20.0394 13.611 19.9534 13.6403 19.8675 13.6712C19.8433 13.68 19.819 13.6877 19.7948 13.6974C19.7042 13.7325 19.6155 13.7723 19.5271 13.8149C19.5084 13.8241 19.4886 13.8318 19.47 13.8415C19.3762 13.8885 19.2847 13.9407 19.1946 13.9966C19.1827 14.0037 19.1704 14.0098 19.1585 14.0176C19.0571 14.0821 18.9582 14.1508 18.8622 14.2256C18.7749 14.1572 18.6797 14.1053 18.5878 14.0455C17.2811 13.1966 15.5533 13.2482 14.3112 14.2251C12.9816 13.1797 11.0883 13.1807 9.75916 14.226C8.41772 13.1796 6.505 13.1796 5.16412 14.2275C5.00629 14.1039 4.83893 13.9979 4.66699 13.9037C4.65509 13.8973 4.64374 13.8895 4.63129 13.8831C4.46393 13.7935 4.29053 13.7197 4.11365 13.6577C4.09259 13.6503 4.0719 13.6421 4.05103 13.6351C3.87891 13.578 3.70331 13.5346 3.52588 13.5029C3.4953 13.4974 3.46454 13.4925 3.43396 13.4874C3.26074 13.4614 3.08643 13.4464 2.91119 13.4445C2.89526 13.4445 2.8797 13.4403 2.86377 13.4403C2.83575 13.4403 2.80792 13.4449 2.77954 13.4453C2.68304 13.4476 2.58655 13.4535 2.4906 13.4632C2.45837 13.4667 2.42706 13.4654 2.39612 13.4694ZM18.7958 22.4055L18.7705 22.4595C18.6365 22.8085 18.2953 23.0427 17.9218 23.0427H6.07874C5.70502 23.0427 5.36389 22.808 5.22986 22.4595L1.14294 14.937C1.54688 14.6255 2.01929 14.4413 2.50452 14.3796C2.53931 14.3751 2.57355 14.3751 2.60834 14.3723C2.72369 14.3617 2.83923 14.358 2.95496 14.3617C3.00256 14.3632 3.05017 14.3663 3.09723 14.3699C3.20984 14.3791 3.32135 14.3956 3.43213 14.4181C3.46948 14.4258 3.50757 14.43 3.54456 14.4391C3.68408 14.4734 3.82141 14.5192 3.95526 14.575C3.99609 14.5919 4.03436 14.6129 4.07428 14.6321C4.17352 14.6792 4.27094 14.7318 4.36523 14.7907C4.40588 14.8163 4.44653 14.8416 4.4859 14.8694C4.60803 14.9555 4.72687 15.0483 4.83673 15.1558C4.83856 15.1577 4.84076 15.1589 4.84259 15.1608C4.84259 15.1608 4.84314 15.1608 4.84351 15.1613L5.16357 15.4764L5.48456 15.1608C5.55011 15.0967 5.62463 15.0487 5.69403 14.9921C6.79175 14.1033 8.41443 14.1506 9.43927 15.1608L9.76172 15.4781L10.0827 15.1589C10.6051 14.6389 11.2864 14.3763 11.9725 14.3608C11.9936 14.3604 12.0146 14.3549 12.0357 14.3549C12.0595 14.3549 12.0831 14.3613 12.1075 14.3619C12.6138 14.3751 13.1173 14.5197 13.5555 14.8074C13.7086 14.9079 13.8536 15.0251 13.9882 15.1589L14.311 15.4801L14.6334 15.1595H14.6338C14.7684 15.0255 14.9138 14.9079 15.0665 14.8072C16.1376 14.1039 17.5966 14.2214 18.5387 15.1589L18.8608 15.479L19.1836 15.1599C19.2947 15.05 19.415 14.9559 19.5385 14.8685C19.5769 14.8416 19.6166 14.8163 19.6564 14.7913C19.7507 14.7318 19.8475 14.6792 19.947 14.632C19.9861 14.6133 20.0242 14.5922 20.0645 14.5754C20.1971 14.5199 20.3324 14.4747 20.471 14.4404C20.5098 14.4307 20.5497 14.4258 20.5889 14.4181C20.697 14.3961 20.8054 14.38 20.9147 14.3708C20.9626 14.3668 21.0112 14.3635 21.0597 14.3622C21.173 14.3586 21.2869 14.3628 21.3999 14.3727C21.4356 14.376 21.4708 14.376 21.5065 14.38C21.989 14.4413 22.4583 14.6255 22.8598 14.9366L18.7958 22.4055Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M6.03832 16.52C5.97149 16.2763 5.71898 16.13 5.47674 16.199C5.23284 16.2658 5.08928 16.5169 5.15557 16.7606L6.52776 21.7914C6.58343 21.995 6.76745 22.1285 6.9685 22.1285C7.00842 22.1285 7.04906 22.1236 7.08935 22.1126C7.33306 22.0458 7.4768 21.7947 7.41033 21.5508L6.03832 16.52Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M18.5231 16.1984C18.2784 16.1321 18.0278 16.2757 17.9615 16.5194L16.5895 21.5499C16.523 21.7932 16.6667 22.0448 16.9105 22.1114C16.9507 22.1226 16.9914 22.1276 17.0311 22.1276C17.2324 22.1276 17.4167 21.9941 17.472 21.7905L18.8441 16.76C18.9105 16.5168 18.767 16.2652 18.5231 16.1984Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M14.3285 16.1843C14.076 16.1627 13.8548 16.3471 13.8317 16.5982L13.3745 21.6286C13.3516 21.8806 13.5367 22.1029 13.7888 22.1258C13.8029 22.127 13.8167 22.1276 13.8304 22.1276C14.0646 22.1276 14.264 21.9487 14.2854 21.7118L14.7428 16.6813C14.7652 16.4299 14.58 16.2072 14.3285 16.1843Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M9.67205 16.1844C9.42046 16.2071 9.23479 16.4299 9.25749 16.6813L9.71489 21.7118C9.73632 21.9493 9.9359 22.1276 10.1701 22.1276C10.1836 22.1276 10.1979 22.1271 10.2117 22.1258C10.4632 22.1029 10.6489 21.8806 10.626 21.6287L10.1686 16.5982C10.1457 16.3475 9.9262 16.1637 9.67205 16.1844Z"
                                                            fill="currentColor"
                                                    />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip3">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                Cake & Bread
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip4)">
                                                    <path
                                                            d="M8.56854 8.42359C8.37994 8.28297 8.11407 8.3238 7.97473 8.5124L6.96453 9.87764C6.82482 10.0659 6.86474 10.3321 7.05315 10.4714L8.41857 11.482C8.492 11.5364 8.58081 11.5653 8.67126 11.5653C8.69213 11.5653 8.71319 11.5637 8.7337 11.5607C8.84539 11.5441 8.94555 11.4833 9.0122 11.393L10.0226 10.0272C10.1623 9.83863 10.1224 9.57277 9.93378 9.43342L8.56854 8.42359ZM8.58191 10.5465L7.89947 10.0417L8.40448 9.35926L9.08691 9.86409L8.58191 10.5465Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M21.3804 9.63265L19.7146 9.30013C19.4851 9.25179 19.261 9.4034 19.215 9.63356L18.8825 11.2995C18.8368 11.5291 18.9858 11.7525 19.216 11.7988L20.8818 12.1313C20.9095 12.1373 20.9379 12.1399 20.965 12.1399C21.1635 12.1399 21.3409 12.0002 21.3808 11.7981L21.7133 10.132C21.7597 9.90236 21.6106 9.67897 21.3804 9.63265ZM20.6314 11.2154L19.7986 11.049L19.965 10.2162L20.7978 10.3826L20.6314 11.2154Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M16.3694 10.4017C16.3057 10.1757 16.0695 10.0437 15.8457 10.1087L14.2108 10.5703C13.9848 10.6335 13.8535 10.8684 13.9176 11.0938L14.3792 12.7287C14.4319 12.9157 14.6022 13.0384 14.7874 13.0384C14.826 13.0384 14.8646 13.0333 14.9029 13.0223L16.5378 12.5607C16.7638 12.4973 16.8951 12.2626 16.8308 12.037L16.3694 10.4017ZM15.0809 12.089L14.8503 11.2714L15.6677 11.0409L15.8984 11.8583L15.0809 12.089Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M24 11.5862C24 10.9631 23.6382 10.4081 22.9235 9.93291C22.929 9.8679 22.9319 9.80382 22.9319 9.7401C22.9319 8.4525 21.8839 7.4044 20.5963 7.4044C20.2434 7.4044 19.9016 7.48424 19.5877 7.63915C19.1651 6.97539 18.4276 6.55516 17.6235 6.55516C17.1806 6.55516 16.7538 6.67986 16.3848 6.91313C15.989 6.4702 15.4378 6.1895 14.8455 6.13896L13.791 4.88652C13.7188 4.80028 13.6148 4.74644 13.5026 4.73674C13.4337 4.72813 13.3689 4.74388 13.3081 4.76988C13.2673 4.78728 13.227 4.80595 13.1926 4.83525L12.4329 5.47484L12.1408 5.7202C12.0536 5.7105 11.9713 5.70573 11.8907 5.70573C11.2515 5.70573 10.6437 5.94817 10.1754 6.38139C9.85052 6.21623 9.49512 6.13054 9.13019 6.13054C8.4657 6.13054 7.83508 6.42186 7.39636 6.91313C7.02722 6.68004 6.60059 6.55516 6.15765 6.55516C5.49335 6.55516 4.86877 6.84172 4.42969 7.33482L2.50342 6.62254C2.28387 6.54015 2.03888 6.65312 1.95813 6.87358L1.49066 8.13646C1.07611 8.57262 0.849426 9.13841 0.849426 9.7401C0.849426 9.85124 0.858765 9.9622 0.878174 10.0794C0.295166 10.521 0 11.0264 0 11.5862C0 13.1931 1.30499 14.5091 2.97729 14.6136L3.92688 15.5233C4.43994 16.0149 4.66974 16.3114 5.01709 16.7611C5.13208 16.9101 5.25824 17.0733 5.41022 17.2635C6.54767 18.6879 7.68347 19.2951 9.20856 19.2951H14.9767C16.5022 19.2951 17.6382 18.6874 18.7749 17.2635C18.9261 17.0742 19.0527 16.9107 19.1677 16.7616C19.5156 16.3119 19.7452 16.0149 20.2582 15.5233L21.2087 14.6124C22.8131 14.5074 24 13.2407 24 11.5862ZM13.4149 5.75792L13.9618 6.40776L13.312 6.95433L12.7654 6.30504L13.4149 5.75792ZM4.15228 8.13774L3.58081 9.68352L2.03503 9.11205L2.60651 7.56627L4.15228 8.13774ZM19.6714 14.9104C19.1125 15.4458 18.854 15.7796 18.496 16.2422C18.3834 16.3883 18.2595 16.548 18.1117 16.7334C17.1405 17.9498 16.2321 18.4458 14.9767 18.4458H9.20892C7.95355 18.4458 7.04517 17.9498 6.07397 16.7334C5.92529 16.5476 5.8017 16.3874 5.68927 16.2418C5.33167 15.7793 5.07349 15.4455 4.51465 14.9104L4.11584 14.5283C4.24786 14.5003 4.37531 14.4646 4.50018 14.425C4.53571 14.414 4.57013 14.4012 4.60492 14.3893C4.69757 14.3575 4.78766 14.3227 4.87555 14.2848C4.90906 14.2705 4.94257 14.2568 4.97534 14.2416C5.20367 14.1354 5.41388 14.0092 5.60248 13.8666C5.62976 13.8462 5.65503 13.8244 5.6814 13.8032C5.74896 13.7485 5.8136 13.6915 5.87476 13.6326C5.89893 13.6091 5.92346 13.5862 5.94653 13.5624C6.02509 13.4809 6.09888 13.3973 6.16443 13.309C6.74432 14.0929 7.85962 14.6246 9.13696 14.6246C10.4145 14.6246 11.5296 14.0929 12.1097 13.309C12.6898 14.0929 13.8049 14.6246 15.0824 14.6246C16.3552 14.6246 17.4668 14.0971 18.0487 13.3178C18.1132 13.4062 18.1862 13.4899 18.264 13.571C18.2856 13.5934 18.3085 13.6152 18.3311 13.6371C18.3931 13.6979 18.4585 13.7561 18.5277 13.8122C18.5515 13.8312 18.5744 13.8508 18.5986 13.8695C18.7863 14.0127 18.9965 14.1383 19.2263 14.2439C19.255 14.2577 19.2852 14.2699 19.3151 14.2826C19.4072 14.3221 19.5015 14.3587 19.5987 14.3919C19.6293 14.4023 19.6589 14.4129 19.6901 14.4228C19.8144 14.4618 19.9418 14.4975 20.0739 14.5256L19.6714 14.9104ZM21.0104 13.7735C19.615 13.7671 18.4794 13.0058 18.4794 12.0758C18.4794 11.8409 18.2897 11.651 18.0547 11.651C17.8198 11.651 17.6301 11.8409 17.6301 12.0758C17.6301 12.9964 16.463 13.7745 15.082 13.7745C13.701 13.7745 12.5341 12.9964 12.5341 12.0758C12.5341 11.8409 12.3442 11.651 12.1093 11.651C11.8746 11.651 11.6847 11.8409 11.6847 12.0758C11.6847 12.9964 10.5178 13.7745 9.13678 13.7745C7.75562 13.7745 6.58868 12.9964 6.58868 12.0758C6.58868 11.8409 6.3988 11.651 6.16406 11.651C5.92914 11.651 5.73944 11.8409 5.73944 12.0758C5.73944 12.9964 4.57233 13.7745 3.15875 13.7745C1.88507 13.7745 0.849426 12.793 0.849426 11.586C0.849426 11.2599 1.09698 10.9354 1.58533 10.6212C1.74243 10.5201 1.81494 10.3282 1.76404 10.1481C1.73767 10.056 1.72211 9.97484 1.71185 9.89793L3.68481 10.6276C3.73315 10.6459 3.78296 10.6543 3.83221 10.6543C4.00452 10.6543 4.1673 10.5485 4.23047 10.3769L5.09692 8.03465C5.11908 7.97588 5.12402 7.91399 5.11908 7.85283C5.3941 7.57213 5.76324 7.40477 6.1582 7.40477C6.54218 7.40477 6.90729 7.55327 7.18671 7.82225C7.28101 7.91234 7.40936 7.95519 7.54083 7.93724C7.67047 7.91893 7.78381 7.84221 7.84973 7.72923C8.12054 7.2603 8.6001 6.97997 9.13129 6.97997C9.44128 6.97997 9.74194 7.07903 10.0005 7.26671C10.1836 7.39909 10.4372 7.36522 10.5793 7.19072C10.9021 6.79283 11.3714 6.56468 11.8691 6.55791L12.9368 7.82646C13.0204 7.92625 13.1406 7.97752 13.262 7.97752C13.3585 7.97752 13.4551 7.94493 13.535 7.87828L14.5966 6.98473C14.6155 6.98344 14.6332 6.97997 14.6519 6.97997C15.1831 6.97997 15.6627 7.25993 15.9335 7.72923C15.9988 7.84258 16.1127 7.91893 16.2422 7.93724C16.3744 7.9572 16.5022 7.9127 16.5965 7.82225C16.8759 7.5529 17.241 7.40477 17.625 7.40477C18.2459 7.40477 18.8057 7.80174 19.0175 8.39171C19.0638 8.5208 19.1691 8.61876 19.3011 8.65666C19.4321 8.69402 19.5738 8.666 19.6816 8.58067C19.9508 8.36699 20.2676 8.25365 20.5977 8.25365C21.4173 8.25365 22.084 8.92033 22.084 9.73991C22.084 9.8419 22.0726 9.94499 22.0485 10.056C22.0085 10.2365 22.0909 10.4216 22.251 10.5141C22.849 10.8594 23.1522 11.2196 23.1522 11.5856C23.1508 12.8274 22.2288 13.7677 21.0104 13.7735Z"
                                                            fill="currentColor"
                                                    />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip4">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                Butter & Cream
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                        <span class="icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip5)">
                                                    <path
                                                            d="M7.29335 8.33314C7.37136 8.41114 7.47371 8.45032 7.57625 8.45032C7.67861 8.45032 7.78096 8.41114 7.85897 8.33314C8.01534 8.17676 8.01534 7.92389 7.85897 7.76752C7.45302 7.36121 7.45302 6.70038 7.85897 6.29406C8.20705 5.94598 8.39895 5.48364 8.39895 4.99163C8.39895 4.49962 8.20742 4.0371 7.85897 3.68919C7.7026 3.53264 7.44973 3.53264 7.29335 3.68919C7.13698 3.84557 7.13698 4.09844 7.29335 4.25463C7.49019 4.45147 7.59914 4.71312 7.59914 4.99145C7.59914 5.26995 7.49056 5.53143 7.29335 5.72827C6.57539 6.44623 6.57539 7.61518 7.29335 8.33314Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M16.0932 8.33314C16.1712 8.41114 16.2735 8.45032 16.3759 8.45032C16.4784 8.45032 16.5808 8.41114 16.6588 8.33314C16.8151 8.17676 16.8151 7.92389 16.6588 7.76752C16.2528 7.36121 16.2528 6.70038 16.6588 6.29406C17.0067 5.94598 17.1987 5.48364 17.1987 4.99163C17.1987 4.49962 17.0072 4.0371 16.6588 3.68919C16.5024 3.53264 16.2495 3.53264 16.0932 3.68919C15.9368 3.84557 15.9368 4.09844 16.0932 4.25463C16.29 4.45147 16.3988 4.71312 16.3988 4.99145C16.3988 5.26995 16.2904 5.53143 16.0932 5.72827C15.3752 6.44623 15.3752 7.61518 16.0932 8.33314Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M11.693 5.93316C11.771 6.01116 11.8735 6.05035 11.9759 6.05035C12.0783 6.05035 12.1806 6.01116 12.2586 5.93316C12.4152 5.77679 12.4152 5.52392 12.2586 5.36754C11.8527 4.96123 11.8527 4.3004 12.2586 3.89391C12.6067 3.54601 12.7986 3.08348 12.7986 2.59148C12.7986 2.09966 12.6071 1.63713 12.2586 1.28923C12.1022 1.13268 11.8494 1.13268 11.6932 1.28923C11.5366 1.4456 11.5366 1.69829 11.6932 1.85466C11.8898 2.0515 11.9988 2.31316 11.9988 2.59148C11.9988 2.8698 11.8904 3.13146 11.6932 3.3283C10.975 4.04625 10.975 5.2152 11.693 5.93316Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M10.0912 11.4551C10.1203 11.4551 10.15 11.452 10.1797 11.4456C10.7548 11.3159 11.3495 11.2502 11.9481 11.2502H11.9532C12.1741 11.2502 12.3531 11.0715 12.3531 10.8506C12.3531 10.6295 12.1744 10.4504 11.9532 10.4504C11.9516 10.4504 11.9496 10.4504 11.9476 10.4504C11.2904 10.4504 10.6363 10.5227 10.0037 10.6652C9.788 10.7135 9.65287 10.9276 9.70121 11.1431C9.74369 11.3291 9.9083 11.4551 10.0912 11.4551Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M3.88141 18.0436C3.90594 18.0484 3.92993 18.0504 3.95337 18.0504C4.14306 18.0504 4.31152 17.9151 4.34668 17.7223C4.76233 15.4431 6.13581 13.4151 8.02107 12.2983C8.21095 12.1861 8.27394 11.9403 8.16151 11.7503C8.04872 11.5604 7.80354 11.4976 7.61347 11.61C5.53174 12.843 4.01672 15.0744 3.55987 17.5783C3.51995 17.7961 3.66388 18.0039 3.88141 18.0436Z"
                                                            fill="currentColor"
                                                    />
                                                    <path
                                                            d="M22.2027 17.4996C21.478 13.2431 18.1599 9.86115 13.9358 9.04194C13.9428 8.97803 13.953 8.91358 13.953 8.85004C13.953 7.74719 13.056 6.84998 11.9532 6.84998C10.8503 6.84998 9.95309 7.74719 9.95309 8.85004C9.95309 8.91358 9.96316 8.97803 9.97031 9.04194C5.74623 9.86115 2.42835 13.2431 1.70344 17.4996C0.867556 17.9727 -0.046875 18.6691 -0.046875 19.4504C-0.046875 21.4844 6.15786 22.8503 11.9532 22.8503C17.7483 22.8503 23.9532 21.4844 23.9532 19.4504C23.9532 18.6691 23.0388 17.9727 22.2027 17.4996ZM10.7556 8.91907C10.754 8.89582 10.7531 8.87275 10.7531 8.85023C10.7531 8.18866 11.2916 7.65015 11.9532 7.65015C12.6147 7.65015 13.1532 8.18866 13.1532 8.85023C13.1532 8.87311 13.1525 8.89582 13.1509 8.91907C13.132 8.91706 13.1131 8.91633 13.0948 8.91431C12.9573 8.89911 12.8187 8.88831 12.6795 8.87861C12.6285 8.87513 12.5776 8.86982 12.5265 8.86707C12.3368 8.85663 12.146 8.85059 11.9537 8.85059C11.7613 8.85059 11.5705 8.85663 11.3808 8.86707C11.3297 8.86982 11.2788 8.87513 11.2277 8.87861C11.0885 8.88831 10.9501 8.89948 10.8124 8.91431C10.7932 8.91633 10.7743 8.91669 10.7556 8.91907ZM10.5127 9.75843C10.7274 9.72639 10.9435 9.70313 11.1603 9.68555C11.2048 9.68189 11.2491 9.67878 11.2934 9.67567C11.7327 9.646 12.174 9.646 12.6131 9.67567C12.6576 9.67878 12.7019 9.68189 12.7464 9.68555C12.9632 9.70313 13.1792 9.72639 13.3938 9.75843C17.5611 10.3883 20.8567 13.7071 21.4547 17.8849C21.473 18.0132 21.4879 18.1419 21.501 18.2708C21.5054 18.3152 21.5115 18.3591 21.5155 18.4036C21.5311 18.5807 21.5426 18.7579 21.5483 18.9352C15.2643 20.3916 8.6426 20.3916 2.35859 18.9352C2.36463 18.7579 2.3758 18.5807 2.39136 18.4036C2.39539 18.3591 2.40107 18.3152 2.40565 18.2708C2.41883 18.1416 2.43366 18.0127 2.45216 17.8849C3.05 13.7071 6.34554 10.3879 10.5127 9.75843ZM11.9532 22.0503C5.1147 22.0503 0.753115 20.3427 0.753115 19.4504C0.753115 19.2972 0.94263 18.9597 1.57874 18.5193C1.57709 18.542 1.57782 18.5644 1.57618 18.5873C1.56263 18.8064 1.55311 19.0273 1.55311 19.2505V19.5656L1.85981 19.6396C5.16158 20.4317 8.55746 20.8285 11.953 20.8285C15.3487 20.8285 18.7447 20.432 22.0463 19.6396L22.353 19.5656V19.2505C22.353 19.0273 22.3435 18.8068 22.3298 18.5873C22.3283 18.5644 22.329 18.542 22.3274 18.5193C22.9635 18.9597 23.153 19.2972 23.153 19.4504C23.1532 20.3427 18.7916 22.0503 11.9532 22.0503Z"
                                                            fill="currentColor"
                                                    />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip5">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                Cooking
                            </a>
                        </li>

                        <li class="card-category--view-all">
                            <a href="#">
                                        <span class="icon">
                                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M8.25 0.75V8.25H0.75V9.75H8.25V17.25H9.75V9.75H17.25V8.25H9.75V0.75H8.25Z" fill="currentColor" />
                                            </svg>
                                        </span>
                                View all Category
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-xl-9 order-1 order-xl-0">
                    <div class="swiper-container banner-slider--02">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="banner__wrapper-img banner__wrapper--img-01">
                                    <img src="src/images/banner/banner-lg-01.png" alt="banner" />

                                    <div class="banner__wrapper-text">
                                        <h2 class="font-title--xl">
                                            Fresh & Healthy Organic Food
                                        </h2>
                                        <div class="sale-off">
                                            <h5 class="font-body--xxxl-500">Sale up to <span>48% </span>off</h5>
                                        </div>
                                        <a href="#" class="button button--md">
                                            Shop now
                                            <span>
                                                        <svg width="17" height="15" viewBox="0 0 17 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M16 7.50049H1" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            <path d="M9.95001 1.47559L16 7.49959L9.95001 13.5246" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                        </svg>
                                                    </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="banner__wrapper-img banner__wrapper--img-02">
                                    <img src="src/images/banner/banner-lg-01.png" alt="banner" />

                                    <div class="banner__wrapper-text">
                                        <h2 class="font-title--xl">
                                            Fresh & Healthy Organic Food
                                        </h2>
                                        <div class="sale-off">
                                            <h5 class="font-body--xxxl-500">Sale up to <span>48% </span>off</h5>
                                        </div>
                                        <a href="#" class="button button--md">
                                            Shop now
                                            <span>
                                                        <svg width="17" height="15" viewBox="0 0 17 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M16 7.50049H1" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            <path d="M9.95001 1.47559L16 7.49959L9.95001 13.5246" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                        </svg>
                                                    </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="banner__wrapper-img banner__wrapper--img-03">
                                    <img src="src/images/banner/banner-lg-01.png" alt="banner" />

                                    <div class="banner__wrapper-text">
                                        <h2 class="font-title--xl">
                                            Fresh & Healthy Organic Food
                                        </h2>
                                        <div class="sale-off">
                                            <h5 class="font-body--xxxl-500">Sale up to <span>48% </span>off</h5>
                                        </div>
                                        <a href="#" class="button button--md">
                                            Shop now
                                            <span>
                                                        <svg width="17" height="15" viewBox="0 0 17 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M16 7.50049H1" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            <path d="M9.95001 1.47559L16 7.49959L9.95001 13.5246" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                        </svg>
                                                    </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section end  -->

    <!-- Shipping  Section Start  -->
    <section class="shipping-container shipping-container--two" style="height: 200px !important">
        <div class="container">
            <div class="swiper-container shipping-container--slider">
                <div class="swiper-wrapper cards-ship cards-ship--two">
                    <div class="swiper-slide">
                        <div class="cards-ship__item">
                                    <span class="cards-ship__item-icon">
                                        <svg width="40" height="28" viewBox="0 0 40 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                    d="M32.7021 20.3042C31.7247 20.3042 30.7962 20.687 30.0957 21.3793C29.3952 22.0798 29.0043 22.992 29.0043 23.9694C29.0043 24.9468 29.3871 25.8591 30.0957 26.5595C30.8043 27.2519 31.7247 27.6347 32.7021 27.6347C34.7058 27.6347 36.3348 25.9894 36.3348 23.9694C36.3348 21.9495 34.7058 20.3042 32.7021 20.3042ZM32.7021 26.0057C31.5781 26.0057 30.6333 25.0772 30.6333 23.9694C30.6333 22.8617 31.5781 21.9332 32.7021 21.9332C33.8098 21.9332 34.7058 22.8454 34.7058 23.9694C34.7058 25.0935 33.8098 26.0057 32.7021 26.0057ZM33.6469 8.09488C33.5003 7.95641 33.3048 7.88311 33.1012 7.88311H28.9228C28.4749 7.88311 28.1083 8.24964 28.1083 8.69761V15.3765C28.1083 15.8245 28.4749 16.191 28.9228 16.191H35.5528C36.0008 16.191 36.3673 15.8245 36.3673 15.3765V10.9049C36.3673 10.6768 36.2696 10.4569 36.0986 10.3022L33.6469 8.09488ZM34.7383 14.562H29.7373V9.50396H32.7835L34.7383 11.2633V14.562ZM12.8121 20.3042C11.8347 20.3042 10.9061 20.687 10.2057 21.3793C9.50519 22.0798 9.11423 22.992 9.11423 23.9694C9.11423 24.9468 9.49705 25.8591 10.2057 26.5595C10.9143 27.2519 11.8347 27.6347 12.8121 27.6347C14.8157 27.6347 16.4447 25.9894 16.4447 23.9694C16.4447 21.9495 14.8157 20.3042 12.8121 20.3042ZM12.8121 26.0057C11.688 26.0057 10.7432 25.0772 10.7432 23.9694C10.7432 22.8617 11.688 21.9332 12.8121 21.9332C13.9198 21.9332 14.8157 22.8454 14.8157 23.9694C14.8157 25.0935 13.9198 26.0057 12.8121 26.0057ZM7.37935 21.306H5.74221V19.1395C5.74221 18.6915 5.37569 18.325 4.92771 18.325C4.47974 18.325 4.11322 18.6915 4.11322 19.1395V22.1205C4.11322 22.5685 4.47974 22.935 4.92771 22.935H7.37935C7.82733 22.935 8.19385 22.5685 8.19385 22.1205C8.19385 21.6726 7.82733 21.306 7.37935 21.306ZM11.5089 16.867C11.5089 16.419 11.1423 16.0525 10.6944 16.0525H0.814498C0.366524 16.0525 0 16.419 0 16.867C0 17.315 0.366524 17.6815 0.814498 17.6815H10.6944C11.1423 17.6815 11.5089 17.3231 11.5089 16.867ZM2.46793 13.9267L12.3478 13.9837C12.7958 13.9837 13.1623 13.6253 13.1704 13.1773C13.1786 12.7212 12.8121 12.3547 12.3641 12.3547L2.48422 12.2977C2.47607 12.2977 2.47607 12.2977 2.47607 12.2977C2.0281 12.2977 1.66158 12.6561 1.66158 13.104C1.65343 13.5602 2.01996 13.9267 2.46793 13.9267ZM4.12951 10.2289H14.0094C14.4573 10.2289 14.8239 9.86234 14.8239 9.41437C14.8239 8.96639 14.4573 8.59987 14.0094 8.59987H4.12951C3.68153 8.59987 3.31501 8.96639 3.31501 9.41437C3.31501 9.86234 3.68153 10.2289 4.12951 10.2289ZM39.6986 9.12929L33.8668 4.29932C33.7202 4.17715 33.541 4.11199 33.3456 4.11199H26.4875V1.17979C26.4875 0.73182 26.121 0.365295 25.673 0.365295H4.92771C4.47974 0.365295 4.11322 0.73182 4.11322 1.17979V7.14192C4.11322 7.58989 4.47974 7.95642 4.92771 7.95642C5.37569 7.95642 5.74221 7.58989 5.74221 7.14192V1.99429H24.8666V21.306H18.1877C17.7398 21.306 17.3732 21.6726 17.3732 22.1205C17.3732 22.5685 17.7398 22.935 18.1877 22.935H28.1328C28.5807 22.935 28.9473 22.5685 28.9473 22.1205C28.9473 21.6726 28.5807 21.306 28.1328 21.306H26.4956V5.74098H33.0605L38.371 10.1393L38.314 21.2897H37.4669C37.0189 21.2897 36.6524 21.6563 36.6524 22.1042C36.6524 22.5522 37.0189 22.9187 37.4669 22.9187H39.1203C39.5683 22.9187 39.9348 22.5604 39.9348 22.1124L40 9.7646C39.9919 9.52025 39.886 9.28405 39.6986 9.12929Z"
                                                    fill="currentColor"
                                            ></path>
                                        </svg>
                                    </span>
                            <div class="cards-ship__item-process-info">
                                <h2 class="font-body--lg-600">Free Shipping</h2>
                                <p class="font-body--md-400">
                                    Free shipping on all your order
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="cards-ship__item">
                                    <span class="cards-ship__item-icon">
                                        <svg width="39" height="40" viewBox="0 0 39 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                    d="M33.0182 15.2101V13.6723C33.0182 9.9916 31.7157 6.57143 29.3543 4.03361C26.9342 1.42857 23.6064 0 19.9762 0H18.7073C15.077 0 11.7493 1.42857 9.32912 4.03361C6.96778 6.57143 5.66526 9.9916 5.66526 13.6723V15.2101C2.79971 15.4034 0.5224 17.7899 0.5224 20.7059V23.1092C0.5224 26.1429 2.99299 28.6134 6.0266 28.6134H9.12744C9.68207 28.6134 10.1358 28.1597 10.1358 27.605V16.2017C10.1358 15.6471 9.68207 15.1933 9.12744 15.1933H7.68206V13.6723C7.68206 7.02521 12.4216 2.01681 18.6989 2.01681H19.9678C26.2535 2.01681 30.9846 7.02521 30.9846 13.6723V15.1933H29.5392C28.9846 15.1933 28.5308 15.6471 28.5308 16.2017V27.5966C28.5308 28.1513 28.9846 28.605 29.5392 28.605H30.951C30.5392 33.8655 26.9174 35.084 25.2367 35.3613C24.7745 33.9412 23.4384 32.916 21.8669 32.916H19.3459C17.3964 32.916 15.8081 34.5042 15.8081 36.4538C15.8081 38.4034 17.3964 40 19.3459 40H21.8753C23.5056 40 24.8753 38.8908 25.2871 37.395C26.1106 37.2773 27.4132 36.9832 28.7073 36.2269C30.5308 35.1597 32.6905 32.9832 32.9762 28.5966C35.8585 28.4202 38.1443 26.0252 38.1443 23.1008V20.6975C38.1527 17.7899 35.8838 15.395 33.0182 15.2101ZM8.13585 26.5882H6.04341C4.11904 26.5882 2.55601 25.0252 2.55601 23.1008V20.6975C2.55601 18.7731 4.11904 17.2101 6.04341 17.2101H8.13585V26.5882ZM21.8753 37.9832H19.3459C18.5056 37.9832 17.8249 37.3025 17.8249 36.4622C17.8249 35.6218 18.5056 34.9412 19.3459 34.9412H21.8753C22.7157 34.9412 23.3964 35.6218 23.3964 36.4622C23.3964 37.3025 22.7157 37.9832 21.8753 37.9832ZM36.1359 23.1008C36.1359 25.0252 34.5728 26.5882 32.6485 26.5882H30.556V17.2101H32.6485C34.5728 17.2101 36.1359 18.7731 36.1359 20.6975V23.1008Z"
                                                    fill="currentColor"
                                            ></path>
                                        </svg>
                                    </span>
                            <div class="cards-ship__item-process-info">
                                <h2 class="font-body--lg-600">Customer Support 24/7</h2>
                                <p class="font-body--md-400">Instant access to Support</p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="cards-ship__item">
                                    <span class="cards-ship__item-icon">
                                        <svg width="33" height="40" viewBox="0 0 33 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                    d="M32.6468 34.6678L30.345 8.72697C30.3036 8.21362 29.873 7.82447 29.3514 7.82447H24.4994C24.4911 3.51066 20.9805 0 16.6667 0C12.3528 0 8.84219 3.51066 8.83391 7.82447H3.98191C3.46856 7.82447 3.038 8.21362 2.98832 8.72697L0.686523 34.6678C0.686523 34.7009 0.686523 34.7257 0.686523 34.7589C0.686523 37.6485 3.34436 40 6.60662 40H26.7267C29.9889 40 32.6468 37.6485 32.6468 34.7589C32.6468 34.7257 32.6468 34.7009 32.6468 34.6678ZM16.6667 1.98717C19.8875 1.98717 22.504 4.6036 22.5122 7.82447H10.8211C10.8294 4.6036 13.4458 1.98717 16.6667 1.98717ZM26.7267 38.0046H6.60662C4.45386 38.0046 2.69853 36.5721 2.67369 34.792L4.89269 9.81163H8.83391V13.2975C8.83391 13.8439 9.28102 14.291 9.82749 14.291C10.374 14.291 10.8211 13.8439 10.8211 13.2975V9.81163H22.5122V13.2975C22.5122 13.8439 22.9593 14.291 23.5058 14.291C24.0523 14.291 24.4994 13.8439 24.4994 13.2975V9.81163H28.4406L30.6596 34.8002C30.6348 36.5721 28.8794 38.0046 26.7267 38.0046Z"
                                                    fill="currentColor"
                                            ></path>
                                        </svg>
                                    </span>
                            <div class="cards-ship__item-process-info">
                                <h2 class="font-body--lg-600">100% Secure Payment</h2>
                                <p class="font-body--md-400">
                                    We ensure your money is save
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="cards-ship__item">
                                    <span class="cards-ship__item-icon">
                                        <svg width="38" height="40" viewBox="0 0 38 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                    d="M37.3959 9.43014C37.3959 9.27818 37.3622 9.12621 37.2946 8.98269C37.1595 8.69565 36.8978 8.50148 36.6108 8.44238L19.4137 0.101309C19.1351 -0.0337695 18.8058 -0.0337695 18.5272 0.101309L1.16124 8.51836C0.823545 8.67877 0.604043 9.01646 0.587158 9.39637V9.40481C0.587158 9.41325 0.587158 9.4217 0.587158 9.43858V30.5614C0.587158 30.9498 0.80666 31.3043 1.16124 31.4732L18.5272 39.8903C18.5357 39.8903 18.5357 39.8903 18.5441 39.8987C18.5694 39.9071 18.5948 39.9156 18.6201 39.9325C18.6285 39.9325 18.637 39.9409 18.6539 39.9409C18.6792 39.9493 18.7045 39.9578 18.7298 39.9662C18.7383 39.9662 18.7467 39.9747 18.7552 39.9747C18.7805 39.9831 18.8143 39.9831 18.8396 39.9916C18.848 39.9916 18.8565 39.9916 18.8649 39.9916C18.8987 39.9916 18.9409 40 18.9747 40C19.0084 40 19.0506 40 19.0844 39.9916C19.0929 39.9916 19.1013 39.9916 19.1097 39.9916C19.1351 39.9916 19.1688 39.9831 19.1942 39.9747C19.2026 39.9747 19.211 39.9662 19.2195 39.9662C19.2448 39.9578 19.2701 39.9493 19.2955 39.9409C19.3039 39.9409 19.3124 39.9325 19.3292 39.9325C19.3546 39.924 19.3799 39.9156 19.4052 39.8987C19.4137 39.8987 19.4137 39.8987 19.4221 39.8903L36.8387 31.4479C37.1849 31.279 37.4128 30.9244 37.4128 30.5361V9.45547C37.3959 9.44702 37.3959 9.43858 37.3959 9.43014ZM18.9662 2.13592L34.0274 9.43858L28.4808 12.1317L13.4196 4.82904L18.9662 2.13592ZM18.9662 16.7412L3.90501 9.43858L11.0979 5.95188L26.1591 13.2545L18.9662 16.7412ZM2.61333 11.068L17.9531 18.5057V37.3575L2.61333 29.9198V11.068ZM19.9793 37.3575V18.5057L27.1807 15.0106V19.9409C27.1807 20.4981 27.6365 20.954 28.1937 20.954C28.7509 20.954 29.2068 20.4981 29.2068 19.9409V14.0228L35.3698 11.0342V29.886L19.9793 37.3575Z"
                                                    fill="currentColor"
                                            ></path>
                                        </svg>
                                    </span>
                            <div class="cards-ship__item-process-info">
                                <h2 class="font-body--lg-600">Money-Back Guarantee</h2>
                                <p class="font-body--md-400">
                                    30 Days Money-Back Guarantee
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shipping  Section end  -->
</main>
<jsp:include page="footer.jsp"></jsp:include>

<style>
    .select-box select {
        border: 1px solid #ccc;
        padding: 5px 10px;
        border-radius: 5px;
    }

</style>