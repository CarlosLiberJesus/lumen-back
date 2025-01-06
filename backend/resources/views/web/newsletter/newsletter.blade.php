@extends('web.template')

@section('content')
    <section id="contact" class="contact section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="zoom-in" data-aos-delay="100">
            <h2>Newsletter</h2>
            <p>Todas as grandes viagens começam com um passo. Este é o nosso...</p>
        </div><!-- End Section Title -->

        <div class="container ">

            <div class="row gy-4">

                <div class="col-lg-12">
                    <form action="{{ url('/newsletter') }}" method="POST" class="php-email-form" data-aos="fade-left"
                        data-aos-delay="200">
                        @csrf
                        <div class="row gy-4">
                            <div class="col-md-12">
                                <label for="name">Nome:</label>
                                <input type="text" class="form-control @error('name') is-invalid @enderror"
                                    name="name" id="name" placeholder="Nome" required="" autocomplete="name"
                                    value="{{ old('name') }}">
                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-6 ">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control @error('email') is-invalid @enderror"
                                    name="email" id="email" placeholder="email" required="" autocomplete="email"
                                    value="{{ old('email') }}">
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <label for="phone">Telefone (opcional):</label>
                                <input type="text" id="phone" name="phone"
                                    class="form-control @error('phone') is-invalid @enderror" placeholder="xxx xxx xxx"
                                    autocomplete="phone" value="{{ old('phone') }}">
                                @error('phone')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-12 text-center">
                                <button type="submit">Enviar Subscrição</button>
                            </div>

                        </div>
                    </form>
                </div><!-- End Contact Form -->

            </div>

        </div>

    </section>
@endsection
