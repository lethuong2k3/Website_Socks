<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <title>ChampagneCharles</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/fontawesome-free-6.2.1-web/css/fontawesome.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
</head>

<body>
<div class="container-fluid p-0">
    <!-- Header -->
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
            <form class="d-flex">
                <button formaction="login.html" class="btn btn-outline-dark" type="submit">
                    <i class="fa-solid fa-user"></i>
                    Đăng nhập
                </button>
            </form>
        </div>
    </nav>
    <!-- End Header -->
    <div class="row px-5 m-0">
        <div class="col-sm-9">
            <section class="py-3">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-4"><img class= "card-img-top mb-5 mb-md-0" src="/uploads/${SanPham.urlHinhAnh}" /></div>
                        <div class="col-md-8">
                            <h1 class="display-7 fw-bolder" style="color: #990d23;">${SanPham.tenSanPham}</h1>
                            <div class="properties row d-flex">
                                <div class="col-sm-4 d-flex">
                                    <div class="pa-icon">
                                        <i class="fa-solid fa-droplet" style="color: #990d23;"></i>
                                    </div>
                                    <div class="pa-info">
                                        <div class="pa-info-label">Màu sắc</div>
                                        <div class="pa-info-value">
                                            <p><a href="#">${SanPham.mauSac}</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 d-flex">
                                    <div class="pa-icon">
                                        <i class="fa-solid fa-ellipsis" style="color: #990d23;"></i>
                                    </div>
                                    <div class="pa-info">
                                        <div class="pa-info-label">Họa tiết</div>
                                        <div class="pa-info-value">
                                            <p><a href="#">${SanPham.hoaTiet}</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 d-flex">
                                    <div class="pa-icon">
                                        <i class="fa-solid fa-ruler" style="color: #990d23;"></i>
                                    </div>
                                    <div class="pa-info">
                                        <div class="pa-info-label">Kích thước</div>
                                        <div class="pa-info-value">
                                            <p><a href="#">${SanPham.size}</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="fs-5 mb-4 mt-3">
                                    <div style="font-size: 14px;">Tình trạng: <span class="text-success">${SanPham.trangThai}</span></div>
                                    <span class="text-danger" style="font-weight: 600;"><fmt:formatNumber value="${SanPham.donGia}" pattern="#,###.##" currencyCode="VND"/> ₫</span>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="col-md-3 col-lg-3 col-xl-3 d-flex">
                                    <button class="btn btn-link px-2"
                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                        <i class="fas fa-minus"></i>
                                    </button>

                                    <input id="form1" min="0" name="quantity" value="1" type="number"
                                           class="form-control form-control-sm" style="width: 60px;"/>

                                    <button class="btn btn-link px-2"
                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                                <button class="btn btn-select-vang btn-outline-dark flex-shrink-0" type="button" style="width: 150px; background-color: #990d23;">
                                    <i class="bi-cart-fill me-1"></i>
                                    Add to cart
                                </button>
                            </div>
                        </div>
                        <div class="container-fluid section-title mt-5">
                            <h2 class="section-title-main">THÔNG TIN SẢN PHẨM</h2>
                            <hr />
                            ${SanPham.moTa}
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div class="col-sm-3" style="padding: 64px 0;">
            <div class="ss-icon-box d-flex">
                <div class="icon-box-img" style="width: 20px;">
                    <i class="fa-solid fa-phone" style="font-size: 18px; color: #990D23;"></i>
                </div>
                <div class="icon-box-text">
                    <h5 class="text-uppercase">HOTLINE</h5>
                    <p><a href="tel:0346366482">0346.366.482</a></p>
                    <p><a href="tel:0346366482">0346.366.482</a></p>
                    <p><a href="tel:0346366482">0346.366.482</a></p>
                </div>
            </div>
            <div class="ss-icon-box d-flex">
                <div class="icon-box-img" style="width: 20px;">
                    <i class="fa-solid fa-star" style="font-size: 18px; color: #990D23;"></i>
                </div>
                <div class="icon-box-text">
                    <h5 class="text-uppercase">Chương trình khuyến mãi</h5>
                </div>
            </div>
            <div class="ss-icon-box d-flex">
                <div class="icon-box-img" style="width: 20px;">
                    <i class="fa-solid fa-shop" style="font-size: 18px; color: #990D23;"></i>
                </div>
                <div class="icon-box-text">
                    <h5 class="text-uppercase">Thông tin cửa hàng</h5>
                </div>
            </div>
        </div>
        <!-- End Product Detail -->
    </div>
    <div class="container-fluid p-0 mt-5">
        <!-- Footer -->
        <footer class="text-center text-lg-start text-white" style="background-color: #45526e" >
            <!-- Grid container -->
            <div class="container p-4 pb-0">
                <!-- Section: Links -->
                <section>
                    <!--Grid row-->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                            <h6 class="text-uppercase mb-4 font-weight-bold">
                                WINECELLAR.VN
                            </h6>
                            <p>
                                HỆ THỐNG HẦM RƯỢU VANG WINECELLAR.VN (CÔNG TY TNHH HẦM RƯỢU VIỆT NAM)
                            </p>
                        </div>
                        <!-- Grid column -->

                        <hr class="w-100 clearfix d-md-none" />

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                            <h6 class="text-uppercase mb-4 font-weight-bold">Chi nhánh</h6>
                            <p>
                                TP. HÀ NỘI
                            </p>
                            <p>
                                TP. ĐÀ NẴNG
                            </p>
                            <p>
                                NHA TRANG
                            </p>
                            <p>
                                TP. HỒ CHÍ MINH
                            </p>
                        </div>
                        <!-- Grid column -->

                        <hr class="w-100 clearfix d-md-none" />

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                            <h6 class="text-uppercase mb-4 font-weight-bold">
                                Danh mục rượu
                            </h6>
                            <p>
                                <a class="text-white text-decoration-none">Rượu vang</a>
                            </p>
                            <p>
                                <a class="text-white text-decoration-none">Rượu vang Pháp</a>
                            </p>
                            <p>
                                <a class="text-white text-decoration-none">Rượu vang Ý</a>
                            </p>
                            <p>
                                <a class="text-white text-decoration-none">Rượu vang Mỹ</a>
                            </p>
                        </div>

                        <!-- Grid column -->
                        <hr class="w-100 clearfix d-md-none" />

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                            <h6 class="text-uppercase mb-4 font-weight-bold">Liên hệ</h6>
                            <p><i class="fas fa-home mr-3"></i> Số 78 Vũ Phạm Hàm, Yên Hòa, Cầu Giấy</p>
                            <p><i class="fas fa-envelope mr-3"></i> thuonglaph24685@fpt.edu.vn</p>
                            <p><i class="fas fa-phone mr-3"></i> 0346.366.482</p>
                            <p><i class="fas fa-print mr-3"></i> 0346.366.482</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!--Grid row-->
                </section>
                <!-- Section: Links -->

                <hr class="my-3">

                <!-- Section: Copyright -->
                <section class="p-3 pt-0">
                    <div class="row d-flex align-items-center">
                        <!-- Grid column -->
                        <div class="col-md-7 col-lg-8 text-center text-md-start">
                            <!-- Copyright -->
                            <div class="p-3">
                                © 2022 Copyright:
                                <a class="text-white" href="index.html"
                                >Lê Anh Thưởng - PH24685</a
                                >
                            </div>
                            <!-- Copyright -->
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-5 col-lg-4 ml-lg-0 text-center text-md-end">
                            <!-- Facebook -->
                            <a
                                    class="btn btn-outline-light btn-floating m-1"
                                    class="text-white"
                                    role="button"
                            ><i class="fab fa-facebook-f"></i
                            ></a>

                            <!-- Twitter -->
                            <a
                                    class="btn btn-outline-light btn-floating m-1"
                                    class="text-white"
                                    role="button"
                            ><i class="fab fa-twitter"></i
                            ></a>

                            <!-- Google -->
                            <a
                                    class="btn btn-outline-light btn-floating m-1"
                                    class="text-white"
                                    role="button"
                            ><i class="fab fa-google"></i
                            ></a>

                            <!-- Instagram -->
                            <a
                                    class="btn btn-outline-light btn-floating m-1"
                                    class="text-white"
                                    role="button"
                            ><i class="fab fa-instagram"></i
                            ></a>
                        </div>
                        <!-- Grid column -->
                    </div>
                </section>
                <!-- Section: Copyright -->
            </div>
            <!-- Grid container -->
        </footer>
        <!-- Footer -->
    </div>
</div>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/fontawesome-free-6.2.1-web/js/all.min.js"></script>
</body>

</html>