<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                        const imgFile = $('#imgFile');
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
                                <h1 class="mt-4">Create Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Create Products</li>
                                </ol>
                                <div class="">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h2 class="header">Create Products</h2>
                                            <hr>
                                            <form:form method="post" modelAttribute="newProduct" action="/admin/product/create" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errName">
                                                            <form:errors path="name" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="exampleInputEmail" class="form-label">Name</label>
                                                        <form:input type="text" class="form-control ${not empty errName ? 'is-invalid' : ''}" aria-describedby="emailHelp" path="name" /> ${errName}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errPrice">
                                                            <form:errors path="price" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="exampleInputPassword" class="form-label">Price</label>
                                                        <form:input type="number" class="form-control ${not empty errPrice ? 'is-invalid' : ''}" path="price" /> ${errPrice}
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <c:set var="errDetailDesc">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="exampleInputAddress" class="form-label">Detail Description</label>
                                                    <form:input type="text" class="form-control ${not empty errDetailDesc ? 'is-invalid' : ''}" path="detailDesc" /> ${errDetailDesc}
                                                </div>
                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errShortDesc">
                                                            <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="exampleInputEmail" class="form-label">Short Description</label>
                                                        <form:input type="text" class="form-control ${not empty errShortDesc ? 'is-invalid' : ''}" path="shortDesc" /> ${errShortDesc}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errQuantity">
                                                            <form:errors path="quantity" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="exampleInputPassword" class="form-label">Quantity</label>
                                                        <form:input type="number" class="form-control ${not empty errQuantity ? 'is-invalid' : ''}" path="quantity" /> ${errQuantity}
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6 ">
                                                        <label class="form-label">Factory</label>
                                                        <form:select class="form-select" path="factory">
                                                            <form:option value="APPLE">Apple (MacBook)</form:option>
                                                            <form:option value="ASUS">Asus</form:option>
                                                            <form:option value="LENOVO">Lenovo</form:option>
                                                            <form:option value="DELL">Dell</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="ACER">Acer</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6 ">
                                                        <label class="form-label">Target</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="GAMING">Gaming</form:option>
                                                            <form:option value="SVVP">Sinh viên - Văn phòng</form:option>
                                                            <form:option value="TKDH">Thiết kế đồ họa</form:option>
                                                            <form:option value="MN">Mỏng nhẹ</form:option>
                                                            <form:option value="DN">Doanh nhân</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="imgFile" class="form-label">Image</label>
                                                    <input class="form-control" type="file" id="imgFile" name="imgFile" accept=".png, .jpg, .jpeg" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img src="" alt="img preview" style="max-height: 250px; display: none;" id="imgPreview">
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Create</button>
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