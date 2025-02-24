<style>
/* Scoped footer styles: chỉ ảnh hưởng trong #custom-footer */
#custom-footer .footer-bg .footer-content {
    padding-top: 40px;
}

#custom-footer .footer-bg h5 {
    font-weight: 600;
    color: #fff;
}

#custom-footer .footer-bg a {
    color: rgb(255, 255, 255) !important;
}

#custom-footer .footer-bg a:hover {
    color: #007bff !important;
    text-decoration: none;
}

#custom-footer .footer-bg .social-icons i {
    font-size: 1.5rem;
    margin-right: 15px;
}

#custom-footer .footer-bg .social-icons a {
    color: #6c757d !important;
    text-decoration: none;
}

#custom-footer .footer-bg .social-icons a:hover {
    color: #007bff !important;
}

/* CSS background image và overlay */
#custom-footer .footer-bg {
    position: relative;
    background: url('https://bizweb.dktcdn.net/100/336/794/themes/692935/assets/bg_subscribe.jpg?1705630560215') no-repeat center center;
    background-size: cover;
    color: #fff;
}

#custom-footer .footer-bg::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(26, 59, 93, 0.90);
    z-index: 0;
}

/* Nội dung footer hiển thị trên overlay */
#custom-footer .footer-content {
    position: relative;
    z-index: 1;
}
</style>
</head>

<body>

    <!-- Footer -->
    <div id="custom-footer">
        <footer class="footer-bg mt-4">
            <div class="container footer-content">
                <div class="row">
                    <!-- Về chúng tôi -->
                    <div class="col-md-7 mb-4">
                        <h5>VỀ CHÚNG TÔI</h5>
                        <p>
                            Bất động sản Huỳnh Tuấn - Chuyên mua bán, cho thuê và đầu tư bất động sản, cam kết mang đến giải pháp tối ưu
                            cho khách hàng.
                            Chúng tôi là cầu nối giữa chủ đầu tư và khách hàng, đảm bảo giao dịch minh bạch, nhanh
                            chóng.
                        </p>
                        <p>Tìm tin bán hoặc cho thuê nhà đất mới nhất ngay!</p>
                    </div>

                    <!-- Truy cập nhanh -->
                    <div class="col-md-2 col-6 mb-4">
                        <h5>TRUY CẬP NHANH</h5>
                        <ul class="list-unstyled">
                            <li class="nav-item"><a class="nav-link" href="{{ url('/') }}">Trang chủ</a></li>
                            <li class="nav-item"><a class="nav-link" href="{{ url('/introduce') }}">Giới thiệu</a></li>
                            <li class="nav-item"><a class="nav-link" href="{{ url('/post-property') }}">Đăng tin bất
                                    động sản</a></li>
                        </ul>
                    </div>

                    <!-- Liên hệ -->
                    <div class="col-md-3 col-6 mb-4">
                        <h5>LIÊN HỆ</h5>
                        <div class="social-icons">
                            <a href="https://www.facebook.com" class="text-light" target="_blank">
                                <i class="bi bi-facebook"></i>
                            </a>
                            <a href="https://twitter.com" class="text-light" target="_blank">
                                <i class="bi bi-twitter"></i>
                            </a>
                            <a href="https://www.instagram.com" class="text-light" target="_blank">
                                <i class="bi bi-instagram"></i>
                            </a>
                            <a href="https://www.linkedin.com" class="text-light" target="_blank">
                                <i class="bi bi-linkedin"></i>
                            </a>
                            <a href="https://www.youtube.com" class="text-light" target="_blank">
                                <i class="bi bi-youtube"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-1">
                    <small>Bản quyền thuộc về <span class="text-primary">Nhóm 5</span></small> | Đồ án PHP <span
                        class="text-primary">Nhóm 5</span>
                </div>
            </div>
        </footer>
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">