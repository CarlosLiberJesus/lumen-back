@extends('layout.template')

@section('content')
    <section>
        <div class="container">
            <div class="row justify-content-center" data-aos="zoom-out">
                <div class="col-xl-7 col-lg-9 text-center main-title">
                    <h2>404! NOT FOUND</h2>
                    <p>A página não foi encontrada... Reveja o pedido!</p>
                </div>
            </div>
            <div class="text-center" data-aos="zoom-out" data-aos-delay="700">
                @php
                    $appEnv = env('APP_URL');
                @endphp
                <a href="{{ $appEnv }}" class="btn-get-started">Iniciar</a>
            </div>
        </div>
    </section>
@endsection
