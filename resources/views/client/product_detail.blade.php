<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Chi tiết bất động sản</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        html, body {
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

        footer {
            margin-top: auto;
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

        .btn-contact {
            background-color: #007bff;
            color: white;
            font-weight: 500;
        }

        .thumbnail {
            cursor: pointer;
            transition: transform 0.2s;
        }

        .thumbnail:hover {
            transform: scale(1.1);
        }

        .main-image-container {
            height: 400px;
            overflow: hidden;
        }

        .main-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main-image-container {
                height: 300px;
            }
            .hero {
                height: 250px;
            }
        }

        @media (max-width: 576px) {
            .main-image-container {
                height: 250px;
            }
            .hero {
                height: 200px;
            }
            .hero-content h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>

<body class="bg-light">

    @include('client.navbar')

    <main>
        <!-- Hero Section -->
        <header class="hero">
            <div class="hero-overlay"></div>
            <div class="hero-content container">
                <h1 class="display-4">Chi tiết bất động sản</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Trang chủ</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">Chi tiết bất động sản</li>
                    </ol>
                </nav>
            </div>
        </header>

        <div class="container my-4">
            @if ($property)
                <div class="card shadow">
                    <div class="row g-0">
                        <!-- Hình ảnh chính và thumbnails -->
                        <div class="col-lg-8 col-12 p-4">
                            <div class="main-image-container">
                                <img id="main-image" class="main-image rounded"
                                    src="{{ asset(optional($property->images->first())->image_path ?? 'storage/default.jpg') }}"
                                    alt="Hình ảnh chính">
                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                @foreach ($property->images as $image)
                                    <img class="thumbnail mx-1 rounded border" 
                                        src="{{ asset($image->image_path) }}" 
                                        alt="Thumbnail" width="80" height="80">
                                @endforeach
                            </div>
                        </div>

                        <!-- Thông tin cơ bản -->
                        <div class="col-lg-4 col-12 p-4">
                            <h2 class="fw-bold">{{ $property->title }}</h2>
                            <p class="text-muted"><i class="fas fa-map-marker-alt"></i> {{ $property->location }}</p>
                            <p><strong>Loại:</strong> {{ optional($property->propertyType)->name ?? 'Không xác định' }}</p>
                            <p><strong>Trạng thái:</strong> {{ ucfirst($property->status) }}</p>
                            <p class="h3 text-danger fw-bold">{{ number_format($property->price, 0, ',', '.') }} VND</p>
                            <button class="btn btn-contact w-100 mt-3">
                                <i class="fas fa-phone-alt"></i> 0123 456 789
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card hiển thị tiện ích -->
                <div class="card mt-4 p-4">
                    <h4 class="text-primary">Tiện ích</h4>
                    <ul class="list-group">
                        @forelse($property->features as $feature)
                            <li class="list-group-item">{{ $feature->feature }}</li>
                        @empty
                            <li class="list-group-item text-muted">Không có tiện ích nào.</li>
                        @endforelse
                    </ul>
                </div>

                <!-- Card hiển thị thông tin mở rộng -->
                <div class="card mt-4 p-4">
                    <h4 class="text-secondary">Thông tin chi tiết</h4>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>ID:</strong> {{ $property->id }}</p>
                            <p><strong>Mô tả:</strong> {{ $property->description }}</p>
                            <p><strong>Loại BĐS:</strong> {{ optional($property->propertyType)->name ?? 'Không xác định' }}</p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Người đăng:</strong> {{ optional($property->author)->name ?? 'Không xác định' }}</p>
                            <p><strong>Ngày tạo:</strong> {{ $property->created_at->format('d/m/Y') }}</p>
                            <p><strong>Ngày cập nhật:</strong> {{ $property->updated_at->format('d/m/Y') }}</p>
                        </div>
                    </div>
                </div>
            @else
                <div class="alert alert-danger text-center">Bất động sản không tồn tại!</div>
            @endif
        </div>
    </main>

    @include('client.footer')

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const mainImage = document.getElementById('main-image');
            const thumbnails = document.querySelectorAll('.thumbnail');

            thumbnails.forEach(thumbnail => {
                thumbnail.addEventListener('click', function() {
                    mainImage.src = this.src;
                });
            });
        });
    </script>
</body>

</html>
