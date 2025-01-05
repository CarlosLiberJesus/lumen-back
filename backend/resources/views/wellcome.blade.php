@extends('web.template')

@section('content')
    <section id="hero" class="hero section">

        <img src="{{ asset('img/hero-bg-abstract.jpg') }}" alt="" data-aos="fade-in" class="">

        <div class="container">
            <div class="row justify-content-center" data-aos="zoom-out">
                <div class="col-xl-7 col-lg-9 text-center">
                    <h1>BewhyOrg API Layer</h1>
                    <p>O <b>código</b> liberta... <i>Programa-mos</i> uma cidadania reforçada</p>
                </div>
            </div>
            <div class="text-center" data-aos="zoom-out" data-aos-delay="700">
                <a href="https://bewhy.org/" class="btn-get-started">Iniciar</a>
            </div>
            <div class="row gy-4 mt-5">
                <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="300">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-person-arms-up"></i></div>
                        <h4 class="title"><a href="">CRM</a></h4>
                        <p class="description">União de activitas políticos portugueses, de vários espetros partidários,
                            constribuindo uma base de conhecimento colectiva.</p>
                    </div>
                </div><!--End Icon Box -->

                <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="400">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-file-earmark-medical"></i></div>
                        <h4 class="title"><a href="">Documentação</a></h4>
                        <p class="description">Construção de documentação legislativa, de forma a entregar documentos
                            estruturados, nas instituições correctas.</p>
                    </div>
                </div><!--End Icon Box -->

                <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="500">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-file-spreadsheet"></i></div>
                        <h4 class="title"><a href="">Orçamentação</a></h4>
                        <p class="description">Centralizar e escrutinar orçamentamentos públicos, utilizando ferramentas
                            profissionais para análise e apresentação de dados.</p>
                    </div>
                </div><!--End Icon Box -->

                <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="600">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-command"></i></div>
                        <h4 class="title"><a href="">Petições Públicas</a></h4>
                        <p class="description">Desenvolver confiança, e apresentar nova alternativa às instuitioções
                            existentes, criando mais transparência na informação pública</p>
                    </div>
                </div><!--End Icon Box -->

            </div>
        </div>

    </section>
@endsection
