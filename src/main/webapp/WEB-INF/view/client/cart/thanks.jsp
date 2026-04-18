<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Cảm ơn bạn đã đặt hàng</title>
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

            <!-- Thank You Start -->
            <div class="container-fluid fruite py-5">
                <div class="container py-5">
                    <div class="mb-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Đặt hàng thành công</li>
                            </ol>
                        </nav>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-12 col-md-8">
                            <div class="bg-light rounded p-5 text-center">
                                <div class="mb-4">
                                    <i class="fas fa-check-circle text-success" style="font-size: 80px;"></i>
                                </div>
                                <h1 class="display-6 text-primary mb-3">Cảm ơn bạn đã đặt hàng!</h1>
                                <p class="mb-4" style="font-size: 18px;">
                                    Đơn hàng của bạn đã được tiếp nhận và đang được xử lý.
                                    <br>Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất.
                                </p>
                                <hr class="my-4">
                                <p class="text-muted mb-4">
                                    Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi qua email hoặc số điện thoại hỗ trợ.
                                </p>
                                <div class="d-flex justify-content-center gap-3">
                                    <a href="/" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase">
                                        <i class="fas fa-home me-2"></i>Trang chủ
                                    </a>
                                    <a href="/products" class="btn btn-primary rounded-pill px-4 py-3 text-uppercase" style="color: white;">
                                        <i class="fas fa-shopping-bag me-2"></i>Tiếp tục mua sắm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Thank You End -->

            <jsp:include page="../layout/feature.jsp" />

            <jsp:include page="../layout/footer.jsp" />

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
        </body>

        </html>