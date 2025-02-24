<style>
    /* Navbar */
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

    .btn-contact {
        background-color: #007bff;
        color: white;
        font-weight: 500;
    }
</style>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">
            <img src="https://res.cloudinary.com/div27nz1j/image/upload/v1740239125/logo_ndkkyj.png" alt="Logo Bất Động Sản">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="{{ url('/') }}">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ url('/introduce') }}">Giới thiệu</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ url('/post-property') }}">Đăng tin bất động sản</a></li>
            </ul>
            <a class="btn btn-contact d-md-none mt-3" href="#">
                <i class="fas fa-phone-alt"></i> Liên hệ tư vấn
            </a>
        </div>
        <a class="btn btn-contact d-none d-md-block" href="#">
            <i class="fas fa-phone-alt"></i> Liên hệ tư vấn
        </a>
    </div>
</nav>
