<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Huỳnh Tuấn - Trang Bất Động Sản</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
        }

        main {
            flex: 1;
        }

        footer {
            margin-top: auto;
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

        .search-form input,
        .search-form select {
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
            margin-bottom: 30px; /* Thêm khoảng cách giữa các sản phẩm */
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

        /* Phân cách giữa các sản phẩm */
        .row > .col-md-4 {
            margin-bottom: 30px; 
        }
    </style>
</head>

<body>

    @include('client.navbar')

    <!-- Hero Section với form tìm kiếm và danh mục bất động sản -->
    <header class="hero-section">
        <div class="container">
            <h1>CÁCH TIẾP CẬN BẤT ĐỘNG SẢN NHANH NHẤT</h1>
            <p>Tìm kiếm nhanh chóng với các công cụ tìm kiếm thông minh.</p>
            <form class="search-form d-flex justify-content-center flex-wrap" action="" method="GET">
                <!-- Dropdown chọn danh mục, tự động submit khi chọn -->
                <select name="type" class="form-select me-2 mb-2" style="max-width: 200px;" onchange="this.form.submit()">
                    <option value="">Loại nhà đất</option>
                    @foreach ($propertyTypes as $type)
                        <option value="{{ $type->slug }}" @if(request('type')==$type->slug) selected @endif>
                            {{ $type->name }}
                        </option>
                    @endforeach
                </select>
                <input type="text" name="search" class="form-control me-2 mb-2" placeholder="Nhập địa điểm hoặc từ khóa ...">
                <button type="submit" class="btn btn-primary me-2 mb-2">
                    <i class="fas fa-search"></i> Tìm kiếm
                </button>
            </form>
            <!-- Hiển thị Icon các loại bất động sản -->
            <div class="property-types mt-5">
                <div class="row justify-content-center">
                    @foreach ($propertyTypes as $type)
                        <div class="col-6 col-md-2 text-center mb-3">
                            <a href="?type={{ $type->slug }}" class="text-decoration-none">
                                <i class="{{ $type->icon }} fa-2x"></i>
                                <p>{{ $type->name }}</p>
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </header>

    <!-- Nội dung chính: Danh sách bất động sản -->
    <main class="container my-5">
        @php
            // Lấy giá trị lọc theo loại nhà đất và từ khóa tìm kiếm từ URL (GET)
            $selectedType = request('type') ?? '';
            $searchKeyword = request('search') ?? '';

            // Lọc theo loại bất động sản
            if ($selectedType) {
                $displayTitle = ucwords(str_replace('-', ' ', $selectedType));
            }
        @endphp

        @if($selectedType)
            <h2>Danh mục: <em>{{ $displayTitle }}</em></h2>
        @elseif($searchKeyword)
            <h2>Kết quả tìm kiếm: <em>{{ $searchKeyword }}</em></h2>
        @else
            <h2>Tất cả sản phẩm</h2>
        @endif

        <div class="row">
            @if($properties->isNotEmpty())
                @foreach ($properties as $property)
                    <div class="col-lg-3 col-md-6 col-sm-12 g-4">
                        <div class="product card property-card">
                            @php
                                // Lấy ảnh đầu tiên của bất động sản hoặc dùng ảnh mặc định
                                $imagePath = $property->images->isNotEmpty() ? asset($property->images->first()->image_path) : 'https://via.placeholder.com/300';
                            @endphp
                            <img src="{{ $imagePath }}" alt="Image of {{ $property->title }}" class="img-fluid">
                            <div class="badge bg-primary">
                                {{ $property->badge ?? ucfirst($property->status) }}
                            </div>
                            @if(isset($property->badge) && ($property->badge == 'Cho bán' || $property->badge == 'Cho thuê'))
                                <div class="badge hot">HOT</div>
                            @endif
                            <div class="card-body">
                                <h5 class="card-title">{{ ucwords($property->title) }}</h5>  <!-- In hoa chữ cái đầu dòng -->
                                <p class="card-text">
                                    <i class="fas fa-map-marker-alt"></i>
                                    {{ ucwords($property->location) }}  <!-- In hoa chữ cái đầu dòng cho địa chỉ -->
                                </p>
                            </div>
                            <div class="card-footer">
                                <span class="price">{{ number_format($property->price, 0, ',', '.') }}</span>
                                <a href="{{ url('/product-detail', ['id' => $property->id]) }}" class="btn btn-primary">Chi tiết</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="col-12">
                    <p>Không có sản phẩm nào phù hợp với tìm kiếm của bạn.</p>
                </div>
            @endif
        </div>

        <!-- Phân trang -->
        <div class="row">
            <div class="col-12">
                {{ $properties->links() }} <!-- Hiển thị phân trang -->
            </div>
        </div>
    </main>

    @include('client.footer')

    <!-- Bootstrap Bundle JS (bao gồm Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
