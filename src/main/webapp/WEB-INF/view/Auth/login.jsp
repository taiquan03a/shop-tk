<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,800">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet">
</head>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form:form action="register" modelAttribute="taoKhachHangRequest" method="post">
            <h1>Tạo tài khoản</h1>
            <span>hoặc sử dụng email để đăng ký</span>
            <input type="text" name="tenKhachHang" placeholder="Họ tên" />
            <input type="text" name="sdt" placeholder="Số điện thoại" />
            <input type="email" name="email" placeholder="Email" />
            <input type="password" name="matKhau" placeholder="Password" />
            <div class="type d-flex gap-2 align-items-center" style="width: 100%; font-size: 14px; display: flex; justify-content: space-between; align-content: center">
                <div style="font-weight: 700; margin-bottom: 4px;">Giới tính:</div>
                <input type="radio" id="css" name="gioiTinh" value="0" required>
                <label  for="css">Nam</label>
                <input type="radio" id="javascript" name="gioiTinh" value="1" required>
                <label  for="javascript">Nữ</label>
            </div>
            <button type="submit">Đăng ký</button>
        </form:form>
    </div>
    <div class="form-container sign-in-container">
        <form action="login" method="post">
            <h1>Đăng nhập</h1>
            <input type="email" value="${email}" name="email" placeholder="Email" />
            <input type="password" name="password" placeholder="Password" />
            <span style="color: red">${message}</span>
            <a href="#">Forgot your password?</a>
            <button type="submit">Đăng nhập</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Chào mừng quay trở lại!</h1>
                <p>Để duy trì kết nối với chúng tôi vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
                <button class="ghost" id="signIn"> Đăng nhập</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Nhập thông tin cá nhân của bạn và bắt đầu hành trình với chúng tôi</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>

<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>