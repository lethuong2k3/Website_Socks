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
<div class="container mt-5" >
    <div class="text-center">
        <h1 class="display-5 mb-3"><strong>Quản lý order</strong></h1>
    </div>

</div>
<div class="contaier-fluid" >
    <form class="form-search d-flex" style="margin-left: 30px; width: 400px">
        <input name="tenSanPham" value="${param.tenSanPham}" class="form-control me-2" type="text" placeholder="Tìm kiếm" />
        <button type="submit" class="btn btn-light" type="button">Search</button>
    </form>
    <div class="row m-0 mt-3 px-4">
        <table class="table table-striped table-dark">
            <thead>
            <tr>
                <th>Người nhận</th>
                <th>Số điện thoại</th>
                <th>Ngày đặt</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody class="product-list">
            <c:if test="${empty page.getContent()}">
                <tr style="text-align: center">
                    <td colspan="6">Không có đơn hàng nào cả</td>
                </tr>
            </c:if>
            <c:forEach items="${page.getContent()}" var="order">
                <tr>
                    <td>${order.hoVaTen}</td>
                    <td>${order.sdt}</td>
                    <td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${order.ngayTao}" /></td>
                    <td>
                        <div class="d-flex" style="width: 100%; height: 40px;" >
                            <a href="/admin/orders/${order.id}"><button class="btn btn-warning btn-sm edit" style="width: 78.96px;">Chi tiết</button></a>
                            <a href="/admin/orders/bill/${order.id}"><button class="btn btn-danger btn-sm delete" style="width: 78.96px;">Hóa đơn</button></a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:set var="currentPage" value="${page.number}" />
                <c:set var="totalPages" value="${page.totalPages}" />

                <c:if test="${page.getNumber() + 1 > 1}">
                    <li class="page-item">
                        <a class="page-link" href="?page=1&tenSanPham=${param.tenSanPham}" aria-label="First">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:if test="${currentPage + 1 > 1}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${currentPage}&tenSanPham=${param.tenSanPham}" aria-label="Previous">
                            <span aria-hidden="true">&lt;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                    <li class="page-item ${pageNumber == currentPage + 1 ? 'active' : ''}">
                        <a class="page-link" href="?page=${pageNumber}&tenSanPham=${param.tenSanPham}">
                            <c:out value="${pageNumber}" />
                        </a>
                    </li>
                </c:forEach>

                <c:if test="${page.getNumber() + 1 lt page.getTotalPages()}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${page.getNumber() + 2}&tenSanPham=${param.tenSanPham}" aria-label="Next">
                            <span aria-hidden="true">&gt;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${currentPage + 1 < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${totalPages}&tenSanPham=${param.tenSanPham}" aria-label="Last">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="/icons/fontawesome-free-6.2.1-web/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</body>

</html>