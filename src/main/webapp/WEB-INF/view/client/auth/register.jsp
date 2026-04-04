<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Create Account</title>
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

                <body style="background: #4a6cf7;">
                    <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
                        <div class="col-md-6 col-lg-5">
                            <div class="bg-white rounded shadow p-5">
                                <h3 class="text-center mb-4"><b>Create Account</b></h3>
                                <form:form method="post" action="/register" modelAttribute="registerDTO">
                                    <c:set var="errorFirstName">
                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <form:input type="text" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" placeholder="First name" path="firstName" /> ${errorFirstName}
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <form:input type="text" class="form-control" placeholder="Last name" path="lastName" />
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" placeholder="Email address" path="email" /> ${errorEmail}
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <form:input type="password" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" placeholder="Password" path="password" /> ${errorPassword}
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <form:input type="password" class="form-control" placeholder="Confirm Password" path="confirmPassword" />
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary w-100 py-2">Create Account</button>
                                    </div>
                                    <div class="text-center">
                                        <a href="/login">Have an account? Go to login</a>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </body>

                </html>