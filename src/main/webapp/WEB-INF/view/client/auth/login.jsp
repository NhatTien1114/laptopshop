<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng nhập</title>
            <link rel="stylesheet" href="/client/css/bootstrap.min.css">
        </head>

        <body style="background: #4a6cf7;">
            <div class="container">
                <div class="row d-flex justify-content-center align-items-center" style="min-height: 100vh;">
                    <div class="col-md-6 col-lg-5">
                        <div class="bg-white rounded shadow p-5">
                            <h3 class="text-center mb-4">Đăng nhập</h3>

                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger" role="alert">
                                    Email hoặc mật khẩu không đúng.
                                </div>
                            </c:if>

                            <form method="post" action="/login">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="username" name="username" placeholder="Nhập email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Mật khẩu</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                            </form>

                            <p class="text-center mt-3">
                                Chưa có tài khoản? <a href="/register">Đăng ký</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>