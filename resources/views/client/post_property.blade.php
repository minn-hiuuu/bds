<?php
// post_property.php

// Nếu form được submit (phương thức POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Lấy dữ liệu từ form (có thể cần xử lý và validate thêm)
    $name = $_POST['name'] ?? '';
    $description = $_POST['description'] ?? '';
    $price = $_POST['price'] ?? '';
    $location = $_POST['location'] ?? '';
    $area = $_POST['area'] ?? '';
    $property_type_id = $_POST['property_type_id'] ?? '';
    $user_id = $_POST['user_id'] ?? ''; // Thông thường lấy từ session
    $num_floors = $_POST['num_floors'] ?? ''; // Số tầng (nếu có)
    $num_bedrooms = $_POST['num_bedrooms'] ?? ''; // Số phòng ngủ (nếu có)
    $land_type = $_POST['land_type'] ?? ''; // Loại đất (nếu có)
    $created_at = date('Y-m-d H:i:s');
    $updated_at = $created_at;

    // Xử lý upload hình ảnh (cho phép nhiều hình ảnh)
    $uploadedFiles = [];
    if (isset($_FILES['images'])) {
        $totalFiles = count($_FILES['images']['name']);
        for ($i = 0; $i < $totalFiles; $i++) {
            if ($_FILES['images']['error'][$i] === UPLOAD_ERR_OK) {
                $tmpName = $_FILES['images']['tmp_name'][$i];
                $fileName = basename($_FILES['images']['name'][$i]);
                // Kiểm tra định dạng file (ví dụ: jpg, png, gif)
                $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
                $allowed = ['jpg', 'jpeg', 'png', 'gif'];
                if (in_array($fileExt, $allowed)) {
                    $uploadDir = 'uploads/';
                    // Đảm bảo thư mục uploads tồn tại
                    if (!is_dir($uploadDir)) {
                        mkdir($uploadDir, 0755, true);
                    }
                    // Tạo tên file duy nhất để tránh trùng lặp
                    $newFileName = uniqid() . '_' . $fileName;
                    $destination = $uploadDir . $newFileName;
                    if (move_uploaded_file($tmpName, $destination)) {
                        $uploadedFiles[] = $destination;
                    }
                }
            }
        }
    }

    $message = "Bất động sản <strong>$name</strong> đã được đăng thành công!";
}
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đăng Bất Động Sản</title>
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

        /* Đẩy footer xuống dưới cùng */
        footer {
            margin-top: auto;
        }

        h1 {
            margin-bottom: 1.5rem;
        }

        .form-label {
            color: #495057;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        /* Style cho preview thumbnail */
        #preview div {
            display: inline-block;
            position: relative;
            margin: 5px;
        }

        #preview img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        #preview button {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            font-size: 12px;
            width: 20px;
            height: 20px;
            line-height: 18px;
            text-align: center;
            padding: 0;
        }

        /* Responsive cho preview: giảm kích thước hình nếu màn hình nhỏ */
        @media (max-width: 576px) {
            #preview img {
                width: 40px;
                height: 40px;
            }
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
    @include('client.navbar')

    <main>
        <!-- Hero Section -->
        <header class="hero">
            <div class="hero-overlay"></div>
            <div class="hero-content container">
                <h1 class="display-4">Đăng Bất Động Sản</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Trang chủ</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">Đăng Bất Động Sản</li>
                    </ol>
                </nav>
            </div>
        </header>

        <div class="container my-4">
            <!-- Hiển thị thông báo thành công -->
            @if (session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            <!-- Form đăng bất động sản -->
            <form action="{{ route('property.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="mb-3">
                    <label for="title" class="form-label">Tên Bất Động Sản</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Mô Tả</label>
                    <textarea class="form-control" id="description" name="description" rows="5"></textarea>
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Giá</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>

                <div class="mb-3">
                    <label for="location" class="form-label">Vị Trí</label>
                    <input type="text" class="form-control" id="location" name="location" required>
                </div>

                <div class="mb-3">
                    <label for="property_type_id" class="form-label">Loại Bất Động Sản</label>
                    <select class="form-select" id="property_type_id" name="property_type_id" required>
                        @foreach (\App\Models\PropertyType::all() as $type)
                            <option value="{{ $type->id }}">{{ $type->name }}</option>
                        @endforeach
                    </select>
                </div>

                <!-- Nhập tiện ích -->
                <div class="mb-3">
                    <label class="form-label">Tiện ích</label>
                    <div id="feature-container">
                        <input type="text" class="form-control mb-2" name="features[]"
                            placeholder="Nhập tiện ích (VD: Hồ bơi)">
                    </div>
                    <button type="button" class="btn btn-secondary" id="add-feature">Thêm tiện ích</button>
                </div>

                <!-- Chọn hình ảnh -->
                <div class="mb-3">
                    <label class="form-label">Hình Ảnh</label>
                    <button type="button" class="btn btn-secondary" id="addImageBtn">Chọn hình ảnh</button>
                    <input type="file" id="imageInput" accept="image/*" style="display: none;">
                    <input type="file" id="images" name="images[]" style="display: none;" multiple>
                    <div id="preview" class="d-flex flex-wrap mt-3"></div>
                </div>

                <button type="submit" class="btn btn-primary w-100">Đăng Bất Động Sản</button>
            </form>
        </div>
    </main>

    @include('client.footer')

    <!-- JavaScript để thêm tiện ích và xử lý upload hình ảnh -->
    <script>
        document.getElementById('add-feature').addEventListener('click', function() {
            let container = document.getElementById('feature-container');
            let input = document.createElement('input');
            input.type = 'text';
            input.className = 'form-control mb-2';
            input.name = 'features[]';
            input.placeholder = 'Nhập tiện ích';
            container.appendChild(input);
        });

        // Xử lý ảnh preview trước khi upload
        let dt = new DataTransfer();
        const addImageBtn = document.getElementById('addImageBtn');
        const imageInput = document.getElementById('imageInput');
        const hiddenImagesInput = document.getElementById('images');
        const previewContainer = document.getElementById('preview');

        addImageBtn.addEventListener('click', function() {
            imageInput.click();
        });

        imageInput.addEventListener('change', function() {
            if (this.files.length > 0) {
                const file = this.files[0];
                dt.items.add(file);
                updatePreview();
                hiddenImagesInput.files = dt.files;
                this.value = '';
            }
        });

        function updatePreview() {
            previewContainer.innerHTML = "";
            Array.from(dt.files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const div = document.createElement('div');
                    div.className = "position-relative m-2";

                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = "rounded border p-1";
                    img.style.width = "100px";
                    img.style.height = "100px";
                    img.style.objectFit = "cover";

                    const removeBtn = document.createElement('button');
                    removeBtn.innerHTML = '&times;';
                    removeBtn.className =
                        "position-absolute top-0 end-0 bg-danger text-white rounded-circle border-0";
                    removeBtn.style.width = "20px";
                    removeBtn.style.height = "20px";
                    removeBtn.style.fontSize = "14px";

                    removeBtn.addEventListener('click', function() {
                        const newDt = new DataTransfer();
                        for (let i = 0; i < dt.files.length; i++) {
                            if (dt.files[i].name !== file.name) {
                                newDt.items.add(dt.files[i]);
                            }
                        }
                        dt = newDt;
                        hiddenImagesInput.files = dt.files;
                        updatePreview();
                    });

                    div.appendChild(img);
                    div.appendChild(removeBtn);
                    previewContainer.appendChild(div);
                };
                reader.readAsDataURL(file);
            });
        }
    </script>


    <!-- Bootstrap JS Bundle (bao gồm Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
