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
        <h2 class="mb-4">Giới Thiệu Về Chúng Tôi</h2>
        <p>
            Được thành lập vào năm 2018 tại Thành phố Hồ Chí Minh, <strong>Bất động sản Huỳnh Tuấn</strong> đã nhanh chóng trở thành một trong những thương hiệu uy tín trong lĩnh vực bất động sản. Với hơn 7 năm kinh nghiệm, chúng tôi tự hào là đơn vị tiên phong trong việc phát triển các dự án bất động sản chất lượng cao, đáp ứng nhu cầu của hàng nghìn gia đình Việt Nam.
        </p>
        <p>
            <strong>Bất động sản Huỳnh Tuấn</strong> cam kết mang đến “miền đất hạnh phúc vẹn tròn” thông qua các dự án bất động sản đa dạng, được thiết kế theo tiêu chuẩn hệ sinh thái xanh, kết hợp với tiện ích chăm sóc sức khỏe và các giải pháp tiết kiệm năng lượng tiên tiến. Chúng tôi luôn tập trung vào việc xây dựng những không gian sống lý tưởng, hài hòa với thiên nhiên, giúp khách hàng tận hưởng cuộc sống thoải mái, an lành và bền vững.
        </p>
        <p>
            Với triết lý “Trọn chữ TÂM, vẹn chữ TÍN”, <strong>Bất động sản Huỳnh Tuấn</strong> cam kết mang đến những sản phẩm chất lượng vượt trội và dịch vụ chuyên nghiệp. Logo của chúng tôi biểu tượng cho sự hài hòa giữa yếu tố thiên, địa, nhân, thể hiện tầm nhìn dài hạn và sự phát triển bền vững. Chúng tôi không chỉ xây dựng nhà ở, mà còn xây dựng niềm tin và giá trị cho cộng đồng.
        </p>
        <p>
            Chúng tôi tự hào là người bạn đồng hành đáng tin cậy của các gia đình Việt trên hành trình tìm kiếm một mái ấm vững bền. Với tầm nhìn chiến lược và đội ngũ chuyên gia giàu kinh nghiệm, <strong>Bất động sản Huỳnh Tuấn</strong> cam kết tiếp tục phát triển và tạo ra những dự án bất động sản chất lượng, góp phần nâng cao chất lượng cuộc sống cho cộng đồng.
        </p>
    </main>

    <!-- Footer -->
    @include('client.footer')

    <!-- Bootstrap Bundle JS (bao gồm Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
