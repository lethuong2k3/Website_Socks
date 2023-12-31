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
    <div class="wrapper" style="z-index: 5; background: #333">
        <span class="icon-close"><i class="fa-solid fa-xmark"></i></span>
        <div class="form-box login">
            <h2>Đăng nhập</h2>
            <form:form action="/login" method="post" modelAttribute="login">
                <div class="input-box">
                    <span class="icon"><i class="fa-solid fa-envelope"></i></span>
                    <form:input path="email" type="email" name="email" />
                    <form:errors path="email" cssClass="text-danger" />
                    <label>Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class="fa-solid fa-lock"></i></span>
                    <form:input path="matKhau" type="password" name="matKhau" />
                    <form:errors path="matKhau" cssClass="text-danger" />
                    <label>Mật khẩu</label>
                </div>
                <div class="remember-forgot">
                    <label><input name="rememberMe" value="true" type="checkbox" />Remember me</label>
                    <a href="#">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="btnLogin">Đăng nhập</button>
                <div class="login-register">
                    <p>Bạn không có tài khoản?<a href="#" class="register-link"> Đăng ký</a></p>
                </div>
            </form:form>
        </div>
        <div class="form-box register">
            <h2>Đăng ký</h2>
            <form:form action="/register" method="post" modelAttribute="account">
                <div class="input-box">
                    <span class="icon"><i class="fa-solid fa-circle-info"></i></span>
                    <form:input path="hoVaTen" type="text" name="hoVaTen" />
                    <form:errors path="hoVaTen" cssClass="text-danger" />
                    <label>Họ và tên</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class="fa-solid fa-envelope"></i></span>
                    <form:input path="emailRegis" type="email" name="emailRegis" />
                    <form:errors path="emailRegis" cssClass="text-danger" />
                    <label>Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class="fa-solid fa-envelope"></i></span>
                    <form:input path="sdt" type="text" name="sdt" />
                    <form:errors path="sdt" cssClass="text-danger" />
                    <label>Số điện thoại</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class="fa-solid fa-lock"></i></span>
                    <form:input path="matKhauRegis" type="password" name="matKhauRegis" />
                    <form:errors path="matKhauRegis" cssClass="text-danger" />
                    <label>Mật khẩu</label>
                </div>

                <button type="submit" class="btnLogin">Đăng ký</button>
                <div class="login-register">
                    <p>Bạn đã có tài khoản?<a href="#" class="login-link"> Đăng nhập</a></p>
                </div>
            </form:form>
        </div>
    </div>
    <!-- End Header -->
    <!-- Begin Cart -->
        <section class="bg-light">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">GIỎ HÀNG</h1>
                                            </div>
                                            <hr class="my-4">

                                            <c:forEach items="${productCart.sanPhamTrongGio}" var="cart">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img
                                                                src="/images/${cart.hinhAnh}"
                                                                class="img-fluid rounded-3" alt="${cart.hinhAnh}">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-black mb-0">${cart.tenSanPham}</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <form style="display: inherit">
                                                            <button formaction="/cart/update/${cart.id}" class="btn btn-link px-2"
                                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                <i class="fas fa-minus"></i>
                                                            </button>

                                                            <input id="form1" min="0" name="quantity" value="${cart.soLuong}" type="number"
                                                                   class="form-control form-control-sm" style="width: 60px;"/>

                                                            <button formaction="/cart/update/${cart.id}" class="btn btn-link px-2"
                                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                <i class="fas fa-plus"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0"><fmt:formatNumber value="${cart.thanhTien}" pattern="#,###.##" currencyCode="VND"/> ₫</h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="/cart/remove/${cart.id}" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>
                                                <hr class="my-4">
                                            </c:forEach>


                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="/" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Quay lại trang chủ</a></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">TỔNG SỐ LƯỢNG</h3>
                                            <hr class="my-4">
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Sản phẩm: <c:if test="${empty productCart.sanPhamTrongGio.size()}">0</c:if> ${productCart.sanPhamTrongGio.size()}</h5>
                                            </div>
                                            <h5 class="text-uppercase mb-3">Mã ưu đãi</h5>
                                            <div class="mb-5">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Examplea2" class="form-control form-control-lg" placeholder="Nhập code"/>
                                                </div>
                                            </div>
                                            <hr class="my-4">
                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Tổng cộng</h5>
                                                <h5><fmt:formatNumber value="${productCart.tongTien}" pattern="#,###.##" currencyCode="VND"/> ₫</h5>
                                            </div>
                                            <a href="/cart/buy"><button style="width: 100%; height: 50px;" type="button" class="btn btn-danger"
                                                       data-mdb-ripple-color="dark">Tiến hành thanh toán</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!-- End Cart -->
</div>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/icons/fontawesome-free-6.2.1-web/js/all.min.js"></script>
<script src="/js/script.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    const wrapper = document.querySelector('.wrapper');
    const loginLink = document.querySelector('.login-link');
    const registerLink = document.querySelector('.register-link');
    const btnPopup = document.querySelector('.btnLogin-popup');
    const iconClose = document.querySelector('.icon-close');
    registerLink.addEventListener('click', ()=> {
        wrapper.classList.add('active');
    });

    loginLink.addEventListener('click', ()=> {
        wrapper.classList.remove('active');
    })

    btnPopup.addEventListener('click', ()=> {
        wrapper.classList.add('active-popup');
    })

    iconClose.addEventListener('click', ()=> {
        wrapper.classList.remove('active-popup');
    })

    <c:if test="${registerSuccess}">
    $(document).ready(function() {
        swal({
            title: "Đăng ký thành công",
            text: "Vui lòng đăng nhập",
            icon: "success",
            button: "OK",
        });
    });
    </c:if>
    <c:if test="${notAccount}">
    $(document).ready(function() {
        swal({
            title: "Vui lòng đăng nhập để mua hàng",
            icon: "warning",
            button: "OK",
        });
    });
    </c:if>
</script>
</body>

</html>