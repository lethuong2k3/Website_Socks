<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/icons/fontawesome-free-6.2.1-web/css/all.min.css">
    <style>
        .select2-results {
            color: #000;
        }

        .modal-body label{
            color: #000;
        }

        .contai {
            width: 80%;
            height: 200px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 4px 4px 30px rgba(0, 0, 0, 0.06);
            margin: auto;
            padding: 20px;
            overflow-y: scroll;
        }

        .contai::-webkit-scrollbar {
            display: none;
        }

        .contai form {
            width: 100%;
            border: 1px solid rgb(82, 74, 235);
            border-radius: 4px;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .contai form input {
            border: none;
            outline: none;
            box-shadow: none;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            padding: 8px 10px;
        }

        .contai form svg {
            padding-left: 10px;
            color: black;
        }

        .product-list {
            padding: 20px 0;
        }

        .product {
            display: flex;
            align-items: center;
        }
    </style>
</head>

<body style="color: #fff; background-color: #1d2630;">
<div class="container mt-5" >
    <div class="text-center">
        <h1 class="display-5 mb-3"><strong>Thông tin đơn hàng</strong></h1>
    </div>
</div>
<div class="contaier-fluid" >
    <h4 style="margin-left: 20px"><strong>Người nhận</strong></h4>
    <div class="row m-0 mt-3 px-4">
        <table class="table table-striped table-dark">
            <thead>
            <tr>
                <th>Họ và tên</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody class="product-list">
                <tr>
                    <td>${order.account.hoVaTen}</td>
                    <td>${order.account.sdt}</td>
                    <td>${order.diaChiGiaoHang}</td>
                    <td>${order.account.email}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="contaier-fluid" >
    <section class="contai">
        <form>
            <i class="fa-solid fa-magnifying-glass"></i>
            <input onkeyup="search()" type="text" name="" id="search-item" placeholder="Tìm thêm sản phẩm">
        </form>

        <div class="product-list" id="product-list">
            <div class="product">
                <table class="table">
                    <tbody>
                    <c:forEach items="${listProduct}" var="product">
                        <tr>
                            <td><h6 class="nameProduct">${product.tenSanPham}</h6></td>
                            <td>${product.soLuong}</td>
                            <td>${product.donGia}</td>
                            <td>
                                <div class="d-flex" style="width: 100%; height: 40px;">
                                    <a href="/admin/orders/add/${product.id}">
                                        <button class="btn btn-success" style="width: 78.96px;">Thêm</button>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <div class="row m-0 mt-3 px-4">
        <h4><strong>Chi tiết đơn hàng</strong></h4>
        <table class="table table-striped table-dark">
            <thead>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody class="product-list">
            <c:set var="totalPrice" value="0" />
            <c:forEach items="${listOrderDetails}" var="orderDetail">
                <tr>
                    <td>${orderDetail.product.tenSanPham}</td>
                    <td><input value="${orderDetail.soLuong}" style="width: 70px; border: none; outline: none; background: #162938; color: #fff" min="1" type="number" /></td>
                    <td>${orderDetail.gia}</td>
                    <td>
                        <div class="d-flex" style="width: 100%; height: 40px;" >
                            <a href="/admin/orders/delete/${orderDetail.id}"><button class="btn btn-danger btn-sm delete" style="width: 78.96px;">Xóa</button></a>
                        </div>
                    </td>
                </tr>
                <c:set var="subTotal" value="${orderDetail.soLuong * orderDetail.gia}" />
                <c:set var="totalPrice" value="${totalPrice + subTotal}" />
            </c:forEach>
                <tr>
                    <td colspan="3"><h5>Tổng tiền</h5></td>
                    <td>${totalPrice}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JavaScript Libraries -->
<script>
    const search = () => {
        const searchbox = document.getElementById("search-item").value.toUpperCase();
        const products = document.querySelectorAll(".product");
        for (let i = 0; i < products.length; i++) {
            const match = products[i].querySelector(".nameProduct");
            if (match) {
                const textValue = match.textContent || match.innerText;
                if (textValue.toUpperCase().indexOf(searchbox) > -1) {
                    products[i].style.display = "";
                } else {
                    products[i].style.display = "none";
                }
            }
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="/icons/fontawesome-free-6.2.1-web/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</body>

</html>