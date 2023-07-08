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
    </style>
</head>

<body style="color: #fff; background-color: #1d2630;">

<div class="card" style="color: #fff; background-color: #1d2630;">
    <div class="card-body mx-4">
        <div class="container">
            <p class="my-5 mx-5" style="font-size: 30px;">Thank for your purchase</p>
            <div class="row">
                <ul class="list-unstyled">
                    <li class="text-black">${orderBill.account.hoVaTen}</li>
                    <li class="text-muted mt-1"><span class="text-black">Mã đơn hàng</span> #${orderBill.id}</li>
                    <li class="text-black mt-1">${orderBill.ngayTao}</li>
                </ul>
                <hr>
            </div>
            <c:forEach items="${orderDetailBill}" var="orderDetail">
                <div class="row">
                    <div class="col-xl-10">
                        <p>${orderDetail.product.tenSanPham} <strong>x ${orderDetail.soLuong}</strong></p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end">${orderDetail.product.donGia}
                        </p>
                    </div>
                    <hr>
                </div>
            </c:forEach>
            <div class="col-xl-12">
                <p class="float-end fw-bold">Total: $10.00
                </p>
            </div>
            <hr style="border: 2px solid black;">
        </div>
        </div>
    </div>
</div>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="/icons/fontawesome-free-6.2.1-web/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</body>

</html>