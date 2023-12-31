<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <title>Gio hang</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/icons/fontawesome-free-6.2.1-web/css/fontawesome.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <style>
        .wrapper {
            text-align: center;
            position: absolute;
            top: 20%;
            left: 0;
            right: 0;
            margin: auto;
            transform: translateY(-50%);
            width: 400px;
            height: 440px;
            border: 2px solid rgba(255, 255, 255, .5);
            border-radius: 20px;
            backdrop-filter: blur(20px);
            box-shadow: 0 0 30px rgba(0, 0, 0, .5);
            display: flex;
            justify-content: center;
            align-items: center;
            transition: height .2s ease;
            transform: scale(0);
            transition: transform .5s ease, height .2s ease;
            overflow: hidden;
            z-index: 5;
        }

        .wrapper.active-popup {
            transform: scale(1);
        }

        .wrapper.active {
            height: 520px;
        }
        .wrapper .form-box {
            text-align: left;
            width: 100%;
            padding: 40px;
        }

        .wrapper .form-box.login {
            transition: transform .18s ease;
            transform: translateX(0);
        }

        .wrapper.active .form-box.login {
            transition: none;
            transform: translateX(-400px);
        }

        .wrapper.active .form-box.register {
            position: absolute;
            transform: translateX(400px);
        }

        .wrapper .form-box.register {
            position: absolute;
            transition: none;
            transform: translateX(400px);
        }

        .wrapper.active .form-box.register {
            transition: transform .18s ease;
            transform: translateX(0);
        }

        .form-box h2 {
            font-size: 2em;
            color: #fff;
            text-align: center;
        }

        .input-box {
            position: relative;
            width: 100%;
            height: 50px;
            border-bottom: 2px solid #fff;
            margin: 30px 0;
        }

        .input-box label {
            position: absolute;
            top: 50%;
            left: 5px;
            transform: translateY(-50%);
            font-size: 1em;
            color: #fff;
            font-weight: 500;
            pointer-events: none;
            top: -5px;
        }


        .input-box input {
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
            font-weight: 600;
            padding: 0 35px 0 5px;
        }

        .input-box .icon {
            position: absolute;
            right: 8px;
            font-size: 1.2em;
            color: #fff;
            line-height: 57px;
        }

        .remember-forgot {
            font-size: .9em;
            color: #fff;
            font-weight: 500;
            margin: -15px 0 15px;
            display: flex;
            justify-content: space-between;
        }

        .remember-forgot label input {
            accent-color: #162938;
            margin-right: 3px;
        }

        .remember-forgot a {
            color: #fff;
            text-decoration: none;
        }

        .remember-forgot a:hover {
            text-decoration: underline;
        }

        .btnLogin {
            width: 100%;
            height: 45px;
            background: #fff;
            border: none;
            outline: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1em;
            color: #000;
            font-weight: 500;
        }

        .login-register {
            font-size: .9em;
            color: #fff;
            text-align: center;
            font-weight: 500;
            margin: 25px 0 10px;
        }

        .login-register p a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }

        .login-register p a:hover {
            text-decoration: underline;
        }

        .wrapper .icon-close {
            position: absolute;
            top: 0;
            right: 0;
            width: 45px;
            height: 45px;
            background: #162938;
            font-size: 2em;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            border-bottom-left-radius: 20px;
            cursor: pointer;
            z-index: 1;
        }
    </style>
</head>

<body>
<div class="container-fluid p-0">
    <!-- Begin Header -->
    <nav class="navbar navbar-expand-sm navbar-dark">
        <img src="/images/logo-sock.png" width="50" height="50">
        <div class="container-fluid">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/">TRANG CHỦ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/collections/all">SẢN PHẨM</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">GIỚI THIỆU</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">BLOG</a>
                </li>
            </ul>
            <form class="form-search d-flex">
                <input class="form-control me-2" type="text" placeholder="Tìm kiếm  " />
                <button class="btn btn-light" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>

            <c:choose>
                <c:when test="${not empty userLogin}">
                    <div class="d-flex collapse navbar-collapse" id="navbarNavDarkDropdown" style="justify-content: right; margin-right: 30px">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        ${userLogin.hoVaTen}
                                </a>
                                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                    <c:if test="${userLogin.admin == 1}"> <li><a class="dropdown-item" href="#">Quản lý sản phẩm</a></li></c:if>
                                    <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
                                    <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                                    <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="d-flex">
                        <button class="btn btn-outline-light btnLogin-popup" type="button">
                            <i class="fa-solid fa-user"></i>
                            Đăng nhập
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="d-flex" style="font-size: 20px; margin-right: 10px; padding: 5px">
                <a href="/cart" style="color: #fff"><i class="fa-solid fa-cart-shopping"></i></a>
            </div>
        </div>
    </nav>
    <form:form action="/cart/buy/pay" modelAttribute="payment" method="post">
        <section class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="card mt-3">
                        <div class="card-header">
                            <span>THÔNG TIN THANH TOÁN</span>
                        </div>
                        <div action="#" class="px-3 mb-3">
                            <div class="form-group">
                                <label for="hoTen">Họ và tên</label>
                                <input value="${userLogin.hoVaTen}" type="text" id="hoTen" class="form-control w-100" disabled>
                            </div>
                            <div class="form-group">
                                <label for="diaChi">Địa chỉ</label>
                                <form:input path="shippingAddress" name="diaChi" type="text" id="diaChi" class="form-control w-100" />
                            </div>
                            <div class="form-group">
                                <label for="sdt">Số điện thoại</label>
                                <input value="${userLogin.sdt}" type="text" id="sdt" class="form-control w-100" disabled>
                            </div>
                            <div class="form-group">
                                <label for="email">Địa chỉ email</label>
                                <input value="${userLogin.email}" type="text" id="email" class="form-control w-100" disabled>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card mt-3">
                        <div class="card-header">
                            <span>ĐƠN HÀNG CỦA BẠN</span>
                        </div>
                        <div class="card-body p-4">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="product-name">Sản phẩm</th>
                                    <th class="product-total">Tổng cộng</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${productCart.sanPhamTrongGio}" var="product">
                                        <tr class="cart-item">
                                            <td class="product-name">
                                                    ${product.tenSanPham}
                                                <strong class="product-quantiry">× ${product.soLuong}</strong>
                                            </td>
                                            <td class="product-total">
                                                <span class="amount">
                                                    <fmt:formatNumber value="${product.thanhTien}" pattern="#,###.##" currencyCode="VND"/> ₫
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="cart-subtotal">
                                    <th>Tổng cộng</th>
                                    <td>
                                            <span class="amount">
                                                <fmt:formatNumber value="${productCart.tongTien}" pattern="#,###.##" currencyCode="VND"/> ₫
                                            </span>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                            <div id="payment">
                                <div class="d-grid">
                                   <button class="btn btn-danger btn-select-vang w-100" type="submit">Đặt hàng</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form:form>

</div>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/icons/fontawesome-free-6.2.1-web/js/all.min.js"></script>
<script src="/js/script.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>

</html>