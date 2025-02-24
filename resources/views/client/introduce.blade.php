<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Giới thiệu</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
    html,
    body {
        height: 100%;
        margin: 0;
    }

    body {
        display: flex;
        flex-direction: column;
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }

    main {
        flex: 1;
    }

    /* Hero Section */
    .hero {
        position: relative;
        background: url('https://storage.googleapis.com/a1aa/image/CjgcSUlZyLPz64bYHj02YltkWTG0SdXZxHe3xdlVVis.jpg') no-repeat center center;
        background-size: cover;
        height: 300px;
    }

    .hero-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .hero-content {
        position: relative;
        z-index: 2;
        color: #fff;
        text-align: center;
        top: 50%;
        transform: translateY(-50%);
    }
    </style>
</head>

<body>
    <!-- Bao gồm Navbar -->
    @include('client.navbar')

    <!-- Hero Section -->
    <header class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content container">
            <h1 class="display-4">Giới thiệu</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Trang chủ</a></li>
                    <li class="breadcrumb-item active text-white" aria-current="page">Giới thiệu</li>
                </ol>
            </nav>
        </div>
    </header>
    <!-- End Hero Section -->

    <!-- Main Content -->
    <main class="container my-5">
        <h2 class="mb-4">Giới thiệu</h2>
        <p>
            Năm 2018, tận dụng cơ hội hội nhập toàn cầu, Tập đoàn dược phẩm <strong>Bất động sản Huỳnh Tuấn</strong>
            được thành lập tại TpHCM. Với hơn 7 năm kinh nghiệm trong lĩnh vực kinh doanh bất động sản.
        </p>
        <p>
            <strong>Bất động sản h</strong> cam kết mang đến “miền đất hạnh phúc vẹn tròn” cho các gia đình Việt qua các
            dự án bất động sản đa dạng, được thiết kế theo tiêu chuẩn hệ sinh thái xanh, kết hợp tiện ích chăm sóc sức
            khỏe và giải pháp tiết kiệm năng lượng.
        </p>
        <p>
            Với triết lý “Trọn chữ TÂM, vẹn chữ TÍN” và logo biểu tượng hài hòa giữa yếu tố thiên – địa – nhân,
            <strong>Bất động sản h</strong> khẳng định cam kết về chất lượng sản phẩm và sự phát triển bền vững cho cộng
            đồng.
        </p>
    </main>

    <!-- Footer -->
    @include('client.footer')

    <!-- Bootstrap Bundle JS (bao gồm Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
