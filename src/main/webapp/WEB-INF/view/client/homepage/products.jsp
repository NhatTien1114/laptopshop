<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="#">Danh Sách Sản Phẩm</a></li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-6">
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-4">
                                    <div class="col-lg-4">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="mb-4" id="factoryFilter">
                                                    <h4 class="fw-bold mb-3">Hãng sản xuất</h4>
                                                    <div class="row row-cols-4 g-2">
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="APPLE" id="brandApple">
                                                                <label class="form-check-label" for="brandApple">Apple</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="ASUS" id="brandAsus">
                                                                <label class="form-check-label" for="brandAsus">Asus</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="LENOVO" id="brandLenovo">
                                                                <label class="form-check-label" for="brandLenovo">Lenovo</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="DELL" id="brandDell">
                                                                <label class="form-check-label" for="brandDell">Dell</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="LG" id="brandLG">
                                                                <label class="form-check-label" for="brandLG">LG</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="ACER" id="brandAcer">
                                                                <label class="form-check-label" for="brandAcer">Acer</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-4" id="targetFilter">
                                                    <h4 class="fw-bold mb-3">Mục đích sử dụng</h4>
                                                    <div class="row row-cols-2 g-2">
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="GAMING" id="purposeGaming">
                                                                <label class="form-check-label" for="purposeGaming">Gaming</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="SINH-VIEN-VAN-PHONG" id="purposeOfficeStudent">
                                                                <label class="form-check-label" for="purposeOfficeStudent">Sinh viên - văn phòng</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="THIET-KE-DO-HOA" id="purposeDesign">
                                                                <label class="form-check-label" for="purposeDesign">Thiết kế đồ họa</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="MONG-NHE" id="purposeThinLight">
                                                                <label class="form-check-label" for="purposeThinLight">Mỏng nhẹ</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="DOANH-NHAN" id="purposeBusiness">
                                                                <label class="form-check-label" for="purposeBusiness">Doanh nhân</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3" id="priceFilter">
                                                    <h4 class="fw-bold mb-3">Mức giá</h4>
                                                    <div class="row row-cols-2 g-2">
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="duoi-10-trieu" id="priceUnder10">
                                                                <label class="form-check-label" for="priceUnder10">Dưới 10 triệu</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="10-15-trieu" id="price10to15">
                                                                <label class="form-check-label" for="price10to15">Từ 10 - 15 triệu</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="15-20-trieu" id="price15to20">
                                                                <label class="form-check-label" for="price15to20">Từ 15 - 20 triệu</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check mb-1">
                                                                <input class="form-check-input" type="checkbox" value="tren-20-trieu" id="priceOver20">
                                                                <label class="form-check-label" for="priceOver20">Trên 20 triệu</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <h4 class="fw-bold mb-3">Sắp xếp</h4>
                                                    <div class="row row-cols-2 g-2">
                                                        <div class="col">
                                                            <div class="form-radio mb-1">
                                                                <input class="form-radio-input" type="radio" name="radio-sort" value="gia-tang-dan" id="sortAsc">
                                                                <label class="form-radio-label" for="sortAsc">Giá tăng dần</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-radio mb-1">
                                                                <input class="form-radio-input" type="radio" name="radio-sort" value="gia-giam-dan" id="sortDesc">
                                                                <label class="form-radio-label" for="sortDesc">Giá giảm dần</label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-radio mb-1">
                                                                <input class="form-radio-input" type="radio" name="radio-sort" value="" id="sortNone" checked>
                                                                <label class="form-radio-label" for="sortNone">Không sắp xếp</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-flex my-4">
                                                    <button class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-50" id="btnFilter">Lọc sản phẩm</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="row g-4 justify-content-center">

                                            <c:if test="${products != null}">
                                                <c:forEach var="product" items="${products}">
                                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/image/product/${product.image}" class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Laptop</div>
                                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>${product.name}</h4>
                                                                <p>${product.shortDesc}</p>
                                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" groupingUsed="true" />
                                                                    </p>
                                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                            <div class="col-12">
                                                <div class="pagination d-flex justify-content-center mt-5">
                                                    <c:choose>
                                                        <c:when test="${currentPage > 1}">
                                                            <a href="/products?page=${currentPage - 1}" class="rounded">&laquo;</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="javascript:void(0)" class="rounded disabled">&laquo;</a>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                                                        <a href="/products?page=${pageNumber}" class="${pageNumber == currentPage ? 'active rounded' : 'rounded'}">${pageNumber}</a>
                                                    </c:forEach>

                                                    <c:choose>
                                                        <c:when test="${currentPage < totalPages}">
                                                            <a href="/products?page=${currentPage + 1}" class="rounded">&raquo;</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="javascript:void(0)" class="rounded disabled">&raquo;</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>

                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                    <script src="/js/scripts.js"></script>
                    </div>
                </body>

                </html>