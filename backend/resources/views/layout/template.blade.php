<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BewhyOrg Support</title>
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('img/logos/ico/apple-touch-icon.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('img/logos/ico/favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('img/logos/ico/favicon-16x16.png') }}">
    <link rel="manifest" href="{{ asset('img/logos/ico/site.webmanifest') }}">

    <meta property="og:title" content="BewhyOrg Api">
    <meta property="og:description" content="O código liberta... Programa-mos uma cidadania reforçada.">
    <meta property="og:image" content="{{ asset('img/logos/ico-dark-white.png') }}">
    <meta property="og:url" content="https://api.bewhy.org">
    <meta property="og:type" content="website">

    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="BewhyOrg Api">
    <meta name="twitter:description" content="O código liberta... Programa-mos uma cidadania reforçada.">
    <meta name="twitter:image" content="{{ asset('img/logos/ico-dark-white.png') }}">
    <meta name="twitter:site" content="@BewhyOrg">
    <meta name="twitter:image:alt" content="BewhyOrg Api">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Inspiration&family=Zilla+Slab+Highlight:wght@700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <link href="{{ asset('bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('css/bewhy.css') }}" rel="stylesheet">

</head>

<body>
    <header class="navbar navbar-expand-lg bd-navbar sticky-top px-3">
        <nav class="container-xxl bd-gutter flex-wrap flex-lg-nowrap py-2 rounded rounded-3" aria-label="main-nav">
            <div class="d-lg-none" style="width: 4.25rem;"></div>

            <a class="navbar-brand p-0 me-0 me-lg-4" href="/" aria-label="logo" id="logos">
                <img src="{{ asset('img/logos/logo-white.png') }}" alt="logo" class="d-lg-block d-none">
                <img src="{{ asset('img/logos/ico-white.png') }}" alt="logo" class="d-lg-none">
            </a>
            <div class="d-flex">
                <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-label="Toggle navigation">
                    <i class="bi bi-menu-up"></i>
                </button>
            </div>

            <div class="offcanvas-lg offcanvas-end flex-grow-1" tabindex="-1" id="bdNavbar"
                aria-labelledby="bdNavbarOffcanvasLabel" data-bs-scroll="true">
                <div class="offcanvas-header px-4 pb-0">
                    <h5 class="offcanvas-title text-gray-700" id="bdNavbarOffcanvasLabel">Api BeWhyOrg</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"
                        aria-label="Close" data-bs-target="#bdNavbar"></button>
                </div>

                <div class="offcanvas-body p-4 pt-0 p-lg-0">
                    <hr class="d-lg-none text-gray-700">
                    <ul class="navbar-nav flex-row flex-wrap bd-navbar-nav">
                        <li class="nav-item col-6 col-lg-auto">
                            <a class="nav-link py-2 px-0 px-lg-2" href="#"
                                onclick="ga('send', 'event', 'Navbar', 'Community links', 'Docs');">Docs</a>
                        </li>

                    </ul>

                    <hr class="d-lg-none text-gray-700">

                    <ul class="navbar-nav flex-row flex-wrap ms-md-auto">
                        <li class="nav-item col-6 col-lg-auto">
                            <a class="nav-link py-2 px-0 px-lg-2" href="https://github.com/CarlosLiberJesus/lumen-back"
                                target="_blank"><i class="bi bi-github"></i>
                                <small class="d-lg-none ms-2">GitHub</small>
                            </a>

                        </li>
                        <li class="nav-item col-6 col-lg-auto">
                            <a class="nav-link py-2 px-0 px-lg-2" href="https://x.com/BewhyOrg/" target="_blank"><i
                                    class="bi bi-twitter-x"></i>
                                <small class="d-lg-none ms-2">X</small>
                            </a>

                        </li>
                        <li class="nav-item col-6 col-lg-auto">
                            <a class="nav-link py-2 px-0 px-lg-2" href="mailto:deployuser@bewhy.org"><i
                                    class="bi bi-envelope"></i>
                                <small class="d-lg-none ms-2">Email</small>
                            </a>
                        </li>
                        <li class="nav-item py-2 py-lg-1 col-12 col-lg-auto">
                            <div class="vr d-none d-lg-flex h-100 mx-lg-2 text-gray-700"></div>
                            <hr class="d-lg-none my-2 text-gray-700">
                        </li>
                        <li class="nav-item col-6 col-lg-auto cursor-pointer">
                            <a class="nav-link py-2 px-0 px-lg-2" id="theme-switcher"><i class="bi"></i>
                                <small class="d-lg-none ms-2">Tema</small>
                            </a>
                        </li>
                        @php
                            $appEnv = env('APP_ENV');
                            if ($appEnv === 'local') {
                                echo '<li class="nav-item py-2 py-lg-1 col-12 col-lg-auto">
                            <div class="vr d-none d-lg-flex h-100 mx-lg-2 text-gray-700"></div>
                            <hr class="d-lg-none my-2 text-gray-700">
                        </li>
                        <li class="nav-item col-6 col-lg-auto cursor-pointer">
                            <a class="nav-link py-2 px-0 px-lg-2" href="/login"><i class="bi bi-person-bounding-box"></i>
                                <small class="d-lg-none ms-2">Login</small>
                            </a>
                        </li>';
                            }
                        @endphp
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="page-title d-flex flex-wrap m-3 px-3 flex-column justify-content-center">
        <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 my-0 flex-column justify-content-center">
            @yield('title')
        </h1>
        @if (!empty($breadcrumbs))
            @include('layout.partials.breadcrumbs', ['breadcrumbs' => $breadcrumbs])
        @endif
    </div>


    <main class="px-4">
        <section class="row g-3 g-md-5 mb-5 pb-5 justify-content-center ">
            <div class="col-md-8 mx-auto py-2 rounded rounded-3">
                @yield('content')
            </div>
        </section>
    </main>

    <!-- Vendor JS Files -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="{{ asset('js/main.js') }}"></script>
</body>

</html>
