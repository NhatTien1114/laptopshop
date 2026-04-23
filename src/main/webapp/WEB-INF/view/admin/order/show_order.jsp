<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Laptopshop</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Orders</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Orders</li>
                                </ol>
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h2 class="header">Table Orders</h2>
                                        </div>
                                        <hr>
                                        <table class="table table-dark table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Total Price</th>
                                                    <th scope="col">User</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="order" items="${orders}">
                                                    <tr>
                                                        <th>${order.id}</th>
                                                        <th>
                                                            <fmt:formatNumber value="${order.totalPrice}" type="number" /> đ
                                                        </th>
                                                        <th>${order.user.fullName}</th>
                                                        <th>${order.status}</th>
                                                        <th>
                                                            <a href="/admin/order/${order.id}" class="btn btn-success">View</a>
                                                            <a href="/admin/order/update/${order.id}" class="btn btn-warning">Update</a>
                                                            <a href="/admin/order/delete/${order.id}" class="btn btn-danger">Delete</a>
                                                        </th>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item">
                                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}" href="/admin/order?page=${currentPage - 1}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <c:forEach varStatus="loop" begin="0" end="${totalPages - 1}">
                                                    <li class="page-item">
                                                        <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}" href="/admin/order?page=${loop.index + 1}">${loop.index + 1}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item">
                                                    <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}" href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
                    <script src="js/chart-area-demo.js"></script>
                    <script src="js/chart-bar-demo.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
                    <script src="js/datatables-simple-demo.js"></script>
                </div>
            </body>

            </html>