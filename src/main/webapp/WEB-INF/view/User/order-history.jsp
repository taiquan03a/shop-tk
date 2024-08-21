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
<div class="dashboard section">
    <div class="container">
        <div class="row dashboard__content">
            <div class="col-lg-3">
                <nav class="dashboard__nav">
                    <h5 class="dashboard__nav-title font-body--xxl-500">
                        navigation
                    </h5>
                    <ul class="dashboard__nav-item">
                        <li class="dashboard__nav-item-link">
                            <a href="user-dashboard.html" class="font-body--lg-400">
                    <span class="icon">
                      <svg
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                                d="M21 21H13V15H21V21ZM11 21H3V11H11V21ZM21 13H13V3H21V13ZM11 9H3V3H11V9Z"
                                fill="currentColor"
                        />
                      </svg>
                    </span>
                                <span class="name">Dashboard</span>
                            </a>
                        </li>
                        <!-- Order History -->
                        <li class="dashboard__nav-item-link active">
                            <a href="order-history.html" class="font-body--lg-400">
                    <span class="icon">
                      <svg
                              width="16"
                              height="16"
                              viewBox="0 0 16 16"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                                d="M0 16V9.00004H7L3.783 12.22C4.33247 12.7819 4.98837 13.2287 5.71241 13.5343C6.43644 13.8399 7.21411 13.9983 8 14C9.23925 13.9982 10.4475 13.6127 11.4589 12.8965C12.4702 12.1802 13.2349 11.1684 13.648 10H13.666C13.78 9.67504 13.867 9.34004 13.925 9.00004H15.937C15.6934 10.9333 14.7527 12.7111 13.2913 14C11.83 15.2888 9.9485 16 8 16H7.99C6.93982 16.0032 5.89944 15.798 4.9291 15.3963C3.95876 14.9946 3.07772 14.4045 2.337 13.66L0 16ZM2.074 7.00004H0.0619998C0.305476 5.06751 1.24564 3.29019 2.70616 2.00145C4.16667 0.712703 6.04719 0.00107558 7.995 3.98088e-05H8C9.05036 -0.00328613 10.0909 0.201826 11.0615 0.603496C12.032 1.00517 12.9132 1.59541 13.654 2.34004L16 3.98088e-05V7.00004H9L12.222 3.78004C11.672 3.21752 11.0153 2.77035 10.2903 2.46471C9.56537 2.15907 8.78674 2.0011 8 2.00004C6.76074 2.00187 5.55246 2.38738 4.54114 3.10361C3.52982 3.81985 2.76508 4.83166 2.352 6.00004H2.334C2.219 6.32504 2.132 6.66004 2.075 7.00004H2.074Z"
                                fill="currentColor"
                        />
                      </svg>
                    </span>
                                <span class="name"> Order History</span>
                            </a>
                        </li>
                        <!-- Wishlist -->
                        <li class="dashboard__nav-item-link">
                            <a href="wishlist.html" class="font-body--lg-400">
                    <span class="icon">
                      <svg
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                                d="M11.9997 21.0538C-7.99987 9.99967 6.00011 -2.00033 11.9997 5.58772C18.0001 -2.00034 32.0001 9.99967 11.9997 21.0538Z"
                                stroke="currentColor"
                                stroke-width="1.5"
                        />
                      </svg>
                    </span>
                                <span class="name"> Wishlist</span>
                            </a>
                        </li>
                        <!-- Shopping Cart  -->
                        <li class="dashboard__nav-item-link">
                            <a href="" class="font-body--lg-400">
                    <span class="icon">
                      <svg
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                                d="M8 10H5L3 21H21L19 10H16M8 10V7C8 4.79086 9.79086 3 12 3V3C14.2091 3 16 4.79086 16 7V10M8 10H16M8 10V13M16 10V13"
                                stroke="currentColor"
                                stroke-width="1.5"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                        />
                      </svg>
                    </span>

                                <span class="name"> Shopping Cart </span>
                            </a>
                        </li>
                        <!--  Settings   -->
                        <li class="dashboard__nav-item-link">
                            <a href="" class="font-body--lg-400">
                    <span class="icon">
                      <svg
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                                d="M13.8199 22H10.1799C9.95182 22 9.73059 21.9221 9.55289 21.7792C9.37519 21.6362 9.25169 21.4368 9.20288 21.214L8.79588 19.33C8.25294 19.0921 7.73812 18.7946 7.26088 18.443L5.42388 19.028C5.20645 19.0973 4.97183 19.0902 4.759 19.0078C4.54617 18.9254 4.36794 18.7727 4.25388 18.575L2.42988 15.424C2.31703 15.2261 2.27467 14.9958 2.30973 14.7708C2.34479 14.5457 2.45519 14.3392 2.62288 14.185L4.04788 12.885C3.98308 12.2961 3.98308 11.7019 4.04788 11.113L2.62288 9.816C2.45496 9.66177 2.3444 9.45507 2.30933 9.22978C2.27427 9.00449 2.31677 8.77397 2.42988 8.576L4.24988 5.423C4.36394 5.22532 4.54218 5.07259 4.755 4.99019C4.96783 4.90778 5.20245 4.90066 5.41988 4.97L7.25688 5.555C7.50088 5.375 7.75488 5.207 8.01788 5.055C8.26988 4.913 8.52988 4.784 8.79588 4.669L9.20388 2.787C9.25246 2.5642 9.37572 2.36469 9.55323 2.22155C9.73074 2.07841 9.95185 2.00024 10.1799 2H13.8199C14.0479 2.00024 14.269 2.07841 14.4465 2.22155C14.6241 2.36469 14.7473 2.5642 14.7959 2.787L15.2079 4.67C15.7505 4.9079 16.265 5.20539 16.7419 5.557L18.5799 4.972C18.7972 4.90292 19.0316 4.91017 19.2442 4.99256C19.4568 5.07495 19.6349 5.22753 19.7489 5.425L21.5689 8.578C21.8019 8.985 21.7209 9.5 21.3759 9.817L19.9509 11.117C20.0157 11.7059 20.0157 12.3001 19.9509 12.889L21.3759 14.189C21.7209 14.507 21.8009 15.021 21.5689 15.428L19.7489 18.581C19.6349 18.7785 19.4568 18.931 19.2442 19.0134C19.0316 19.0958 18.7972 19.1031 18.5799 19.034L16.7419 18.449C16.2651 18.8004 15.7506 19.0976 15.2079 19.335L14.7959 21.214C14.7471 21.4366 14.6238 21.6359 14.4463 21.7788C14.2688 21.9218 14.0478 21.9998 13.8199 22ZM7.61988 16.229L8.43988 16.829C8.62488 16.965 8.81788 17.09 9.01688 17.204C9.20488 17.313 9.39788 17.411 9.59588 17.5L10.5289 17.909L10.9859 20H13.0159L13.4729 17.908L14.4059 17.499C14.8129 17.319 15.1999 17.096 15.5589 16.833L16.3799 16.233L18.4209 16.883L19.4359 15.125L17.8529 13.682L17.9649 12.67C18.0149 12.227 18.0149 11.78 17.9649 11.338L17.8529 10.326L19.4369 8.88L18.4209 7.121L16.3799 7.771L15.5589 7.171C15.1997 6.90669 14.8131 6.68173 14.4059 6.5L13.4729 6.091L13.0159 4H10.9859L10.5269 6.092L9.59588 6.5C9.18807 6.67861 8.80136 6.90198 8.44288 7.166L7.62188 7.766L5.58188 7.116L4.56488 8.88L6.14788 10.321L6.03588 11.334C5.98588 11.777 5.98588 12.224 6.03588 12.666L6.14788 13.678L4.56488 15.121L5.57988 16.879L7.61988 16.229ZM11.9959 16C10.935 16 9.9176 15.5786 9.16746 14.8284C8.41731 14.0783 7.99588 13.0609 7.99588 12C7.99588 10.9391 8.41731 9.92172 9.16746 9.17157C9.9176 8.42143 10.935 8 11.9959 8C13.0568 8 14.0742 8.42143 14.8243 9.17157C15.5745 9.92172 15.9959 10.9391 15.9959 12C15.9959 13.0609 15.5745 14.0783 14.8243 14.8284C14.0742 15.5786 13.0568 16 11.9959 16ZM11.9959 10C11.6042 10.0004 11.2213 10.1158 10.8947 10.3318C10.568 10.5479 10.3119 10.855 10.1583 11.2153C10.0046 11.5755 9.9601 11.9729 10.0303 12.3583C10.1004 12.7436 10.2822 13.0998 10.5529 13.3828C10.8237 13.6657 11.1716 13.863 11.5534 13.95C11.9353 14.037 12.3343 14.01 12.7009 13.8724C13.0676 13.7347 13.3858 13.4924 13.616 13.1756C13.8462 12.8587 13.9783 12.4812 13.9959 12.09V12.49V12C13.9959 11.4696 13.7852 10.9609 13.4101 10.5858C13.035 10.2107 12.5263 10 11.9959 10Z"
                                fill="currentColor"
                        />
                      </svg>
                    </span>

                                <span class="name"> Settings </span>
                            </a>
                        </li>
                        <!--  Log out    -->
                        <li id="logout" onclick="logout()" class="dashboard__nav-item-link d-none">
                            <a href="#" class="font-body--lg-400">
                    <span class="icon">
                      <svg
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                                d="M19 21H10C9.46957 21 8.96086 20.7893 8.58579 20.4142C8.21071 20.0391 8 19.5304 8 19V15H10V19H19V5H10V9H8V5C8 4.46957 8.21071 3.96086 8.58579 3.58579C8.96086 3.21071 9.46957 3 10 3H19C19.5304 3 20.0391 3.21071 20.4142 3.58579C20.7893 3.96086 21 4.46957 21 5V19C21 19.5304 20.7893 20.0391 20.4142 20.4142C20.0391 20.7893 19.5304 21 19 21ZM12 16V13H3V11H12V8L17 12L12 16Z"
                                fill="currentColor"
                        />
                      </svg>
                    </span>

                                <span class="name"> Log out </span>
                            </a>
                        </li>
                    </ul>
                    <button class="filter-icon">
                        <svg
                                width="22"
                                height="19"
                                viewBox="0 0 22 19"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    d="M18 5.75C18.4142 5.75 18.75 5.41421 18.75 5C18.75 4.58579 18.4142 4.25 18 4.25V5.75ZM9 4.25C8.58579 4.25 8.25 4.58579 8.25 5C8.25 5.41421 8.58579 5.75 9 5.75V4.25ZM18 4.25H9V5.75H18V4.25Z"
                                    fill="white"
                            />
                            <path
                                    d="M13 14.75C13.4142 14.75 13.75 14.4142 13.75 14C13.75 13.5858 13.4142 13.25 13 13.25V14.75ZM4 13.25C3.58579 13.25 3.25 13.5858 3.25 14C3.25 14.4142 3.58579 14.75 4 14.75V13.25ZM13 13.25H4V14.75H13V13.25Z"
                                    fill="white"
                            />
                            <circle
                                    cx="5"
                                    cy="5"
                                    r="4"
                                    stroke="white"
                                    stroke-width="1.5"
                            />
                            <circle
                                    cx="17"
                                    cy="14"
                                    r="4"
                                    stroke="white"
                                    stroke-width="1.5"
                            />
                        </svg>
                    </button>
                </nav>
            </div>
            <div class="col-lg-9 section--xl pt-0">
                <div class="container">
                    <!-- Order History  -->
                    <div class="dashboard__order-history">
                        <div class="dashboard__order-history-title">
                            <h2 class="font-body--xxl-500">Order History</h2>
                        </div>
                        <div class="dashboard__order-history-table">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th
                                                scope="col"
                                                class="dashboard__order-history-table-title"
                                        >
                                            Order Id
                                        </th>
                                        <th
                                                scope="col"
                                                class="dashboard__order-history-table-title"
                                        >
                                            Date
                                        </th>
                                        <th
                                                scope="col"
                                                class="dashboard__order-history-table-title"
                                        >
                                            Total
                                        </th>
                                        <th
                                                scope="col"
                                                class="dashboard__order-history-table-title"
                                        >
                                            Status
                                        </th>
                                        <th
                                                scope="col"
                                                class="dashboard__order-history-table-title"
                                        ></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDon}" varStatus="status">
                                    <tr>
                                        <!-- Order Id  -->
                                        <td
                                                class="dashboard__order-history-table-item order-id"
                                        >
                                                ${hoaDon.maHoaDon}
                                        </td>
                                        <!-- Date  -->
                                        <td
                                                class="
                              dashboard__order-history-table-item
                              order-date
                            "
                                        >
                                                ${hoaDon.ngayTao}
                                        </td>
                                        <!-- Total  -->
                                        <td
                                                class="
                              dashboard__order-history-table-item
                              order-total
                            "
                                        >
                                            <p class="order-total-price">
                                                    ${hoaDon.tongTien} VNĐ
                                                <span class="quantity"> (${hoaDon.tongSp} Products)</span>
                                            </p>
                                        </td>
                                        <!-- Status -->
                                        <td
                                                class="
                              dashboard__order-history-table-item
                              order-status
                            "
                                        >
                                                ${hoaDon.trangThaiDon}
                                        </td>
                                        <!-- Details page  -->
                                        <td
                                                class="
                              dashboard__order-history-table-item
                              order-details
                            "
                                        >
                                            <a href="order-detail/${hoaDon.ID}"> View Details</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
</style>
<script>
    function logout(){
        if(confirm("Bạn có muốn đăng xuất?")){
            localStorage.clear()
            location.href = '/user/logout'
        }
    }
</script>

<script>
    localStorage.clear()
    console.log(${khachHang.ID} ? true : false)
    var check = ${khachHang.ID} ? true : false
    if (check) {
        console.log(document.getElementById('logout'))
        document.getElementById('logout').classList.remove('d-none');
    }
</script>


