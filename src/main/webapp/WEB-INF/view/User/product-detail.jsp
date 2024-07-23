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
    <link rel="stylesheet" href="/css/product-detail.css">
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

        <section class="section product" aria-label="product">
            <div class="container">
                <figure class="product-banner">
                    <img style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" src="/img/logo.jpg" width="600" height="600" loading="lazy" alt="Nike Sneaker"
                         class="img-cover">
                </figure>
                <div class="product-content">

                    <p class="product-subtitle">Nike Company</p>

                    <h1 class="h1 product-title">Fall Limited Edition Sneakers</h1>

                    <p class="product-text">
                        These low-profile sneakers are your perfect casual wear companion. Featuring a
                        durable rubber outer sole, they’ll withstand everything the weather can offer.
                    </p>

                    <div class="wrapper">

                        <span class="price" data-total-price>$125.00</span>

                        <span class="badge">50%</span>

                        <del class="del">$250.00</del>

                    </div>
                    <div style="display: flex; justify-content: space-between;">
                        <select name="" id="feature">
                            <option value="">Chọn kích cỡ</option>
                            <option value="">X</option>
                            <option value="">XL</option>
                        </select>

                        <select name="" id="feature">
                            <option value="">Chọn Màu sắc</option>
                            <option value="">X</option>
                            <option value="">XL</option>
                        </select>
                    </div>
                    <div class="btn-group">

                        <div class="counter-wrapper">

                            <button class="counter-btn" data-qty-minus>
                                <ion-icon name="remove-outline"></ion-icon>
                            </button>

                            <span class="span" data-qty>1</span>

                            <button class="counter-btn" data-qty-plus>
                                <ion-icon name="add-outline"></ion-icon>
                            </button>

                        </div>

                        <button class="cart-btn">
                            <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>

                            <span class="span">Add to cart</span>
                        </button>

                    </div>

                </div>

            </div>
        </section>

    </article>
</main>

<jsp:include page="footer.jsp"></jsp:include>

<script>
    // JavaScript
    const minusBtn = document.querySelector('[data-qty-minus]');
    const plusBtn = document.querySelector('[data-qty-plus]');
    const qtySpan = document.querySelector('[data-qty]');

    minusBtn.addEventListener('click', () => {
        let qty = parseInt(qtySpan.textContent);
        if (qty > 1) {
            qty--;
            qtySpan.textContent = qty;
        }
    });

    plusBtn.addEventListener('click', () => {
        let qty = parseInt(qtySpan.textContent);
        qty++;
        qtySpan.textContent = qty;
    });
</script>
