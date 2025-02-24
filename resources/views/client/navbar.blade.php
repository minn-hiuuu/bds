<style>
/* Navbar chung */
.navbar {
    padding: 1rem 2rem;
}

.navbar-brand img {
    height: 50px;
}

.navbar-nav .nav-link {
    color: #333;
    font-weight: 500;
    margin-right: 1rem;
}

.navbar-nav .nav-link:hover {
    color: #007bff;
}

/* Định dạng chung cho các nút trong navbar */
.btn-contact {
    background-color: #007bff;
    color: white;
    font-weight: 500;
}

/* Nút “Tàikhoản” với kích thước cố định trên desktop */
.btn-account {
    width: 160px;
    text-align: center;
}

/* Khi đã đăng nhập thì nút Tàikhoản chuyển nền đỏ */
.btn-account-logged-in {
    background-color: red !important;
    border-color: red !important;
}

/* Dropdown menu có cùng kích thước với nút Tàikhoản trên desktop */
#accountDropdown+.dropdown-menu {
    width: 150px;
}

/* Mobile adjustments */
@media (max-width: 768px) {

    /* Cho menu chính full width và căn giữa */
    .navbar-nav.mx-auto {
        width: 100%;
        text-align: center;
    }

    .navbar-nav.mx-auto .nav-item {
        display: block;
        margin: 0.5rem 0;
    }

    .navbar-nav.mx-auto .nav-link {
        margin-right: 0;
    }

    /* Cho nút “Tàikhoản” full width trên mobile */
    .btn-account {
        width: 100%;
    }

    /* Dropdown menu full width trên mobile */
    #accountDropdown+.dropdown-menu {
        width: 100%;
    }

    /* Tùy chọn: giảm padding của container */
    .navbar .container {
        padding: 0 1rem;
    }
}
</style>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">
            <img src="https://res.cloudinary.com/div27nz1j/image/upload/v1740239125/logo_ndkkyj.png"
                alt="Logo Bất Động Sản">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Căn giữa danh mục menu -->
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('/') }}">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('/introduce') }}">Giới thiệu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('/post-property') }}">Đăng tin bất động sản</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <!-- Nút Liên hệ cho desktop -->
                <li class="nav-item">
                    <a class="btn btn-contact me-2 d-none d-md-block" href="tel: 10000">
                        <i class="fas fa-phone-alt"></i> Liên hệ
                    </a>
                </li>
                <!-- Dropdown Tài khoản -->
                <li class="nav-item dropdown">
                    <a class="btn btn-contact dropdown-toggle btn-account {{ auth()->check() ? 'btn-account-logged-in' : '' }}"
                        href="#" id="accountDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-sign-in-alt"></i> Tài Khoản
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="accountDropdown">
                        @if (Route::has('login'))
                        @auth
                        @if (auth()->user()->role_id == 1)
                        <li>
                            <a class="dropdown-item" href="{{ url('/admin') }}">Quản lý</a>
                        </li>
                        @else
                        <li>
                            <a class="dropdown-item" href="{{ url('/user/profile') }}">Hồ sơ cá nhân</a>
                        </li>
                        @endif
                        <li>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button type="submit" class="dropdown-item">Đăng xuất</button>
                            </form>
                        </li>
                        @else
                        <li>
                            <a class="dropdown-item" href="{{ route('login') }}">Đăng nhập</a>
                        </li>
                        @if (Route::has('register'))
                        <li>
                            <a class="dropdown-item" href="{{ route('register') }}">Đăng ký</a>
                        </li>
                        @endif
                        @endauth
                        @endif
                    </ul>
                </li>
                <!-- Nút Liên hệ cho mobile -->
                <li class="nav-item">
                    <a class="btn btn-contact d-md-none mt-3" href="tel: 10000">
                        <i class="fas fa-phone-alt"></i> Liên hệ
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>