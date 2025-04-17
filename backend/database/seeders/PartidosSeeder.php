<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Concelho;
use App\Models\ContactoTipo;
use App\Models\Instituicao;
use App\Models\InstituicaoAnexo;
use App\Models\InstituicaoComTipo;
use App\Models\InstituicaoContacto;
use App\Models\InstituicaoDados;
use App\Models\InstituicaoMorada;
use App\Models\InstituicaoTipo;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class PartidosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $partidos = [
            [
                'nome' => 'Partido Comunista Português',
                'sinopse' => '<p><span>O Partido Comunista Português - PCP foi inscrito no Supremo Tribunal de Justiça em 26 de Dezembro de 1974.</span></p><p><span>Integrou coligações com fins eleitorais como a FEPU - Frente Eleitoral Povo Unido (PCP e MDP/CDE), a APU - Aliança Povo Unido (PCP e MDP/CDE) e, atualmente, a CDU - Coligação Democrática Unitária (PCP e PEV).</span></p><p><span>O jornal semanário "Avante!" é órgão oficial do partido, tendo sido editado pela primeira vez em 1931, sendo, ainda, publicada a revista bimensal "O Militante".</span></p>',
                'sigla' => 'PCP',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1974-12-26',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.pcp.pt/',
                    'Facebook' => 'https://www.facebook.com/pcpportugal',
                    'X' => 'https://twitter.com/pcpportugal',
                    'Instagram' => 'https://www.instagram.com/pcpportugal/',
                    'Youtube' => 'https://www.youtube.com/@pcpportugal',
                    'morada_1' => 'Rua Soeiro Pereira Gomes, 3',
                    'morada_2' => '1600-196 Lisboa',
                    'Telefone' => '+351 217 813 800',
                    'Email' => 'pcp@pcp.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido1_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'CDS - Partido Popular',
                'sinopse' => '<p><span>Foi inscrito no Supremo Tribunal de Justiça em 13 de Janeiro de 1975 com a denominação Partido do Centro Democrático Social e a sigla CDS.</span></p><p><span>Integrou coligações com fins eleitorais como, por exemplo, a AD - Aliança Democrática (CDS, PPD/PSD e PPM) entre 1979 e 1981.</span></p><p><span>A denominação foi alterada para Partido do Centro Democrático Social - Partido Popular e a sigla para CDS-PP, conforme Acórdão do Tribunal Constitucional n.º 282/93.</span></p><p><span>Em 1995 procede a nova alteração, apenas da denominação que passa a Partido Popular, conforme Acórdão do Tribunal Constitucional n.º 131/95.</span></p><p><span>Em 2009 são alterados o símbolo e a denominação, que passa a ser CDS -Partido Popular, conforme Acórdão do Tribunal Constitucional n.º 343/2009.</span></p>',
                'sigla' => 'CDS-PP',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1975-01-13',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.cds.pt/',
                    'Facebook' => 'https://www.facebook.com/cdspp',
                    'X' => 'https://twitter.com/cdspp',
                    'Instagram' => 'https://www.instagram.com/cdspp/',
                    'Youtube' => 'https://www.youtube.com/@cdspp',
                    'morada_1' => 'Largo Adelino Amaro da Costa, 5',
                    'morada_2' => '1149-063 Lisboa',
                    'Telefone' => '+351 218 814 700',
                    'Email' => 'cds-pp@cds.pt',
                    'Email' => 'presidencia@cds.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido2_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Social Democrata',
                'sinopse' => '<p><span>Foi inscrito no Supremo Tribunal de Justiça em 25 de Janeiro de 1975 com a denominação Partido Popular Democrático e a sigla PPD. Passou a designar-se Partido Social Democrata, com a sigla PPD/PSD, desde 13 de Outubro de 1976 (autorizado por despacho do STJ).</span></p><p><span>O jornal "Povo Livre" é a publicação oficial do partido desde 1974.</span></p><p><span>Integrou coligações com fins eleitorais como, por exemplo, a AD - Aliança Democrática (PPD/PSD, CDS e PPM) entre 1979 e 1981.</span></p><p><span>O símbolo foi alterado em 1986, conforme Acórdão do Tribunal Constitucional n.º 343/86.</span></p>',
                'sigla' => 'PPD/PSD',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1975-01-25',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.psd.pt/',
                    'Facebook' => 'https://www.facebook.com/psdportugal',
                    'X' => 'https://twitter.com/psdportugal',
                    'Instagram' => 'https://www.instagram.com/psdportugal/',
                    'Youtube' => 'https://www.youtube.com/@psdportugal',
                    'morada_1' => 'Rua de São Caetano, 9',
                    'morada_2' => '1249-087 Lisboa',
                    'Telefone' => '+351 213 918 500',
                    'Email' => 'psd@psd.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido3_1.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Socialista',
                'sinopse' => '<p><span>Fundado em 19 de Abril de 1973, através da transformação da Acção Socialista Portuguesa que surgira em 1964.</span></p><p><span>Foi inscrito no Supremo Tribunal de Justiça em 1 de Fevereiro de 1975 com a denominação Partido Socialista e a sigla PS.</span></p><p><span>O jornal "Acção Socialista" é a publicação oficial do partido.</span></p><p><span>O símbolo foi alterado em 1992, conforme Acórdão do Tribunal Constitucional n.º 290/92.</span></p>',
                'sigla' => 'PS',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1975-02-01',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.ps.pt/',
                    'Facebook' => 'https://www.facebook.com/psportugal',
                    'X' => 'https://twitter.com/psportugal',
                    'Instagram' => 'https://www.instagram.com/psportugal/',
                    'Youtube' => 'https://www.youtube.com/@psportugal',
                    'morada_1' => 'Largo do Rato, 2',
                    'morada_2' => '1269-143 Lisboa',
                    'Telefone' => '+351 213 822 000',
                    'Email' => 'portal@ps.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido4_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Popular Monárquico',
                'sinopse' => '<p><span>Fundado em Maio de 1974, tendo por base a Convergência Monárquica formada em 1971 (Movimento Popular Monárquico, Liga Popular Monárquica e Renovação Portuguesa).</span></p><p><span>Foi inscrito no Supremo Tribunal de Justiça em 17 de Fevereiro de 1975 com a denominação Partido Popular Monárquico e a sigla PPM.</span></p><p><span>Integrou coligações com fins eleitorais como, por exemplo, a AD (PPD/PSD, CDS e PPM) entre 1979 e 1981.</span></p><p><span>O símbolo foi alterado em 2011, conforme Acórdão do Tribunal Constitucional nº 162/2011.</span></p>',
                'sigla' => 'PPM',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1975-02-17',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.ppm.pt/',
                    'Facebook' => 'https://www.facebook.com/ppmportugal',
                    'X' => 'https://twitter.com/ppmportugal',
                    'Instagram' => 'https://www.instagram.com/ppmportugal/',
                    'Youtube' => 'https://www.youtube.com/@ppmportugal',
                    'morada_1' => 'Travessa da Pimenteira, 2, R/C esq.º',
                    'morada_2' => '1300-460 Lisboa',
                    'Telefone' => '+351 919 745 841',
                    'Email' => 'ppm74.geral@hotmail.com',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido5_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Comunista dos Trabalhadores Portugueses',
                'sinopse' => '<p><span>Foi inscrito no Supremo Tribunal de Justiça em 18 de Fevereiro de 1975, com a denominação Movimento Reorganizativo do Partido do Proletariado e a sigla MRPP. Passou a designar-se Partido Comunista dos Trabalhadores Portugueses, com a sigla PCTP/MRPP, desde 15 de Março de 1977 (autorizado por despacho do STJ).</span></p><p><span>Publica "Bandeira Vermelha" em 1970 como órgão teórico e "Luta Popular" em 1971 como órgão de massas.</span></p>',
                'sigla' => 'PCTP/MRPP',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1975-02-18',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.lutapopularonline.org',
                    'morada_1' => 'Rua da Palma, 159. 2.º dt.º',
                    'morada_2' => '1100-391 Lisboa',
                    'Telefone' => '+351 218 050 600',
                    'Email' => 'lutapopular@pctpmrpp.org',
                    'Email' => 'pctpmrpp1970@gmail.com ',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido6_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Ecologista "Os Verdes"',
                'sinopse' => '<p><span>Foi inscrito no Supremo Tribunal de Justiça em 15 de Dezembro de 1982, com a denominação Movimento Ecologista Português - Partido \'Os Verdes\' e a sigla MEP-PV.</span></p><p><span>A denominação e o símbolo foram alterados em 1987, passando a designar-se Partido Ecologista \'Os Verdes\', conforme Acórdão do Tribunal Constitucional nº 158/87.</span></p><p><span>Em 1989 são alterados o símbolo e a sigla, que passa a ser PEV, conforme Acórdão do Tribunal Constitucional nº 324/89.</span></p><p><span>Tem concorrido às eleições integrado na coligação de partidos formada com o PCP, com a denominação CDU - Coligação Democrática Unitária.</span></p>',
                'sigla' => 'PEV',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1982-12-15',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.osverdes.pt/',
                    'Facebook' => 'https://www.facebook.com/osverdesportugal',
                    'X' => 'https://twitter.com/osverdesportugal',
                    'Instagram' => 'https://www.instagram.com/osverdesportugal/',
                    'Youtube' => 'https://www.youtube.com/@osverdesportugal',
                    'morada_1' => 'Av. D. Carlos I, 146, 1.º dt.º',
                    'morada_2' => '1200-651 Lisboa',
                    'Telefone' => '+351 213 960 308',
                    'Telefone' => '+351 213 960 291',
                    'Email' => 'pev@osverdes.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido10_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Ergue-te',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 10 de Julho de 1985, com a denominação Partido Renovador Democrático e a sigla PRD, conforme Acórdão n.º 126/85.</span></p><p><span>Todos os elementos identificadores foram alterados em 2000, passando a designar-se Partido Nacional Renovador, com a sigla PNR, conforme Acórdão do Tribunal Constitucional n.º 250/2000.</span></p><p><span>O símbolo foi alterado em 2011, conforme Acórdão do Tribunal Constitucional n.º 12/2011.</span></p><p><span>Todos os elementos identificadores foram alterados em 10 de julho de 2020, passando a designar-se Ergue-te, com a sigla E, conforme Acórdão do Tribunal Constitucional n.º 371/2020</span></p>',
                'sigla' => 'E',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1985-07-10',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.partidoergue-te.pt/',
                    'Facebook' => 'https://www.facebook.com/ergue.te',
                    'X' => 'https://twitter.com/ergue_te',
                    'Instagram' => 'https://www.instagram.com/ergue_te/',
                    'Youtube' => 'https://www.youtube.com/@ergue_te',
                    'morada_1' => 'Rua Hermano Neves, 18, piso 3 E7',
                    'morada_2' => '1600-477 Lisboa',
                    'Telefone' => '+351 964 378 225',
                    'Email' => 'geral@partidoergue-te.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido_ergete.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido da Terra',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 12 de Agosto de 1993, com a denominação Movimento o Partido da Terra e a sigla MPT, conforme Acórdão nº 455/93.</span></p><p><span>A denominação foi alterada para MPT - Partido da Terra, conforme Acórdão do Tribunal Constitucional nº 397/2003.</span></p><p><span>Em 2007 procede a nova alteração da denominação que passa a Partido da Terra, conforme Acórdão do Tribunal Constitucional nº 115/2007.</span></p>',
                'sigla' => 'MPT',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1993-08-12',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'http://mpt.pt/',
                    'Facebook' => 'https://www.facebook.com/partidodaterra',
                    'X' => 'https://twitter.com/partidodaterra',
                    'Instagram' => 'https://www.instagram.com/partidodaterra/',
                    'Youtube' => 'https://www.youtube.com/@partidodaterra',
                    'morada_1' => 'Rua da Beneficência, 111, 1.º',
                    'morada_2' => '1600-018 Lisboa',
                    'Telefone' => '+351 211 341 068',
                    'Email' => 'mpt@mpt.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido12_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Bloco de Esquerda',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 24 de Março de 1999, com a denominação Bloco de Esquerda e a sigla B.E., conforme Acórdão nº 196/99.</span></p><p><span>Publica mensalmente o jornal "Esquerda".</span></p>',
                'sigla' => 'B.E.',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1999-03-24',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.bloco.org/',
                    'Facebook' => 'https://www.facebook.com/blocoesquerda',
                    'X' => 'https://twitter.com/blocoesquerda',
                    'Instagram' => 'https://www.instagram.com/blocoesquerda/',
                    'Youtube' => 'https://www.youtube.com/@blocoesquerda',
                    'morada_1' => 'Rua da Palma, 268',
                    'morada_2' => '1100-394 Lisboa',
                    'Telefone' => '+351 213 510 510',
                    'Email' => 'bloco.esquerda@bloco.org',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido14_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Trabalhista Português',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 10 de Outubro de 2000, com a denominação Partido Trabalhista Português e a sigla PTP, conforme Acórdão nº 251/2000.</span></p><p><span>Publica mensalmente o jornal "Trabalhista".</span></p>',
                'sigla' => 'PTP',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2009-07-01',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://ptp-mudanca.webnode.pt/',
                    'Facebook' => 'https://www.facebook.com/ptpportugal',
                    'X' => 'https://twitter.com/ptpportugal',
                    'Instagram' => 'https://www.instagram.com/ptpportugal/',
                    'Youtube' => 'https://www.youtube.com/@ptpportugal',
                    'morada_1' => 'Avenida Almirante Reis, 114, 5.º H',
                    'morada_2' => '1150-023 Lisboa',
                    'Telefone' => '+351 968 060 197',
                    'Telefone' => '+351 211 992 463',
                    'Email' => 'geral.trabalhista@gmail.com',
                    'Email' => 'danielaserralha.ptp@gmail.com',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido54_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'PESSOAS – ANIMAIS – NATUREZA',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 13 de Janeiro de 2011, com a denominação Partido pelos Animais e pela Natureza e a sigla PAN, conforme Acórdão n.º 27/2011.</span></p><p><span>Passou a designar-se "Pessoas - Animais - Natureza", com um novo símbolo, desde 18 de setembro de 2014 (conforme Acórdão do Tribunal Constitucional n.º 600/2014).</span></p>',
                'sigla' => 'PAN',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2011-01-13',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'http://www.pan.com.pt/',
                    'Facebook' => 'https://www.facebook.com/panportugal',
                    'X' => 'https://twitter.com/panportugal',
                    'Instagram' => 'https://www.instagram.com/panportugal/',
                    'Youtube' => 'https://www.youtube.com/@panportugal',
                    'morada_1' => 'Rua da Assunção, n.º 7, 1.º',
                    'morada_2' => '1100-042 Lisboa',
                    'Telefone' => '+351 213 426 226',
                    'Telefone' => '+351 969 954 184',
                    'Email' => 'geral@pan.com.pt',
                    'Email' => 'administrativo@pan.com.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/pan_2014.jpg',
                    ],
                ],
            ],
            [
                'nome' => 'Movimento Alternativa Socialista',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 29 de Julho de 2013, com a denominação Movimento Alternativa Socialista e a sigla MAS, conforme Acórdão n.º 458/2013.</span></p>',
                'sigla' => 'MAS',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2013-07-29',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'http://www.mas.org.pt/',
                    'Facebook' => 'https://www.facebook.com/masportugal',
                    'X' => 'https://twitter.com/masportugal',
                    'Instagram' => 'https://www.instagram.com/masportugal/',
                    'Youtube' => 'https://www.youtube.com/@masportugal',
                    'morada_1' => 'Rua António Pereira Carrilho, 5, 2.º',
                    'morada_2' => '1000-046 Lisboa',
                    'Telefone' => '+351 218 203 611',
                    'Email' => 'mas@mas.org.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido58.png',
                    ],
                ],
            ],
            [
                'nome' => 'LIVRE',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 19 de março de 2014, com a denominação Livre e a sigla L, conforme Acórdão n.º 255/2014.</span></p><p><span>A sua denominação e sigla passaram a ser LIVRE/Tempo de Avançar e L/TDA em 20 de maio de 2015, conforme Acordão n.º 283/2015.</span></p><p><span>A sua denominação passou a ser LIVRE em 10 de maio de 2017, conforme Acordão n.º 242/2017.</span></p><p><span>A sua sigla passou a ser L em 22 de junho de 2017, conforme Acordão n.º 316/2017.</span></p>',
                'sigla' => 'L',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2014-03-19',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'http://livrept.net/',
                    'Facebook' => 'https://www.facebook.com/livrept',
                    'X' => 'https://twitter.com/livrept',
                    'Instagram' => 'https://www.instagram.com/livrept/',
                    'Youtube' => 'https://www.youtube.com/@livrept',
                    'morada_1' => 'Rua Marcos Portugal, 22-A',
                    'morada_2' => '1200-258 Lisboa',
                    'Email' => 'info@partidolivre.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/livre.png',
                    ],
                ],
            ],
            [
                'nome' => 'Juntos pelo Povo',
                'sinopse' => '<p><span>Inscrito no Tribunal Constitucional em 27 de janeiro de 2015, com a denominação Juntos pelo Povo e a sigla JPP, conforme Acórdão TC n.º 51/2015.</span></p>',
                'sigla' => 'JPP',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2015-01-27',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'http://juntospelopovo.blogspot.pt/',
                    'Facebook' => 'https://www.facebook.com/jppportugal',
                    'X' => 'https://twitter.com/jppportugal',
                    'Instagram' => 'https://www.instagram.com/jppportugal/',
                    'Youtube' => 'https://www.youtube.com/@jppportugal',
                    'morada_1' => 'Estrada Padre Alfredo Vieira de Freitas, CCI 164 A',
                    'morada_2' => '9100-079 Santa Cruz',
                    'Telefone' => '+351 915 201 930',
                    'Telefone' => '+351 915 201 928',
                    'Email' => 'mjppovo@gmail.com',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido_jpp.jpg',
                    ],
                ],
            ],
            [
                'nome' => 'ALTERNATIVA DEMOCRÁTICA NACIONAL',
                'sinopse' => '<p><span>Inscrito no Tribunal Constitucional em 11 de fevereiro de 2015, com a denominação Partido Democrático Republicano e a sigla PDR, conforme Acórdão TC n.º 104/2015.</span></p><p><span>Passou a denominar-se Alternativa Democrática Nacional, com a sigla ADN e símbolo diferente, em 28 de setembro de 2021, conforme Acordão n.º 765/2021 (extrato publicado no DR, 2.ª série, Parte D, n.º 207, de 25 de outubro de 2021).</span></p>',
                'sigla' => 'ADN',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2015-02-11',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://adn.com.pt',
                    'Facebook' => 'https://www.facebook.com/adnportugal',
                    'X' => 'https://twitter.com/adnportugal',
                    'Instagram' => 'https://www.instagram.com/adnportugal/',
                    'Youtube' => 'https://www.youtube.com/@adnportugal',
                    'morada_1' => 'Praça Bernardo Santareno, n.º 3 - B',
                    'morada_2' => '1900-098 Lisboa',
                    'Telefone' => '+351 968 436 742',
                    'Email' => 'geral@adn.com.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/adn-100x100.png',
                    ],
                ],
            ],
            [
                'nome' => 'Nós, Cidadãos!',
                'sinopse' => '<p><span>Inscrito no Tribunal Constitucional em 23 de junho de 2015, com a denominação Nós, Cidadãos! e a sigla NC, conforme Acórdão TC n.º 331/2015.</span></p>',
                'sigla' => 'NC',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2015-06-23',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'http://noscidadaos.pt/',
                    'morada_1' => 'Rua Gonçalves Crespo, 16 A',
                    'morada_2' => '1150-185 Lisboa',
                    'Telefone' => '+351 917 604 967',
                    'Email' => 'geral@noscidadaos.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido_nos_cidadaos.jpg',
                    ],
                ],
            ],
            [
                'nome' => 'Iniciativa Liberal',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 13 de dezembro de 2017, com a denominação Iniciativa Liberal e a sigla IL, conforme Acórdão n.º 826/2017.</span></p>',
                'sigla' => 'IL',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2017-12-13',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'http://iniciativaliberal.pt/',
                    'Facebook' => 'https://www.facebook.com/iniciativaliberal',
                    'X' => 'https://twitter.com/iniciativaliberal',
                    'Instagram' => 'https://www.instagram.com/iniciativaliberal/',
                    'Youtube' => 'https://www.youtube.com/@iniciativaliberal',
                    'morada_1' => 'Avenida da Boavista, n.º 1788',
                    'morada_2' => '4100-116 Porto',
                    'Email' => 'info@liberal.pt',
                    'Email' => 'secretariageral@liberal.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido_liberal.png',
                    ],
                ],
            ],
            [
                'nome' => 'CHEGA',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 9 de abril de 2019, com a denominação CHEGA e a sigla CH, conforme Acórdão n.º 218/2019.</span></p>',
                'sigla' => 'CH',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2019-04-09',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://partidochega.pt/',
                    'Facebook' => 'https://www.facebook.com/chegapartido',
                    'X' => 'https://twitter.com/chegapartido',
                    'Instagram' => 'https://www.instagram.com/chegapartido/',
                    'Youtube' => 'https://www.youtube.com/@chegapartido',
                    'morada_1' => 'Rua Miguel Lupi, 12, 1.º dt.º',
                    'morada_2' => '1200-725 Lisboa',
                    'Telefone' => '+351 213 961 244',
                    'Email' => 'geral@partidochega.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido_chega.png',
                    ],
                ],
            ],
            [
                'nome' => 'Reagir Incluir Reciclar',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 30 de maio de 2019, com a denominação Reagir Incluir Reciclar e a sigla R.I.R., conforme Acórdão n.º 330/2019.</span></p>',
                'sigla' => 'R.I.R.',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2019-05-30',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.partido-rir.pt/',
                    'Telefone' => '+351 913 239 429',
                    'Email' => 'geral@partido-rir.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/rir.png',
                    ],
                ],
            ],
            [
                'nome' => 'Volt Portugal',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 25 de junho de 2020, com a denominação Volt Portugal e a sigla VP, conforme Acórdão n.º 330/2020.</span></p>',
                'sigla' => 'VP',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2020-06-25',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://www.voltportugal.org/',
                    'Email' => 'info@voltportugal.org',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido_volt.png',
                    ],
                ],
            ],
            [
                'nome' => 'NOVA DIREITA',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 9 de janeiro de 2024, com a denominação NOVA DIREITA e a sigla ND, conforme Acórdão n.º 4/2024.</span></p>',
                'sigla' => 'ND',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2024-01-09',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://novadireita.pt/',
                    'morada_1' => 'Avenida António Serpa, 32 8b',
                    'morada_2' => '1050-027 Lisboa',
                    'Telefone' => '+351 217 961 260',
                    'Email' => 'secretaria.geral@novadireita.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/nova_direita_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'PARTIDO LIBERAL SOCIAL',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 11 de março de 2025, com a denominação PARTIDO LIBERAL SOCIAL e a sigla PLS, conforme Acórdão n.º 203/2025.</span></p>',
                'sigla' => 'PLS',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2025-03-11',
                    'dissolucao' => null,
                ],
                'contactos' => [
                    'Website' => 'https://partidoliberal.pt/',
                    'morada_1' => 'Espaço Amoreiras - Centro Empresarial; Rua D. João V n. º24 - 1.03',
                    'morada_2' => '1250-091 Lisboa',
                    'Email' => 'info@partidoliberalsocial.pt',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/pls.png',
                    ],
                ],
            ],
            [
                'nome' => 'Aliança Democrática',
                'sinopse' => '<p><span>Coligação eleitoral formada pelo PPD/PSD, CDS e PPM, cujos principais impulsionadores foram Francisco Sá Carneiro, Freitas do Amaral e Gonçalo Ribeiro Telles, respetivamente. Concorreu às eleições legislativas de 1979 e 1980, obtendo nos dois atos eleitorais, a maioria absoluta. Durou até 1983, altura em que os partidos concorreram às eleições legislativas separados. A morte de Sá Carneiro e de Adelino Amaro da Costa constituiu um duro golpe para a coligação.</span></p><p><span>A coligação foi reactivada em 2014, para as eleições que formaram o XXIV Governo constitucional e em eleições em 2025.</span></p>',
                'sigla' => 'AD',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1979-01-01',
                    'dissolucao' => null,
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido38_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Aliança Povo Unido',
                'sinopse' => '<p><span>Coligação de esquerda formada pelo PCP e pelo MDP/CDE. Concorreu às eleições intercalares de 1979 e às eleições legislativas de 1980, 1983 e 1985. Estes dois partidos políticos haviam já constituído a coligação FEPU nessa altura com a participação da FSP que acabou por não integrar a APU.</span></p>',
                'sigla' => 'APU',
                'extinta' => true,
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido39_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Associação para a Defesa dos Interesses de Macau',
                'sinopse' => '<p><span>Associação política de cariz conservador, fundada por Senna Fernandes, que tinha como principal opositor político o Centro Democrático de Macau (CDM).</span></p><p><span>Na eleição para a Assembleia Constituinte de 1975 consegue eleger um deputado, Diamantino de Oliveira Ferreira, pelo círculo eleitoral de Macau.</span></p>',
                'sigla' => 'ADIM',
                'extinta' => true,
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido29_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Centro Democrático de Macau',
                'sinopse' => '<p><span>Associação política de cariz conservador, fundada por Senna Fernandes, que tinha como principal opositor político o Centro Democrático de Macau (CDM).</span></p><p><span>Na eleição para a Assembleia Constituinte de 1975 consegue eleger um deputado, Diamantino de Oliveira Ferreira, pelo círculo eleitoral de Macau.</span></p>',
                'sigla' => 'CDM',
                'extinta' => true,
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido30_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Centro Democrático de Macau',
                'sinopse' => '<p><span>Fundado em 30/04/1974, com sede em Macau, propõe-se a lutar pelo exercício dos direitos civis e políticos e participar na vida política, defendendo os princípios de uma democracia plural, com a livre e ativa participação de todos os cidadãos. Visto ser um partido criado no círculo eleitoral de Macau (aquando da soberania portuguesa no território) o seu objetivo principal era o progresso daquela região e dos seus habitantes. Concorre às eleições para a Assembleia Constituinte de 1975, pelo círculo de Macau, não tendo logrado eleger nenhum representante.</span></p>',
                'sigla' => 'CDM',
                'extinta' => true,
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido30_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Frente Eleitoral Povo Unido',
                'sinopse' => '<p><span>Coligação entre o PCP, o MDP e a FSP, formada em Setembro de 1976, tendo em vista concorrer, em lista conjunta, às eleições autárquicas desse ano. O PCP e o MDP vieram posteriormente a constituir a coligação APU, da qual a FSP já não veio a fazer parte.</span></p>',
                'sigla' => 'FEPU',
                'extinta' => true,
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido35_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Frente Republicana e Socialista',
                'sinopse' => '<p><span>Coligação formada pelo PS, UEDS e ASDI, surge em 10 de Junho de 1980, durante o I Governo da AD. Obtém 26,65% dos votos nas eleições para a Assembleia da República realizadas em 5 de Outubro de 1980.</span></p>',
                'sigla' => 'FEPU',
                'extinta' => true,
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido43_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Política XXI',
                'sinopse' => '<p><span>Surge em 1994, resultado da alteração da denominação e sigla do Movimento Democrático Português/Comissões Democráticas Eleitorais (MDP/CDE), conforme Acórdão 312/94, de 28 de Março, do Tribunal Constitucional, publicado no Diário da República, II Série, de 28/03/1994. A inscrição primitiva no Supremo Tribunal de Justiça remonta a 30/01/1975. Enquanto MDP/CDE concorreu a sucessivas eleições como força política integrante das coligações APU e FEPU. Alguns militantes do Política XXI acabam por se encontrar na origem do Bloco de Esquerda no ano de 1999.</span></p><p><span>Encontra-se dissolvido, conforme Acórdão 199/2008, do Tribunal Constitucional, publicado em Diário da República, 2ª Série  Nº 82  28 de Abril de 2008.</span></p>',
                'sigla' => 'PXXI',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-01-30',
                    'dissolucao' => '2008-04-28',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido13_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'União Democrática Popular',
                'sinopse' => '<p><span>Organização política marxista, de natureza comunista, criada em Dezembro de 1974, impulsionada pelo Comité de Apoio à Reconstrução do Partido, pelos Comités Comunistas Revolucionários Marxistas-Leninistas e pela União Revolucionária Marxista-Leninista. O seu programa prevê um Estado que pertença à e operária, o combate ao neoliberalismo, a luta pela paz e o pugnar pela estreita união com organizações e movimentos que lutam contra o capital e o imperialismo. Publicou o jornal "A Voz do Povo", tido como órgão oficial. A UDP foi uma das organizações políticas de onde saíram alguns elementos que em 1999 integraram o Bloco de Esquerda. A data de inscrição no Supremo Tribunal de Justiça é 10/02/1975. Encontra-se dissolvida, conforme Acórdão 655/2005, do Tribunal Constitucional, publicado em Diário da República, II Série, 16 de Novembro.</span></p>',
                'sigla' => 'UDP',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-02-10',
                    'dissolucao' => '2005-11-16',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido20_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido da Democracia Cristã',
                'sinopse' => '<p><span>Em 1974 surge o Partido Cristão Social Democrata, que dias depois de se ter formado une-se ao Partido Democrático Popular Cristão. Ainda no mesmo ano, fruto de uma dissidência, constitui-se o PDC. São seus dirigentes: Nuno Calvet de Magalhães, Henrique de Sousa e Melo, José Mendes da Fonseca, entre outros. Conforme o disposto nos seus Estatutos, "pretende colocar todos os poderes públicos ao serviço do Povo, segundo os princípios democráticos e de harmonia com a moral, o direito, a liberdade e as responsabilidades cristãs" (in Artigo 1º, Capítulo I dos seus Estatutos). O semanário "Presença Democrática" é uma publicação sua. Inscrito oficialmente no Supremo Tribunal de Justiça em 13/02/1975. É extinto pelo Acórdão 529/2004 do Tribunal Constitucional, publicado no Diário da República, II Série, em 20/08/2004.</span></p>',
                'sigla' => 'PDC',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-02-13',
                    'dissolucao' => '2004-08-20',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido21_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Movimento de Esquerda Socialista',
                'sinopse' => '<p><span>Define-se como um movimento que luta pela conquista do Poder pelos trabalhadores. Apesar de fundado em 1974 as suas origens remontam a 1970. Concorreu somente a dois atos eleitorais: para a Assembleia Constituinte de 1975 e para as eleições legislativas de 1976. Inscreveu-se oficialmente no Supremo Tribunal de Justiça em 20/02/1975. O seu registo foi dado por cancelado pelo Acórdão 666/97 do Tribunal Constitucional, publicado no Diário da República, II Série, em 18/12/1997, com fundamento no facto de o partido ter deixado de exercer atividade desde os primeiros meses do ano de 1981.</span></p>',
                'sigla' => 'MES',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-02-20',
                    'dissolucao' => '1997-12-18',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido22_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Frente Socialista Popular',
                'sinopse' => '<p><span>Herdeira do Movimento Socialista Popular de Manuel Serra integrou o Partido Socialista, como grupo autónomo, até Dezembro de 1974. Contrária à lógica capitalista do Estado, defende uma relação entre os Homens baseada nos ideais de justiça, igualdade e fraternidade. Inscreveu-se oficialmente no Supremo Tribunal de Justiça a 27/02/1975 e foi declarada extinta pelo Acórdão 492/2004 do Tribunal Constitucional, publicado no Diário da República, II Série, 07/07/2004. Integrou a coligação com fins eleitorais FEPU em conjunto com o PCP e o MDP/CDE. Concorreu a dois atos eleitorais: para a Assembleia Constituinte de 1975 e Assembleia da República em 1976.</span></p>',
                'sigla' => 'FSP',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-02-27',
                    'dissolucao' => '2004-07-07',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido27_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido de Unidade Popular',
                'sinopse' => '<p><span>Fundado em Dezembro de 1974, apareceu no espectro partidário português como uma organização política de tendência maoísta, com o objetivo de instaurar uma Democracia Popular, unindo a e operária, os camponeses pobres e os explorados. Tem origem na denominada fação Mendes PCP (ML). Concorreu somente ao ato eleitoral para a Assembleia Constituinte de 1975. Inscrito oficialmente no Supremo Tribunal de Justiça em 27/02/1975, foi decretada a sua dissolução através do Acórdão 665/97 do Tribunal Constitucional, publicado em Diário da República, II Série, em 18/12/1997, pois, segundo o mesmo Acórdão, deixara de exercer atividade desde a década de 70.</span></p>',
                'sigla' => 'PUP',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-02-27',
                    'dissolucao' => '1997-12-18',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido26_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Comunista de Portugal (Marxista-Leninista)',
                'sinopse' => '<p><span>A sua origem remonta a 1956 quando se dá uma cisão no PCP. Alguns participantes desta cisão juntam-se a outros elementos de orientação marxista-leninista e criam em 1964 a Frente de Acção Popular e poucos meses depois o Comité Marxista-Leninista Português, que durou até 1970, data em que se formou o PCP (ML). A instauração de uma ditadura do proletariado e a salvaguarda da independência nacional são os seus objetivos primordiais.</span></p><p><span>Não querendo revelar quais os nomes dos seus militantes ao Supremo Tribunal de Justiça, não é admitido a concorrer às eleições para a Assembleia Constituinte. Inscreve-se oficialmente no Supremo Tribunal de Justiça em 26/03/1976. "Unidade Popular" era uma publicação sua. Não obstante não se encontrar formalmente extinto o partido não desenvolve qualquer atividade política.</span></p>',
                'sigla' => 'PCP (ML)',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1976-03-26',
                    'dissolucao' => null,
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido32_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Grupos Dinamizadores da Unidade Popular',
                'sinopse' => '<p><span>Visava a criação de uma frente popular aberta a todos os antifascistas revolucionários, na luta pelo socialismo. Inscrito oficialmente como partido político em 25/10/1976 vem a ser dissolvido pelo Tribunal Constitucional através do Acórdão 669/97, publicado em Diário da República, II Série, 18/12/1997, devido à cessação de atividade desde o ano de 1997. Durante a sua existência concorreu somente às eleições Autárquicas de 1976.</span></p>',
                'sigla' => 'GDUP(s)',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1976-10-25',
                    'dissolucao' => '1997-12-18',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido33_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Organização Comunista Marxista Leninista Portuguesa',
                'sinopse' => '<p><span>Surge da alteração de denominação, sigla e símbolo da Frente Eleitoral Comunista - Marxista-Leninista, em 25/10/1976. É dissolvida oficialmente em 1988 tendo o Tribunal Constitucional confirmado a anotação da respetiva deliberação de dissolução no Acórdão 10/88, de 06/01/88, publicado na II Série do Diário da República em 15/03/1988.</span></p>',
                'sigla' => 'OCMLP',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1976-10-25',
                    'dissolucao' => '1988-03-15',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido34_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Socialista Revolucionário',
                'sinopse' => '<p><span>Criado em 1978, fruto da fusão entre a Liga Comunista Internacionalista (LCI) e o Partido Revolucionário dos Trabalhadores (PRT), sendo a sua data de inscrição no Supremo Tribunal de Justiça 02/04/1979. Alguns dos militantes desta organização política estão na origem do Bloco de Esquerda. Conforme se retira dos respetivos estatutos, o partido declara-se como secção portuguesa da IV Internacional e pretende uma revolução socialista que destrua o sistema capitalista. Requereu a modificação da sigla e símbolo para aqueles que atualmente são utilizados o que foi deferido pelo Acórdão 454/93, 10 Agosto, publicado no Diário da República II Série em 25/09/1993.</span></p><p><span>Encontra-se dissolvido, conforme Acórdão 140/2008, do Tribunal Constitucional, publicado em Diário da República, 2ª Série - Nº 64 - 1 de Abril de 2008.</span></p>',
                'sigla' => 'PSR',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-04-02',
                    'dissolucao' => '2008-04-01',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido7_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Trabalhista',
                'sinopse' => '<p><span>Surge, em 6 de Julho de 1979, data do despacho do Supremo Tribunal de Justiça (STJ), fruto da alteração promovida pela Aliança Operária Camponesa (AOC) da sua denominação, sigla e símbolo. Em 1980 requer alteração ao desenho do símbolo inicialmente adotado o que é deferido por despacho de 25 de Junho desse mesmo ano do STJ. O Tribunal Constitucional acabaria por proceder à sua extinção através do Acórdão 238/00, publicado em Diário da República, II Série de 21/12/2000, com fundamento na inatividade do partido desde 1983.</span></p>',
                'sigla' => 'PT',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-07-06',
                    'dissolucao' => '2000-12-21',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido24_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Movimento Independente para a Reconstrução Nacional/Partido da Direita Portuguesa',
                'sinopse' => '<p><span>Inscrito oficialmente no Supremo Tribunal de Justiça a 27/07/1979. Concorreu somente a um ato eleitoral para a Assembleia da República nas eleições de 1980. O General Kaúlza de Arriaga foi seu líder. Defende os princípios e práticas da direita democrática social, bem como o estabelecimento de um regime presidencialista. O seu registo foi cancelado e o partido dissolvido pelo Acórdão 674/97 do Tribunal Constitucional, publicado em Diário da República, II Série em 18/12/1997, pois o partido deixara de exercer atividade desde 30 de Junho de 1984.</span></p>',
                'sigla' => 'MIRN',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-07-27',
                    'dissolucao' => '1984-06-30',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido36_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'União de Esquerda Socialista Democrática',
                'sinopse' => '<p><span>Fundada na Convenção da Esquerda Socialista e Democrática, em Janeiro de 1978, pela Associação de Cultura Socialista - Fraternidade Operária, pelo MSU e por conhecidos militantes socialistas independentes. É inscrita oficialmente no Supremo Tribunal de Justiça a 20/08/1979. Dissolve-se em Abril de 1986, embora o cancelamento do partido ocorra só em 1997 através do Acórdão 356/97 do Tribunal Constitucional, publicado no Diário da República, II Série, em 12/07/1997. Alguns dos seus membros mais destacados passaram a integrar o PS.</span></p>',
                'sigla' => 'UEDS',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-08-20',
                    'dissolucao' => '1997-07-12',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido37_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Operário da Unidade Socialista',
                'sinopse' => '<p><span>Fundado em 1976, tendo origem na fusão do Movimento para a Unidade Socialista e da Organização Socialista dos Trabalhadores.</span></p><p><span>Foi inscrito no Supremo Tribunal de Justiça em 23 de Agosto de 1979, com a denominação Partido Operário de Unidade Socialista e a sigla POUS.</span></p><p><span>Em 1994, a denominação foi alterada para Movimento para a Unidade dos Trabalhadores e a sigla para MUT, conforme Acórdão do Tribunal Constitucional nº 301/94.</span></p><p><span>No ano de 1999 requer ao Tribunal Constitucional o regresso à sua antiga denominação e sigla, pedido que foi deferido através do Acórdão nº 203/99.</span></p><p><span>Decretada a extinção e ordenado o cancelamento da respetiva inscrição no registo dos partidos políticos existente no Tribunal Constitucional - Acórdão n.º 743/2020.</span></p>',
                'sigla' => 'POUS',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-08-23',
                    'dissolucao' => '2021-01-06',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido8_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Democrático do Atlântico',
                'sinopse' => '<p><span>Fundado em 1976, tendo origem na fusão do Movimento para a Unidade Socialista e da Organização Socialista dos Trabalhadores.</span></p><p><span>Foi inscrito no Supremo Tribunal de Justiça em 23 de Agosto de 1979, com a denominação Partido Operário de Unidade Socialista e a sigla POUS.</span></p><p><span>Em 1994, a denominação foi alterada para Movimento para a Unidade dos Trabalhadores e a sigla para MUT, conforme Acórdão do Tribunal Constitucional nº 301/94.</span></p><p><span>No ano de 1999 requer ao Tribunal Constitucional o regresso à sua antiga denominação e sigla, pedido que foi deferido através do Acórdão nº 203/99.</span></p><p><span>Decretada a extinção e ordenado o cancelamento da respetiva inscrição no registo dos partidos políticos existente no Tribunal Constitucional - Acórdão n.º 743/2020.</span></p>',
                'sigla' => 'PDA',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-11-05',
                    'dissolucao' => '2015-09-28',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido9_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Socialista dos Trabalhadores',
                'sinopse' => '<p><span>Organização portuguesa da IV Internacional, proletária e revolucionária, com o objetivo de instauração de uma ditadura do proletariado, através da abolição do capitalismo. Inscrito oficialmente em 12/06/1980 no Supremo Tribunal de Justiça é extinto por despacho do Supremo Tribunal de Justiça em 04/05/1981, após ter concorrido a um ato eleitoral para a Assembleia da República em 1980.</span></p>',
                'sigla' => 'PST',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1980-06-12',
                    'dissolucao' => '1981-05-04',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido42_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Acção Social Democrata Independente',
                'sinopse' => '<p><span>Surge com o abandono de alguns deputados do PPD/PSD em 1979, entre os quais António de Sousa Franco, Joaquim Magalhães Mota e Sérvulo Correia. Advoga uma democracia política, económica, social e cultural que promova a liberdade e a igualdade, tendo como referência os princípios do socialismo personalista e democrático. Inscreveu-se oficialmente no Supremo Tribunal de Justiça em 27/06/1980. Não obstante não se encontrar formalmente extinto o partido não desenvolve qualquer atividade política.</span></p>',
                'sigla' => 'ASDI',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1980-06-27',
                    'dissolucao' => null,
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido40_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Força de Unidade Popular',
                'sinopse' => '<p><span>Major Otelo Saraiva de Carvalho funda este partido na área do "socialismo participado", com o objectivo de promover a unidade popular em Portugal para a construção do Socialismo. Defendia nos seus estatutos a luta permanente pelos objetivos da Revolução Socialista. Revolução que só seria possível pelo recurso dos trabalhadores à violência revolucionária armada. Inscreveu-se oficialmente no Supremo Tribunal de Justiça em 28/07/1980, tendo sido decidida a sua extinção pelo Tribunal Constitucional no Acórdão 231/2004, de 31 Março 2004, publicado no Diário da República, II Série, em 30/04/2004.</span></p>',
                'sigla' => 'FUP',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1980-07-28',
                    'dissolucao' => '2004-04-30',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido41_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Comunista Reconstruído',
                'sinopse' => '<p><span>Define-se como partido político revolucionário do proletariado, regendo-se pela doutrina marxista-leninista. Inscrito oficialmente no Supremo Tribunal de Justiça em 03/02/1981. O congresso do partido decide em Dezembro de 1992 a dissolução, tendo, o Tribunal Constitucional, mediante Acórdão 358/02, 7 Agosto, publicado no Diário da República II Série, em 14/09/2002, ordenado a anotação da referida decisão.</span></p><p><span>Concorreu a dois atos eleitorais para a Assembleia da República em 1985 e 1987.</span></p>',
                'sigla' => 'PC (R)',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-02-03',
                    'dissolucao' => '2002-09-14',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido44_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido da Solidariedade Nacional',
                'sinopse' => '<p><span>Apresenta-se como defensor dos interesses e direitos dos mais carenciados de todos os escalões etários, especialmente das reivindicações dos cidadãos já reformados, promovendo a justiça social. Inscrito oficialmente no Tribunal Constitucional mediante Acórdão 255/90, publicado no Diário da República, II Série, de 17/09/1990, veio a ser declarado extinto pelo Acórdão 28/2006 do mesmo tribunal, publicado no Diário da República, II Série, de 10/01/2006. Nas eleições legislativas de 1991 conseguiu obter representação parlamentar elegendo um deputado.</span></p>',
                'sigla' => 'PSN',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1990-06-26',
                    'dissolucao' => '2006-01-10',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido48_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido da Gente',
                'sinopse' => '<p><span>De inspiração cristã, defende a promoção da democracia política, social, económica e cultural baseada em princípios éticos, sociais e democráticos da doutrina cristã. O primeiro pedido de inscrição, com a denominação Partido Social Cristão - PSC e um peixe como símbolo, foi rejeitado pelo Tribunal Constitucional, devido ao símbolo proposto, mediante Acórdão 107/95, publicado no Diário da República, II Série, em 01/04/1995, por considerar "..., a este respeito, que se trata de emblema que, posto em relação com a pretendida denominação do partido, pode suscitar pela sua caracterização de matriz religiosa, confusão no espírito e boa fé dos cidadãos, desse modo perturbando a desejada transparência na participação política destes...".</span></p><p><span>"...Desenhado isoladamente ou acompanhado de outros elementos simbólicos, o peixe foi, historicamente, representado como simbólico de Cristo...E, ainda hoje, não constituindo o símbolo por excelência do cristianismo, não deixa de poder ser entendido como tal em certas circunstâncias...".</span></p><p><span>Solicita, então a alteração da denominação, sigla e símbolo, e acaba por ser inscrito oficialmente no Tribunal Constitucional mediante Acórdão 118/95, publicado no Diário da República em 01/04/1995. Os membros do partido deliberaram a dissolução do partido e requereram ao Tribunal Constitucional a anotação da respetiva extinção, o que veio a suceder através do Acórdão 56/99, publicado no Diário da República, II Série em 12/03/1999. Durante a sua existência concorreu apenas ao referido ato eleitoral para a Assembleia da República no ano de 1995.</span></p>',
                'sigla' => 'PG',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1995-04-01',
                    'dissolucao' => '1999-03-12',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido51_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Português das Regiões',
                'sinopse' => '<p><span>Defende um modelo democrático assente nos valores regionais, éticos e sociais de liberdade, desenvolvido através de órgãos nacionais, regionais e autárquicos. Inscrito oficialmente no Tribunal Constitucional conforme Acórdão 256/95, publicado no Diário da República II Série de 23/06/1995. O seu registo foi cancelado através do Acórdão 750/98 do Tribunal Constitucional, publicado em Diário da República, II Série, em 23/07/1999. Nunca concorreu a qualquer ato eleitoral.</span></p>',
                'sigla' => 'PPR',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1995-06-23',
                    'dissolucao' => '1999-07-23',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido50_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Humanista',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 7 de Abril de 1999, com a denominação Partido Humanista e a sigla P.H., conforme Acórdão nº 204/99.</span></p><p><span>Encontra-se dissolvido, conforme Acórdão n.º 281/2015, de 20 de maio, do Tribunal Constitucional.</span></p>',
                'sigla' => 'P.H.',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-04-07',
                    'dissolucao' => '2015-05-20',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido15_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Movimento pelo Doente',
                'sinopse' => '<p><span>Partido político cujo principal objetivo é a defesa dos direitos sociais nomeadamente dos direitos inerentes à saúde do cidadão português. Defende os valores do humanismo ético da cultura portuguesa. Inscrito oficialmente em 23/04/2002 no Tribunal Constitucional, pelo Acórdão nº 178/2002 publicado em Diário da República, II Série em 21/05/2002.</span></p><p><span>Encontra-se dissolvido, conforme Acórdão 31/2007, do Tribunal Constitucional, publicado em Diário da República, 2ª Série – Nº 32 – 14 de Fevereiro de 2007.</span></p>',
                'sigla' => 'MD',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2002-04-23',
                    'dissolucao' => '2007-02-14',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido17_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Nova Democracia',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 18 de junho de 2003, com a denominação Nova Democracia e a sigla PND, conforme Acórdão n.º 298/2003.</span></p><p><span>O símbolo foi alterado em 2009, conforme Acórdão do Tribunal Constitucional n.º 179/2009.</span></p><p><span>Decretada a extinção e ordenado o cancelamento da respetiva inscrição no registo dos partidos políticos existente no Tribunal Constitucional - Acórdão n.º 409/2015.</span></p>',
                'sigla' => 'PND',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2003-06-23',
                    'dissolucao' => '2015-11-19',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido18_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Frente de Esquerda Revolucionária',
                'sinopse' => '<p><span>Fusão entre uma das múltiplas dissensões trotskistas a operar em Portugal, e um pequeno grupo radical de jovens libertários. Surge da transformação da Liga Socialista de Trabalhadores, segundo o Acórdão 327/89, do Tribunal Constitucional, publicado no Diário da República, II Série, em 14/04/1989. A deliberação de dissolução da FER foi reconhecida e mandada anotar pelo Tribunal Constitucional mediante o Acórdão 637/2005, publicado no Diário da República, II Série, em 16/11/2005.</span></p>',
                'sigla' => 'FER',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2005-11-16',
                    'dissolucao' => '2015-11-16',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido47_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Liberal Democrata',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 29 de Maio de 2008, com a denominação Movimento Mérito e Sociedade e a sigla MMS, conforme Acórdão nº 290/2008.</span></p><p><span>Todos os elementos identificadores foram alterados em 2011, passando a designar-se Partido Liberal Democrata, com a sigla PLD, conforme Acórdão do Tribunal Constitucional nº 13/2011.</span></p><p><span>Decretada a extinção e ordenado o cancelamento da respetiva inscrição no registo dos partidos políticos existente no Tribunal Constitucional – Acórdão n.º 679/2019.</span></p>',
                'sigla' => 'PLD',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2008-05-29',
                    'dissolucao' => '2019-12-24',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido56_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Movimento Esperança Portugal',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 23 de Julho de 2008, com a denominação Movimento Esperança Portugal e a sigla MEP, conforme Acórdão nº 395/2008.</span></p><p><span>O Congresso do MEP deliberou a sua extinção, tendo sido igualmente deliberado que os bens do partido político extinto revertessem para uma associação de natureza política – o «Movimento Esperança Portugal». O Tribunal Constitucional anotou a dissolução do Partido e cancelou a sua inscrição, com efeitos à data de entrada do requerimento, 12 de dezembro de 2012 – Acórdão n.º 14/2013.</span></p>',
                'sigla' => 'MEP',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2008-07-23',
                    'dissolucao' => '2012-12-12',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido53_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Partido Cidadania e Democracia Cristã',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 1 de Julho de 2009, com a denominação Portugal pro Vida e a sigla PPV, conforme Acórdão n.º 327/2009.</span></p><p><span>A sua denominação e sigla passaram a ser Partido Cidadania e Democracia Cristã e PPV/CDC desde 12 de agosto de 2015 (conforme Acórdão do Tribunal Constitucional n.º 386/2015).</span></p><p><span>Foi ordenada a anotação da dissolução e o cancelamento da respetiva inscrição no registo dos partidos políticos existente no Tribunal Constitucional, pelo Acórdão n.º 596/2020.</span></p>',
                'sigla' => 'PPV/CDC',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2009-07-01',
                    'dissolucao' => '2020-09-12',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido55_0.png',
                    ],
                ],
            ],
            [
                'nome' => 'Aliança',
                'sinopse' => '<p><span>Foi inscrito no Tribunal Constitucional em 23 de outubro de 2018, com a denominação Aliança e a sigla A, conforme Acórdão nº 559/2018.</span></p><p><span>O Tribunal Constitucional decretou a extinção do partido político e determinou o cancelamento da sua inscrição – Acórdão n.º 97/2025.</span></p>',
                'sigla' => 'A',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2018-10-23',
                    'dissolucao' => '2025-03-04',
                ],
                'anexos' => [
                    [
                        'nome' => 'Logotipo',
                        'anexo' => 'https://www.cne.pt/sites/default/files/partido_alianca.png',
                    ],
                ],
            ],
        ];

        $instituicaoTipo = InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Partido Político']);
        foreach ($partidos as $partidoData) {
            $instituicao = Instituicao::create([
                'uuid' => Str::uuid(),
                'nome' => $partidoData['nome'],
                'sigla' => $partidoData['sigla'],
                'sinopse' => $partidoData['sinopse'],
                'extinta' => $partidoData['extinta'],
            ]);
            InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => $instituicaoTipo->id]);

            if (isset($partidoData['dados'])) {
                InstituicaoDados::create([
                    'instituicao_id' => $instituicao->id,
                    'fundacao' => $partidoData['dados']['fundacao'] ?? null,
                    'dissolucao' => $partidoData['dados']['dissolucao'] ?? null,
                ]);
            }

            if (isset($partidoData['anexos'])) {
                foreach ($partidoData['anexos'] as $anexoData) {
                    InstituicaoAnexo::create([
                        'instituicao_id' => $instituicao->id,
                        'anexo' => $anexoData['anexo'],
                        'uuid' => Str::uuid(),
                        'anexo_tipo_id' => 1,
                        'nome' => $anexoData['nome'],
                        'descricao' => null,
                    ]);
                }
            }

            if (isset($partidoData['contactos'])) {
                $morada = '';
                $codPostal = '';
                $localidade = '';

                foreach ($partidoData['contactos'] as $contactoTipo => $contacto) {

                    if ($contactoTipo === 'morada_1' || $contactoTipo === 'morada_2') {

                        if ($contactoTipo === 'morada_1') {
                            $morada = $contacto;
                        } else {
                            $codPostal = explode(' ', $contacto)[0];
                            $localidade = explode(' ', $contacto)[1];
                            if ($localidade === 'Santa') {
                                $localidade = 'Santa Cruz';
                            }
                            // $this->command->line($morada.' - '.$codPostal.' - '.$localidade);
                            InstituicaoMorada::create([
                                'instituicao_id' => $instituicao->id,
                                'morada' => $morada,
                                'codigo_postal' => $codPostal,
                                'localidade' => $localidade,
                                'concelho_id' => Concelho::where('nome', $localidade)->first()->id,
                            ]);
                            $morada = '';
                            $codPostal = '';
                            $localidade = '';
                        }

                    } else {
                        InstituicaoContacto::create([
                            'instituicao_id' => $instituicao->id,
                            'contacto' => $contacto,
                            'contacto_tipo_id' => ContactoTipo::where('tipo', $contactoTipo)->first()->id,
                        ]);
                    }
                }
            }
        }

        $instituicao = Instituicao::create([
            'uuid' => Str::uuid(),
            'nome' => 'Centro Nacional de Eleições',
            'sigla' => 'CNE',
            'sinopse' => '<p><span>Respondendo à necessidade de disciplinar a eleição da Assembleia Constituinte e assegurar "condições de igualdade entre as diferentes listas de candidatos", foi criada a Comissão Nacional das Eleições pelo Decreto-Lei n.º 621-C/74, de 15 de novembro, tendo sido empossada em 27 de fevereiro de 1975, em cerimónia levada a efeito no Palácio de S. Bento e a que presidiu o Primeiro-Ministro do IV Governo Provisório, Brigadeiro Vasco Gonçalves, que, perante a proximidade da eleição da Assembleia Constituinte, exortou os partidos políticos a (...) fazerem a pedagogia da democracia na campanha eleitoral e a transformarem esta numa demonstração de maturidade política, de civismo, de amor à Pátria (...) pela consolidação da democracia (...).</span></p>',
            'extinta' => false,
        ]);
        InstituicaoDados::create([
            'instituicao_id' => $instituicao->id,
            'fundacao' => '1975-02-27',
            'dissolucao' => null,
        ]);
        InstituicaoContacto::create([
            'instituicao_id' => $instituicao->id,
            'contacto' => 'https://www.cne.pt/',
            'contacto_tipo_id' => ContactoTipo::where('tipo', 'Website')->first()->id,
        ]);
        InstituicaoContacto::create([
            'instituicao_id' => $instituicao->id,
            'contacto' => 'cne@cne.pt',
            'contacto_tipo_id' => ContactoTipo::where('tipo', 'Email')->first()->id,
        ]);
        InstituicaoMorada::create([
            'instituicao_id' => $instituicao->id,
            'morada' => 'Av. D. Carlos I, 134 - 5.º',
            'codigo_postal' => '1200-651',
            'localidade' => 'Lisboa',
            'concelho_id' => Concelho::where('nome', 'Lisboa')->first()->id,
        ]);
        InstituicaoAnexo::create([
            'instituicao_id' => $instituicao->id,
            'anexo' => 'https://www.cne.pt/sites/all/themes/framework/images/novo-logo-cne.png',
            'uuid' => Str::uuid(),
            'anexo_tipo_id' => 1,
            'nome' => 'Logotipo',
            'descricao' => null,
        ]);

        $anexos = [
            [
                'nome' => 'Lei da CNE',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_71-78_lei-da-cne.pdf',
                'descricao' => 'Lei n.º 71/78, de 27 de dezembro',
            ],
            [
                'nome' => 'Regimento da CNE',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/regimento-cne_dr-05-05-2020.pdf',
                'descricao' => 'Deliberação n.º 540/2020, de 5 de maio',
            ],
            [
                'nome' => 'LEPR - Lei Eleitoral do Presidente da República',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lepr_2021_06_04.pdf',
                'descricao' => 'Decreto-Lei n.º 319-A/76, de 3 de maio',
            ],
            [
                'nome' => 'Regime do exercício de funções por titulares de cargos políticos e altos cargos públicos',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_52-2019_titulares_cargos_publicos_e_altos_cargos_politicos_v2020.pdf',
                'descricao' => 'Lei n.º 52/2019, de 31 de julho',
            ],
            [
                'nome' => 'Organização, funcionamento e processo do Tribunal Constitucional',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_28_82_tc_atualiz-2022.pdf',
                'descricao' => 'Lei n.º 28/82, de 15 de novembro',
            ],
            [
                'nome' => 'LEAR - Lei Eleitoral da Assembleia da República',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lear_consolidada_2020-11.pdf',
                'descricao' => 'Lei n.º 14/79, de 16 de maio',
            ],
            [
                'nome' => 'LEAR - Versão anotada e comentada -2015 (parcialmente desatualizada)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lear_anotada_2015.pdf',
                'descricao' => 'Jorge Miguéis, Carla Luís, João Almeida, André Lucas, Ilda Rodrigues, Márcio Almeida',
            ],
            [
                'nome' => 'Lei da paridade nos órgãos colegiais representativos do poder político',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_3_2006_paridade_2019.pdf',
                'descricao' => 'Lei Orgânica n.º 3/2006, de 21 de agosto',
            ],
            [
                'nome' => 'Designação dos mandatários das listas pelos círculos eleitorais de fora do território nacional',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_411-b-76-mandatarios-estrangeiro-2012.pdf',
                'descricao' => 'Decreto-Lei n.º 411-B/79, de 3 de outubro',
            ],
            [
                'nome' => 'LEALRAA - Lei Eleitoral da Assembleia Legislativa da Região Autónoma dos Açores',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lealraa_consolidada-04-02-2022.pdf',
                'descricao' => 'Decreto-Lei n.º 267/80, de 8 de agosto',
            ],
            [
                'nome' => 'LEALRAA - Versão anotada e comentada - edição de 2012 (parcialmente desatualizada)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lealraa_2012_anotada.pdf',
                'descricao' => 'Jorge Miguéis, Carla Luís, João Almeida, Ana Branco, André Lucas, Ilda Rodrigues',
            ],
            [
                'nome' => 'Lei Eleitoral para a Assembleia Legislativa da Região Autónoma dos Açores',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis-lealraa-acordao-tc-24_2022.pdf',
                'descricao' => 'Acórdão Tribunal Constitucional n.º 24/2022',
            ],
            [
                'nome' => 'Estatuto Político-Administrativo da Região Autónoma dos Açores',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_eparaa_2012.pdf',
                'descricao' => 'Lei n.º 39/80, de 5 de agosto',
            ],
            [
                'nome' => 'LEALRAM - Lei Eleitoral da Assembleia Legislativa da Região Autónoma da Madeira',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lealram_atualizada.pdf',
                'descricao' => 'Lei Orgânica n.º 1/2006, de 13 de fevereiro',
            ],
            [
                'nome' => 'Lei Orgânica n.º 1-A/2025, de 27 de janeiro – Altera a Lei Eleitoral da Assembleia Legislativa da Região Autónoma da Madeira',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/2025_segunda_alteracao_a_lei_eleitoral_madeira.pdf',
                'descricao' => 'Nota: Estas alterações não são aplicáveis à eleição marcada para dia 23-03-2025 – cf. Deliberação da CNE de 28-01-2025.',
            ],
            [
                'nome' => 'LEALRAM - Versão anotada e comentada - Edição de 2015',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/lealram_anotada_final_30-03-2015.pdf',
                'descricao' => 'Jorge Miguéis, Carla Luís, João Almeida, André Lucas, Ilda Rodrigues, Márcio Almeida',
            ],
            [
                'nome' => 'Estatuto Político-Administrativo da Região Autónoma da Madeira',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_eparam_2012.pdf',
                'descricao' => 'Lei n.º 13/91, de 5 de junho',
            ],
            [
                'nome' => 'LEOAL - Lei Eleitoral dos Órgãos das Autarquias Locais',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_leoal_2021_06_04.pdf',
                'descricao' => 'Lei Orgânica n.º 1/2001, de 14 de agosto (artigo 1.º, n.º 1) ',
            ],
            [
                'nome' => 'LEOAL - Versão anotada e comentada - Edição de 2014 (parcialmente desatualizada)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_leoal_anotada_2014.pdf',
                'descricao' => 'Jorge Miguéis, Carla Luís, João Almeida, Ana Branco, André Lucas, Ilda Rodrigues',
            ],
            [
                'nome' => 'Limites à renovação sucessiva de mandatos dos presidentes dos órgãos executivos das autarquias locais',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_46_2005_renovacao_mandatos.pdf',
                'descricao' => 'Lei n.º 46/2005, de 29 de agosto',
            ],
            [
                'nome' => 'Regime de gestão limitada dos órgãos das autarquias locais e seus titulares',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_47_2005_gestao_limitada.pdf',
                'descricao' => 'Lei n.º 47/2005, de 29 de agosto',
            ],
            [
                'nome' => 'Quadro de competências e regime jurídico de funcionamento dos órgãos dos municípios e das freguesias',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_169_99_atualiz-2021.pdf',
                'descricao' => 'Lei n.º 169/99, de 18 de setembro',
            ],
            [
                'nome' => 'Regime Jurídico das Autarquias Locais',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_75_2013_rjal_atualiz-2020.pdf',
                'descricao' => 'Lei n.º 75/2013, de 12 de setembro',
            ],
            [
                'nome' => 'Regime jurídico da reorganização administrativa territorial autárquica',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/lei_22_2012_regime-reorganizacao-administrativa-autarquica.pdf',
                'descricao' => 'Lei n.º 22/2012, de 30 de maio',
            ],
            [
                'nome' => 'Regime jurídico da tutela administrativa',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_27_96_tutela_administrativa_2015.pdf',
                'descricao' => 'Lei n.º 27/96, de 1 de agosto',
            ],
            [
                'nome' => 'Regras de exercício do direito de voto e de elegibilidade nas eleições autárquicas dos cidadãos da União residentes num Estado-membro de que não tenham a nacionalidade',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_diretiva_94-80-ce_atualizada2013.pdf',
                'descricao' => 'Directiva n.º 94/80/CE, de 19 de dezembro (v. Directiva n.º 2006/106/CE, de 20 de dezembro de 2006)',
            ],
            [
                'nome' => 'Resolução da Assembleia da República n.º 158/2019',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_resolucao-ar-158-2019_acordo-eleicoes-locais-reino-unido.pdf',
                'descricao' => 'Aprova o Acordo entre a República Portuguesa e o Reino Unido da Grã-Bretanha e Irlanda do Norte sobre a Participação em Eleições Locais de Nacionais de cada Um dos Estados Residentes no Território do Outro (Decreto do Presidente da República n.º 51/2019)',
            ],
            [
                'nome' => 'LEPE - Lei Eleitoral do Parlamento Europeu',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lepe_atualiz-2022.pdf',
                'descricao' => 'Lei n.º 14/87, de 29 de abril',
            ],
            [
                'nome' => 'Regimes excecionais de exercício do direito de voto em mobilidade e do direito de voto antecipado para a eleição para o Parlamento Europeu a realizar em 2024',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/eleicoes/2024_pe/legisla/2024_pe_lei-80-2023_regime_execional_voto_antecipado.pdf',
                'descricao' => 'Lei n.º 80/2023 , de 28 de dezembro',
            ],
            [
                'nome' => 'LLEAR - Lei Eleitoral da Assembleia da República',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lear_consolidada_2020-11.pdf',
                'descricao' => '(aplicável por força do disposto na LEPE) Lei n.º 14/79, de 16 de maio',
            ],
            [
                'nome' => 'LEAR - Versão anotada e comentada -2015',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lear_anotada_2015.pdf',
                'descricao' => 'Jorge Miguéis, Carla Luís, João Almeida, André Lucas, Ilda Rodrigues, Márcio Almeida',
            ],
            [
                'nome' => 'LEPR - Lei Eleitoral do Presidente da República',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lepr_11-11-2020a.pdf',
                'descricao' => '(aplicável por força do disposto na LEPE) Lei Orgânica n.º 3/2006, de 21 de agosto',
            ],
            [
                'nome' => 'Acto relativo à eleição dos representantes ao Parlamento Europeu por sufrágio universal directo',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_pe_ato1976_atualizado2013.pdf',
                'descricao' => '20 de setembro de 1976',
            ],
            [
                'nome' => 'Sistema de exercício do direito de voto e de elegibilidade nas eleições para o Parlamento Europeu dos cidadãos da União Europeia residentes num Estado-membro de que não tenham a nacionalidade',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_diretiva_93-109-ce_atualizada2013.pdf',
                'descricao' => 'Directiva n.º 93/109/CE, de 6 de dezembro de 1993 (Diretiva n.º 2013/1/UE do Conselho)',
            ],
            [
                'nome' => 'Competências, modo de organização e funcionamento do Conselho das Comunidades Portuguesas',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_ccp_66_a_2007_atualizada_2023-08-21.pdf',
                'descricao' => 'Lei n.º 66-A/2007, de 11 de dezembro',
            ],
            [
                'nome' => 'LRN - Lei do Referendo Nacional',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lrn_2020-11-11.pdf',
                'descricao' => 'Lei n.º 15-A/98, de 3 de abril - atualizada com a Lei Orgânica n.º 4/2020, de 11 de novembro',
            ],
            [
                'nome' => 'LRN - Lei do Referendo Nacional - Versão anotada e comentada (Edição 2006)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lorr_2006_anotada.pdf',
                'descricao' => 'por Fátima Abrantes Mendes',
            ],
            [
                'nome' => 'LRR-A - Lei do Referendo Regional - Açores',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_referendo-regional-acores_lo_2_2015.pdf',
                'descricao' => 'Lei Orgânica n.º 2/2015, de 12 de fevereiro (Referendo Regional na Região Autónoma dos Açores)',
            ],
            [
                'nome' => 'LRL - Lei do Referendo Local',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lrl_2020-11-11.pdf',
                'descricao' => 'Lei Orgânica n.º 4/2000, de 24 de agosto - atualizada com a Lei Orgânica n.º 4/2020, de 11 de novembro',
            ],
            [
                'nome' => 'Constituição da República Portuguesa',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_pt_2005.pdf',
                'descricao' => 'Em vigor',
            ],
            [
                'nome' => '7ª Revisão Constitucional (2005)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_2005.pdf',
                'descricao' => 'Lei Constitucional n.º 1/2005 e texto consolidado da CRP',
            ],
            [
                'nome' => '6ª Revisão Constitucional (2004)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_2004.pdf',
                'descricao' => 'Lei Constitucional n.º 1/2004 e texto consolidado da CRP',
            ],
            [
                'nome' => '5ª Revisão Constitucional (2001)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_2001.pdf',
                'descricao' => 'Lei Constitucional n.º 1/2001 e texto consolidado da CRP',
            ],
            [
                'nome' => '4ª Revisão Constitucional (1997)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_1997.pdf',
                'descricao' => 'Lei Constitucional n.º 1/97 e texto consolidado da CRP',
            ],
            [
                'nome' => '3ª Revisão Constitucional (1992)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_1992.pdf',
                'descricao' => 'Lei Constitucional n.º 1/92 e texto consolidado da CRP',
            ],
            [
                'nome' => '2ª Revisão Constitucional (1989)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_1989.pdf',
                'descricao' => 'Lei Constitucional n.º 1/89 e texto consolidado da CRP',
            ],
            [
                'nome' => '1ª Revisão Constitucional (1982)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_1982.pdf',
                'descricao' => 'Lei Constitucional n.º 1/82 e texto consolidado da CRP',
            ],
            [
                'nome' => 'Constituição da República Portuguesa de 1976',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/crp_1976.pdf',
            ],
            [
                'nome' => 'Estatuto dos Militares da Guarda Nacional Republicana (capacidade eleitoral passiva)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_dl_30_2017_estatuto_militares_gnr.pdf',
                'descricao' => 'Decreto-Lei n.º 30/2017, de 22 de março',
            ],
            [
                'nome' => 'Cobertura jornalística em período eleitoral e meios de publicidade comercial',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/lei_72-a_2015_cobertura-jornalistica_publicidade_comercial.pdf',
                'descricao' => 'Lei n.º 72-A/2015, de 23 de julho',
            ],
            [
                'nome' => 'Lei de Defesa Nacional (capacidade eleitoral passiva dos militares)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lo_1_b_2009_defesa%20nacional_consolidada2014.pdf',
                'descricao' => 'Lei Orgânica n.º 1-B/2009, de 7 de julho',
            ],
            [
                'nome' => 'Quarta alteração à Lei nº 13/99, de 22 de Março (que estabelece o regime jurídico do recenseamento eleitoral) e medidas de simplificação e modernização que asseguram a actualização permanente do recenseamento',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_47_2008_recenseamento.pdf',
                'descricao' => 'Lei n.º 47/2008, de 27 de agosto',
            ],
            [
                'nome' => 'Organização e funcionamento da Entidade das Contas e Financiamento Políticos',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legiscomplementar/legis_lo_2_2005_ecfp_2018-12.pdf',
                'descricao' => 'Lei Orgânica n.º 2/2005, de 10 de janeiro',
            ],
            [
                'nome' => 'Lei dos partidos políticos',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legiscomplementar/legis_lo_2_2003_partidos_politicos_2018.pdf',
                'descricao' => 'Lei Orgânica n.º 2/2003, de 22 de agosto',
            ],
            [
                'nome' => 'Financiamento dos partidos políticos e das campanhas eleitorais',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_financiamento_19_2003_consolidada-2020.pdf',
                'descricao' => 'Lei n.º 19/2003, de 20 de junho',
            ],
            [
                'nome' => 'Regulamentação do artigo 3º da Lei 10/2000, de 21 de junho (Lei das Sondagens)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_portaria_118_2001.pdf',
                'descricao' => 'Portaria n.º 118/2001, de 23 de fevereiro',
            ],
            [
                'nome' => 'Regime jurídico da publicação ou difusão de sondagens e inquéritos de opinião',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_10_2000_sondagens.pdf',
                'descricao' => 'Lei n.º 10/2000, de 21 de junho',
            ],
            [
                'nome' => 'Quadro de competências e regime jurídico de funcionamento dos órgãos dos municípios e das freguesias',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_169_99_atualiz-2021.pdf',
                'descricao' => 'Lei n.º 169/99, de 18 de setembro',
            ],
            [
                'nome' => 'Alargamento da aplicação dos princípios reguladores da propaganda e da obrigação da neutralidade das entidades públicas à data da marcação das eleições ou do referendo',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_26_99.pdf',
                'descricao' => 'Lei n.º 26/99, de 3 de maio',
            ],
            [
                'nome' => 'Criação de bolsas de agentes eleitorais e compensação dos membros das mesas das assembleias ou secções de voto em actos eleitorais e referendários',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_22_99_agentes_eleitorais_2021_04_06.pdf',
                'descricao' => 'Lei n.º 22/99, de 21 de abril',
            ],
            [
                'nome' => 'Regime jurídico do recenseamento eleitoral',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_13_99_re_2024-02-08.pdf',
                'descricao' => 'Lei n.º 13/99, de 22 de março',
            ],
            [
                'nome' => 'Regime jurídico da tutela administrativa',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_27_96_tutela_administrativa_2015.pdf',
                'descricao' => 'Lei n.º 27/96, de 1 de agosto',
            ],
            [
                'nome' => 'Afixação e inscrição de mensagens de publicidade e propaganda',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_97_88_versao2012.pdf',
                'descricao' => 'Lei n.º 97/88, de 17 de agosto',
            ],
            [
                'nome' => 'Crimes de responsabilidade dos titulares de cargos políticos',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_lei_34_87_crimes-titulares_2021.pdf',
                'descricao' => 'Lei n.º 34/87, de 16 de julho (republicada pela Lei n.º 94/2021, 21 dezembro)',
            ],
            [
                'nome' => 'Regime geral do ilícito de mera ordenação social',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_rgco.pdf',
                'descricao' => 'Decreto-Lei n.º 433/82, de 27 de outubro',
            ],
            [
                'nome' => 'Código Penal (Crimes eleitorais)',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_cpenal_2012.pdf',
                'descricao' => 'Decreto-Lei n.º 400/82, de 23 de setembro',
            ],
            [
                'nome' => 'Direito de reunião',
                'anexo' => 'https://www.cne.pt/sites/default/files/dl/legis_dl_406_74_direitoreuniao_2012.pdf',
                'descricao' => 'Decreto-Lei n.º 406/74, de 29 de agosto',
            ],
        ];

        foreach ($anexos as $anexoData) {
            InstituicaoAnexo::create([
                'instituicao_id' => $instituicao->id,
                'anexo' => $anexoData['anexo'],
                'uuid' => Str::uuid(),
                'anexo_tipo_id' => 5,
                'nome' => $anexoData['nome'],
                'descricao' => isset($anexoData['descricao']) ? $anexoData['descricao'] : null,
            ]);
        }
    }
}
