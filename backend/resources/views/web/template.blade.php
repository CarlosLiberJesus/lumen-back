<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BewhyOrg Support</title>
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('img/logos/apple-touch-icon.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('img/logos/favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('img/logos/favicon-16x16.png') }}">
    <link rel="manifest" href="{{ asset('img/logos/site.webmanifest') }}">

    <meta property="og:title" content="BewhyOrg Api">
    <meta property="og:description" content="O código liberta... Programa-mos uma cidadania reforçada.">
    <meta property="og:image" content="{{ asset('img/logos/bewhy-logo.png') }}">
    <meta property="og:url" content="https://api.bewhy.org">
    <meta property="og:type" content="website">

    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="BewhyOrg Api">
    <meta name="twitter:description" content="O código liberta... Programa-mos uma cidadania reforçada.">
    <meta name="twitter:image" content="{{ asset('img/logos/bewhy-logo.png') }}">
    <meta name="twitter:site" content="@BewhyOrg">
    <meta name="twitter:image:alt" content="BewhyOrg Api">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Inspiration&family=Zilla+Slab+Highlight:wght@700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <link href="{{ asset('vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/aos/aos.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/glightbox/css/glightbox.min.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/swiper/swiper-bundle.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

</head>

<body class="index-page">

    <header id="header" class="header d-flex align-items-center sticky-top">
        <div class="container-fluid container-xl position-relative d-flex align-items-center">

            <a href="{{ url(config('app.url')) }}" class="logo d-flex align-items-center me-auto">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="assets/img/logo.png" alt=""> -->
                <span class="zilla-slab-highlight-bold logo1-1">Be</span>
                <span class="inspiration-regular logo1-2">Why</span>
            </a>

            <nav id="navmenu" class="navmenu">
                <ul>
                    <li><a href="{{ url(config('app.url')) }}" class="active">Ínicio</a></li>
                </ul>
                <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav>

        </div>
    </header>

    <main class="main">
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show alert-position" role="alert">
                <h6 class="alert-heading mb-0 me-5">{{ session('success') }}</h6>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            {{ session()->forget('success') }}
        @endif

        @if (session('error'))
            <div class="alert alert-danger alert-dismissible fade show alert-position" role="alert">
                <p>{{ session('error') }}</p>
                <hr>
                <p class="mb-0">{{ session('exception') }}</p>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            {{ session()->forget('error') }}
            {{ session()->forget('expection') }}
        @endif

        @yield('content')
    </main>

    <footer id="footer" class="footer light-background">

        <div class="container footer-top">
            <div class="row gy-4">
                <div class="col-lg-5 col-md-12 footer-about">
                    <a href="#" class="logo d-flex align-items-center">
                        <!-- Uncomment the line below if you also wish to use an image logo -->
                        <!-- <img src="assets/img/logo.png" alt=""> -->
                        <span class="inspiration-regular logo2-1">Be</span>
                        <span class="zilla-slab-highlight-bold logo2-2">Why</span>
                    </a>
                    <p>Este projecto almeja criar uma nova <i>visão</i> na acção da cidadania. Um projecto que nasceu de
                        uma necessidade, que tem mutado com a participação dos seus membros, e seus resultados ainda se
                        evidenciam.</p>
                    <div class="social-links d-flex mt-4">
                        <a href="https://x.com/BewhyOrg/" target="_blank"><i class="bi bi-twitter-x"></i></a>
                        <a href="https://www.facebook.com/cejesus" target="_blank"><i class="bi bi-facebook"></i></a>
                        <a href="https://github.com/CarlosLiberJesus/lumen-back" target="_blank"><i
                                class="bi bi-github"></i></a>
                        <a href="mailto:deployuser@bewhy.org"><i class="bi bi-envelope"></i></a>
                    </div>
                </div>

                <div class="col-lg-7 col-12 footer-links contact">
                    <h4>Contacte-nos</h4>
                    <form action="{{ url('/email/home') }}" method="POST" class="php-email-form"
                        data-aos="flip-up" data-aos-delay="200">
                        @csrf
                        <div class="row gy-4">

                            <div class="col-md-6">
                                <input type="text" name="name" class="form-control" placeholder="Nome"
                                    autocomplete="name" required="">
                            </div>

                            <div class="col-md-6 ">
                                <input type="email" class="form-control" name="email" placeholder="email"
                                    autocomplete="email" required="">
                            </div>

                            <div class="col-md-12">
                                <input type="text" class="form-control" name="subject" placeholder="Assunto"
                                    required="">
                            </div>

                            <div class="col-md-12">
                                <textarea class="form-control" name="message" rows="6" placeholder="Messagem" required=""></textarea>
                            </div>

                            <div class="col-md-12 text-center">
                                <button type="submit">Enviar Mensagem</button>
                            </div>

                        </div>
                    </form>
                </div>

            </div>
        </div>

        <div class="container copyright text-center mt-4">
            <p>© <span>Copyright</span> <strong class="px-1 sitename">BewhyOrg</strong> <span>Todos os direitos
                    reservados</span>
            </p>
            <div class="credits">
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> Distributed by <a
                    href=“https://themewagon.com>ThemeWagon
            </div>
        </div>

    </footer>

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('vendor/aos/aos.js') }}"></script>
    <script src="{{ asset('vendor/purecounter/purecounter_vanilla.js') }}"></script>
    <script src="{{ asset('vendor/glightbox/js/glightbox.min.js') }}"></script>
    <script src="{{ asset('vendor/swiper/swiper-bundle.min.js') }}"></script>
    <script src="{{ asset('vendor/imagesloaded/imagesloaded.pkgd.min.js') }}"></script>
    <script src="{{ asset('vendor/isotope-layout/isotope.pkgd.min.js') }}"></script>

    <!-- Main JS File -->
    <script src="{{ asset('js/main.js') }}"></script>
</body>

</html>
