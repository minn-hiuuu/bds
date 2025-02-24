<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bds.com</title>
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
        <div class="p-1 bg-light text-end z-10">
            @auth
                @if (auth()->user()->role_id == 1)
                    <!-- Admin Dashboard -->
                    <a href="{{ url('/admin') }}" class="btn btn-primary text-decoration-none text-white">Admin
                        Dashboard</a>
                @else
                    <!-- User Profile -->
                    <a href="{{ url('/user/profile') }}" class="btn btn-primary text-decoration-none text-white">Profile</a>
                @endif

                <!-- Nút Logout -->
                <form method="POST" action="{{ route('logout') }}" class="d-inline">
                    @csrf
                    <button type="submit" class="btn btn-danger text-decoration-none text-white">Logout</button>
                </form>
            @else
                <a href="{{ route('login') }}" class="btn btn-primary text-decoration-none text-white">Log in</a>
                @if (Route::has('register'))
                    <a href="{{ route('register') }}" class="btn btn-success text-decoration-none text-white">Register</a>
                @endif
            @endauth
        </div>
    @endif

    <!-- Navbar -->
    @include('client.navbar')

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1>Chào mừng đến với BDS.com</h1>
            <p>Tìm kiếm và khám phá các bất động sản tốt nhất cho bạn.</p>
            <form class="d-flex justify-content-center search-form">
                <input class="form-control form-control-lg" type="search" placeholder="Tìm kiếm bất động sản"
                    aria-label="Search">
            </form>
        </div>
    </section>

    <div class="container">
        <!-- Property Types Section -->
        <section class="row row-cols-1 row-cols-md-3 g-4 text-center mt-5">
            @foreach ($propertyTypes as $type)
                <div class="col">
                    <div class="card p-3">
                        <i class="{{ $type->icon }} fs-1 text-primary"></i> <!-- Hiển thị icon từ database -->
                        <p>{{ $type->name }}</p>
                    </div>
                </div>
            @endforeach
        </section>

        <!-- Product Section -->
        <section class="container my-5">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                @foreach ($properties as $property)
                    <div class="col">
                        <div class="product card">
                            <!-- Lấy ảnh đầu tiên của bất động sản hoặc dùng ảnh mặc định -->
                            @php
                                $imagePath = $property->images->isNotEmpty()
                                    ? asset($property->images->first()->image_path)
                                    : 'https://via.placeholder.com/300';
                            @endphp
                            <img src="{{ $imagePath }}" alt="{{ $property->title }}" class="img-fluid">

                            <div class="badge hot">{{ ucfirst($property->status) }}</div>
                            <div class="card-body">
                                <h5 class="card-title">{{ $property->title }}</h5>
                                <p class="card-text">{{ $property->description }}</p>
                                <p class="text-muted"><i class="bi bi-geo-alt-fill"></i> {{ $property->location }}</p>
                            </div>
                            <div class="card-footer">
                                <span class="price">${{ number_format($property->price, 2) }}</span>
                                <a href="{{ url('/product-detail', ['id' => $property->id]) }}"
                                    class="btn btn-primary">Chi tiết</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </section>


    </div>


    <!-- Footer -->
    @include('client.footer')

    <!-- Bootstrap JS & Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
