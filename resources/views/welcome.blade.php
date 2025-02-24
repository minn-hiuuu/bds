<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Bất Động Sản</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        /* Đảm bảo toàn bộ trang có chiều cao 100% */
        html,
        body {
            height: 100%;
            margin: 0;
        }

        /* Sử dụng Flexbox cho body để đẩy footer xuống dưới */
        body {
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
        }

        /* Phần main sẽ chiếm toàn bộ không gian giữa header và footer */
        main {
            flex: 1;
        }

        /* Hero Section */
        .hero-section {
            background-color: #1a3b5d;
            color: white;
            padding: 100px 0;
            text-align: center;
            background-image: url('https://bizweb.dktcdn.net/thumb/large/100/393/384/themes/894826/assets/slider_1.jpg?1730695187968');
            background-size: cover;
            background-position: center;
        }

        .hero-section h1 {
            margin-bottom: 20px;
        }

        .hero-section p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .search-form input {
            max-width: 600px;
        }

        /* Property Types */
        .property-types i {
            color: white;
        }

        .property-types p {
            color: white;
            margin-top: 10px;
        }

        /* Product Card */
        .product {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 20px;
            height: 100%;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .product img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product .badge {
            position: absolute;
            top: 10px;
            left: 10px;
            padding: 5px 10px;
            font-size: 0.9rem;
        }

        .product .badge.hot {
            top: 10px;
            right: 10px;
            left: auto;
            background-color: red;
            color: white;
        }

        .product .card-body {
            padding: 15px;
            flex-grow: 1;
        }

        .product .card-footer {
            background-color: #f8f9fa;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .product .card-footer .price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
        }

        .product .card-footer .btn {
            border: 1px dashed #007bff;
            color: #007bff;
            background-color: white;
        }
    </style>
</head>

<body>
    @if (Route::has('login'))
        <div class="sm:fixed sm:top-0 sm:right-0 p-6 text-right z-10">
            @auth
                <a href="{{ url('/dashboard') }}"
                    class="font-semibold text-gray-600 hover:text-gray-900 focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500">Dashboard</a>
            @else
                <a href="{{ route('login') }}"
                    class="font-semibold text-gray-600 hover:text-gray-900 focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500">Log
                    in</a>

                @if (Route::has('register'))
                    <a href="{{ route('register') }}"
                        class="ml-4 font-semibold text-gray-600 hover:text-gray-900 focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500">Register</a>
                @endif
            @endauth
        </div>
    @endif

    <!-- Navbar -->
    @include('client.navbar')


    <!-- Hero Section -->
    <header class="hero-section">
        <div class="container">
            <h1>CÁCH TIẾP CẬN BẤT ĐỘNG SẢN NHANH NHẤT</h1>
            <p>Tìm kiếm nhanh chóng với các công cụ tìm kiếm thông minh.</p>
            <form class="search-form d-flex justify-content-center flex-wrap" action="" method="GET">
                <select name="type" class="form-select me-2 mb-2" style="max-width: 200px;"
                    onchange="this.form.submit()">
                    <option value="">Loại nhà đất</option>
                    <?php foreach ($property_types as $type): ?>
                    <option value="<?php echo $type['slug']; ?>" <?php if (isset($_GET['type']) && $_GET['type'] == $type['slug']) {
                        echo 'selected';
                    } ?>>
                        <?php echo $type['name']; ?>
                    </option>
                    <?php endforeach; ?>
                </select>
                <input type="text" name="search" class="form-control me-2 mb-2"
                    placeholder="Nhập địa điểm hoặc từ khóa ...">
                <button type="submit" class="btn btn-primary me-2 mb-2">
                    <i class="fas fa-search"></i> Tìm kiếm
                </button>
            </form>

            <!-- Hiển thị Icon của các loại bất động sản -->
            <div class="property-types mt-5">
                <div class="row justify-content-center">
                    <?php foreach ($property_types as $type): ?>
                    <div class="col-6 col-md-2 text-center mb-3">
                        <a href="?type=<?php echo $type['slug']; ?>" class="text-decoration-none">
                            <i class="<?php echo $type['icon']; ?> fa-2x"></i>
                            <p><?php echo $type['name']; ?></p>
                        </a>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </header>

    <!-- Nội dung chính -->
    <main>
        <div class="container mt-5">
            <h2 class="text-center">SẢN PHẨM NỔI BẬT</h2>
            <div class="row">
                <?php foreach ($products as $product): ?>
                <div class="col-12 col-md-4">
                    <div class="product">
                        <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['title']; ?>">
                        <?php if ($product['badge'] === 'Cho bán'): ?>
                        <span class="badge bg-success"><?php echo $product['badge']; ?></span>
                        <?php elseif ($product['badge'] === 'Cho thuê'): ?>
                        <span class="badge bg-warning"><?php echo $product['badge']; ?></span>
                        <?php endif; ?>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $product['title']; ?></h5>
                            <p class="card-text">
                                <i class="fas fa-map-marker-alt"></i> <?php echo $product['address']; ?><br>
                                <i class="fas fa-bed"></i> <?php echo $product['bedrooms']; ?> Phòng ngủ<br>
                                <i class="fas fa-bath"></i> <?php echo $product['bathrooms']; ?> Phòng tắm<br>
                                <i class="fas fa-arrows-alt-h"></i> Diện tích: <?php echo $product['area']; ?>
                            </p>
                        </div>
                        <div class="card-footer">
                            <span class="price"><?php echo $product['price']; ?></span>
                            <button class="btn btn-outline-primary btn-sm">Chi tiết</button>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </main>

    <!-- Footer -->
    @include('client.footer')

    <!-- Bootstrap JS & Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
