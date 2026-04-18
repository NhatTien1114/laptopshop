<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script>
                        $(document).ready(() => {
                            const imgFile = $("#imgFile");
                            const imgPreview = "${productUpdate.image}";
                            if (imgPreview) {
                                const imgURL = "/image/product/" + imgPreview;
                                $("#imgPreview").attr("src", imgURL);
                                $("#imgPreview").css({
                                    "display": "block"
                                });
                            }
                            imgFile.change(function(e) {
                                const file = e.target.files[0];
                                if (!file) {
                                    return;
                                }
                                const imgURL = URL.createObjectURL(file);
                                $("#imgPreview").attr("src", imgURL);
                                $("#imgPreview").css({
                                    "display": "block"
                                });
                            });
                        });
                    </script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Update Product</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Update Product</li>
                                    </ol>
                                    <div class="">
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h2>Update a order</h2>
                                                <hr>
                                                <form:form method="post" modelAttribute="orderUpdate" action="/admin/order/update/${orderUpdate.id}">
                                                    <form:hidden path="id" />
                                                    <div class="row">
                                                        <div class="mb-3 col-12 col-md-6">
                                                            <label class="form-label">Order id = ${orderUpdate.id}</label>
                                                            <label class="form-label">Price: <fmt:formatNumber value="${orderUpdate.totalPrice}" type="number" /> đ</label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="mb-3 col-12 col-md-6">
                                                            <label class="form-label">User</label>
                                                            <form:input type="text" class="form-control" path="user.fullName" readonly="true" />
                                                        </div>
                                                        <div class="mb-3 col-12 col-md-6 ">
                                                            <label class="form-label">Status</label>
                                                            <form:select class="form-select" path="status">
                                                                <form:option value="PENDING">PENDING</form:option>
                                                                <form:option value="SHIPPING">SHIPPING</form:option>
                                                                <form:option value="COMPLETE">COMPLETE</form:option>
                                                                <form:option value="CANCEL">CANCEL</form:option>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 mb-5">
                                                        <button type="submit" class="btn btn-warning">Update</button>
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>
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