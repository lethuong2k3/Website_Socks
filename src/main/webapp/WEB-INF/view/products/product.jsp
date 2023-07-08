<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <h1 class="display-5 mb-3"><strong>Quản lý sản phẩm</strong></h1>
    </div>
    <form:form action="/admin/products/add" method="post" modelAttribute="product" enctype="multipart/form-data" id="product-form" class="row justify-content-center mb-4">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                        <div class="row">
                                <div class="mt-3 mb-3">
                                    <label for="productName">Tên sản phẩm</label>
                                    <form:input path="tenSanPham" type="text" class="form-control" id="productName" />
                                </div>
                                <div class="row m-0 p-0">
                                    <div class="col-sm-6">
                                        <div>
                                            <label for="productColor">Màu sắc</label>
                                            <form:input path="mauSac" type="text" class="form-control" id="productColor" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div>
                                            <label for="productOther">Họa tiết</label>
                                            <form:input path="hoaTiet" type="text" class="form-control" id="productOther" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0 p-0">
                                    <div class="col-sm-6">
                                        <div class="mt-3 mb-3">
                                            <label>Kích thước</label>
                                            <button style="width: 221px" type="button" class="btn btn-primary" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                                                <i class="fa-solid fa-plus"></i> Kích thước
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="mt-3 mb-3">
                                            <label for="productQuantity">Số lượng</label>
                                            <form:input path="soLuong" type="number" class="form-control" id="productQuantity" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0">
                                    <label style="padding: 0px">Loại</label>
                                    <form:select path="category" class="form-select">
                                        <c:forEach items="${listCate}" var="cate">
                                            <form:option value="${cate}">
                                                ${cate.ten}
                                            </form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                                <div class="row m-0 p-0">
                                    <div>
                                        <label for="productPrice">Đơn giá</label>
                                        <div class="input-group mb-3">
                                            <form:input path="donGia" class="form-control" id="productPrice" />
                                            <span class="input-group-text" id="basic-addon2">VND</span>
                                        </div>
                                    </div>

                                </div>
                                <div class="mt-2 mb-2">
                                    <div class="form-check">
                                        <form:checkbox path="noiBat" value="true" class="form-check-input" id="checkNoiBat" />
                                        <label class="form-check-label" for="checkNoiBat">
                                            Sản phẩm nổi bật
                                        </label>
                                    </div>
                                </div>
                                <div class="mt-2 mb-2">
                                    <div class="form-check">
                                        <form:checkbox path="trangThai" value="true" class="form-check-input" id="flexCheckChecked" />
                                        <label class="form-check-label" for="flexCheckChecked">
                                            Còn hàng
                                        </label>
                                    </div>
                                </div>
                                <div class="mt-3 mb-3">
                                    <label for="productComment">Thông tin sản phẩm</label>
                                    <form:textarea path="moTa" class="form-control w-100" id="productComment" rows="4"></form:textarea>
                                </div>
                                <div class="d-flex mb-3">
                                    <input value="${product.hinhAnh}" id="picture" name="attach" type="file" class="btn btn-light add-btn" style="margin-right: 15px; width: 320px;" />
                                </div>
                                <div class="modal-footer">
                                    <div class="d-flex">
                                        <button type="submit" class="btn btn-success add-btn" style="margin-right: 15px; width: 100px;">Thêm</button>
                                        <c:if test="${not empty product.id}">
                                            <button formaction="/admin/products/update/${product.id}" class="btn btn-primary add-btn" style="width: 100px;">Cập nhật</button>
                                        </c:if>
                                    </div>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
        <div class="modal fade row" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body m-0">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Chọn</th>
                                <th scope="col">Size</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listSize}" var="size">
                                <tr>
                                    <td><input class="productSize" type="checkbox" name="productSize" value="${size.id}"
                                               <c:if test="${listProductSize.contains(size.id)}">checked</c:if>/>
                                    </td>
                                    <td>${size.tenSize}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#exampleModal">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</div>
<div class="contaier-fluid" >
    <form class="form-search d-flex" style="margin-left: 30px; width: 400px">
        <input name="tenSanPham" value="${param.tenSanPham}" class="form-control me-2" type="text" placeholder="Tìm kiếm" />
        <button type="submit" class="btn btn-light" type="button">Search</button>
    </form>
    <div class="d-flex mt-3 mb-3" style="margin-left: 30px;">
        <button onclick="resetInput()" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <i class="fa-solid fa-circle-plus"></i> Thêm sản phẩm
        </button>
    </div>
    <div class="row m-0 mt-3 px-4">
        <table class="table table-striped table-dark">
            <thead>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Hình ảnh</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Loại</th>
                <th>Nổi bật</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody class="product-list">
            <c:if test="${empty page.getContent()}">
                <tr style="text-align: center">
                    <td colspan="9">Không có sản phẩm nào</td>
                </tr>
            </c:if>
            <c:forEach items="${page.getContent()}" var="product">
                <tr>
                    <td>${product.tenSanPham}</td>
                    <td><img alt="${product.hinhAnh}" src="/images/${product.hinhAnh}"
                             width="50" height="50"></td>
                    <td>${product.soLuong}</td>
                    <td>${product.donGia}</td>
                    <td>${product.category.ten}</td>
                    <td>${product.noiBat ? "Có" : "Không"}</td>
                    <td>${product.trangThai ? "Còn hàng" : "Hết hàng"}</td>
                    <td>
                        <div class="d-flex" style="width: 100%; height: 40px;" >
                            <a href="/admin/products/load/${product.id}?page=${page.getNumber() + 1}"><button class="btn btn-warning btn-sm edit" style="width: 78.96px;">Sửa</button></a>
                            <a href="/admin/products/delete/${product.id}"><button class="btn btn-danger btn-sm delete" style="width: 78.96px;">Xóa</button></a>
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
<script>
    var checkbox = document.getElementById("flexCheckChecked");

    // Set the 'checked' property to true
    checkbox.checked = true;
    function resetInput() {
        let productName = document.getElementById('productName');
        let productColor = document.getElementById('productColor');
        let productOther = document.getElementById('productOther');
        let productQuantity = document.getElementById('productQuantity');
        let productPrice = document.getElementById('productPrice');
        let checkboxList = document.querySelectorAll('.productSize');
        productName.value = null;
        productColor.value = null;
        productOther.value = null;
        productQuantity.value = null;
        productPrice.value = null;
        checkboxList.forEach(function(checkbox) {
            checkbox.checked = false;
        });
    }
    <c:if test="${showModal}">
        $(document).ready(function() {
            $('#exampleModal').modal('show');
        });
    </c:if>
</script>

</body>

</html>