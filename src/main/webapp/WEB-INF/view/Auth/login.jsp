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
<h2>Weekly Coding Challenge #1: Sign in/up Form</h2>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form:form action="register" modelAttribute="taoKhachHangRequest" method="post">
            <h1>Create Account</h1>
            <span>or use your email for registration</span>
            <input type="text" name="tenKhachHang" placeholder="Họ tên" />
            <input type="text" name="sdt" placeholder="Số điện thoại" />
            <input type="email" name="email" placeholder="Email" />
            <input type="password" name="matKhau" placeholder="Password" />
            <div class="type d-flex gap-2 align-items-center" style="font-size: 14px;">
                <div style="font-weight: 700; margin-bottom: 4px;">Giới tính:</div>
                <input type="radio" id="css" name="gioiTinh" value="0" required>
                <label  for="css">Nam</label>
                <input type="radio" id="javascript" name="gioiTinh" value="1" required>
                <label  for="javascript">Nữ</label>
            </div>
            <button type="submit">Sign Up</button>
        </form:form>
    </div>
    <div class="form-container sign-in-container">
        <form action="login" method="post">
            <h1>Sign in</h1>
            <span>or use your account</span>
            <input type="email" name="email" placeholder="Email" />
            <input type="password" name="password" placeholder="Password" />
            <a href="#">Forgot your password?</a>
            <button type="submit">Sign In</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>
        Created with <i class="fa fa-heart"></i> by
        <a target="_blank" href="https://florin-pop.com">Florin Pop</a>
        - Read how I created this and how you can join the challenge
        <a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
    </p>
</footer>
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