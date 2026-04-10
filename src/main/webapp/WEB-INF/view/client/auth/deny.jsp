<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Access Denied</title>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }
                
                body {
                    font-family: 'Poppins', sans-serif;
                    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    overflow: hidden;
                }
                
                .container {
                    text-align: center;
                    padding: 40px;
                    max-width: 600px;
                    animation: fadeInUp 0.8s ease-out;
                }
                
                .image-wrapper {
                    position: relative;
                    display: inline-block;
                    margin-bottom: 20px;
                }
                
                .image-wrapper img {
                    width: 320px;
                    max-width: 100%;
                    height: auto;
                    filter: drop-shadow(0 20px 40px rgba(0, 0, 0, 0.15));
                    animation: float 3s ease-in-out infinite;
                }
                
                h1 {
                    font-size: 2rem;
                    font-weight: 700;
                    color: #2d3436;
                    margin-bottom: 12px;
                }
                
                h1 span {
                    color: #e17055;
                }
                
                p {
                    font-size: 1.05rem;
                    color: #636e72;
                    line-height: 1.7;
                    margin-bottom: 30px;
                    font-weight: 300;
                }
                
                .btn-group {
                    display: flex;
                    gap: 16px;
                    justify-content: center;
                    flex-wrap: wrap;
                }
                
                .btn {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    padding: 14px 32px;
                    border-radius: 50px;
                    text-decoration: none;
                    font-size: 0.95rem;
                    font-weight: 600;
                    transition: all 0.3s ease;
                    cursor: pointer;
                    border: none;
                }
                
                .btn-primary {
                    background: linear-gradient(135deg, #fdcb6e, #e17055);
                    color: #fff;
                    box-shadow: 0 8px 25px rgba(225, 112, 85, 0.35);
                }
                
                .btn-primary:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 12px 35px rgba(225, 112, 85, 0.5);
                }
                
                .btn-outline {
                    background: rgba(255, 255, 255, 0.7);
                    color: #2d3436;
                    border: 2px solid #dfe6e9;
                    backdrop-filter: blur(10px);
                }
                
                .btn-outline:hover {
                    background: #fff;
                    border-color: #b2bec3;
                    transform: translateY(-3px);
                    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
                }
                
                @keyframes float {
                    0%,
                    100% {
                        transform: translateY(0);
                    }
                    50% {
                        transform: translateY(-15px);
                    }
                }
                
                @keyframes fadeInUp {
                    from {
                        opacity: 0;
                        transform: translateY(30px);
                    }
                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }
                
                @media (max-width: 480px) {
                    .container {
                        padding: 24px;
                    }
                    .image-wrapper img {
                        width: 240px;
                    }
                    h1 {
                        font-size: 1.5rem;
                    }
                    p {
                        font-size: 0.95rem;
                    }
                    .btn {
                        padding: 12px 24px;
                        font-size: 0.9rem;
                    }
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="image-wrapper">
                    <img src="/image/404.png" alt="Access Denied" />
                </div>
                <h1>Truy cập <span>bị từ chối!</span></h1>
                <p>
                    Bạn không có quyền truy cập trang này. Vui lòng quay lại trang chủ hoặc liên hệ quản trị viên nếu bạn cho rằng đây là lỗi.
                </p>
                <div class="btn-group">
                    <a href="/" class="btn btn-primary">
                &#8592; Về trang chủ
            </a>
                    <a href="/login" class="btn btn-outline">
                Đăng nhập lại
            </a>
                </div>
            </div>
        </body>

        </html>