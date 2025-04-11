<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Instituicao;
use App\Models\InstituicaoDados;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class InstituicoesSeeder extends Seeder
{
    /**
     * Auto generated seed file
     */
    public function run(): void
    {

        $instituicoes = [
            [
                'nome' => 'Primeiro Ministério/Gabinete Nacional',
                'sigla' => 'PMGN',
                'sinopse' => '<p><span>Este Ministério Precedeu o Conselho de Ministros.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1736-06-28',
                    'dissolucao' => '1821-07-04',
                ],
            ],
            [
                'nome' => 'Secretaria de Estado dos Negócios Interiores do Reino',
                'sigla' => 'SENIR',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1736 e 1822. Este Ministério Precedeu o Ministério da Administração Interna.</span></p>
                <p><span>O Ministério do Reino foi um departamento governamental português ao qual cabia a condução das políticas de administração do território, de instrução pública (hoje Educação) e de segurança interna, incluindo as questões da polícia ou Intendência-Geral da Polícia da Corte e do Reino. Deu origem primeiro ao Ministério do Interior e depois ao actual Ministério da Administração Interna.</span></p>
<p><span>O Ministério do Reino teve a sua origem na Secretaria de Estado dos Negócios Interiores do Reino, criada por Alvará de 28 de Julho de 1736, na sequência da reorganização dos órgãos da administração central do Estado português.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1736-06-28',
                    'dissolucao' => '1821-01-30',
                ],
            ],
            [
                'nome' => 'Secretaria de Estado dos Negócios Estrangeiros e da Guerra',
                'sigla' => 'SENEG',
                'sinopse' => '<p><span>A Secretaria de Estado dos Negócios Estrangeiros e da Guerra (SENEG) foi o departamento governativo de Portugal, responsável pela administração dos assuntos relativos às relações externas e ao Exército, de 1736 até 1822.</span></p>
<p><span>Após sua criação, o Conselho de Guerra ficou com sua importância limitada.</span></p>
<p><span>A SENEG foi criada por Alvará de 28 de Julho de 1736 do Rei D. João V, no âmbito da reforma da administração central, que organizou o governo na moderna forma de divisão em ministérios especializados num determinado sector governativo. Até então, o governo incluía dois secretários de estado, o da Assinatura de Documentos Régios e o das Mercês, além do escrivão da puridade. Estes membros do governo não eram especializados em nenhum assunto governativo específico, actuando sim em todas as áreas.</span></p>
<p><span>A partir daí, o governo passou a ser constituído por secretários de Estado especializados, sendo criadas as Secretarias de Estado dos Negócios Interiores do Reino, dos Negócios da Marinha e dos Domínios Ultramarinos e dos Negócios Estrangeiros e da Guerra.</span></p>
<p><span>Depois de breves períodos de separação eventual, em 1822, a Secretaria de Estado dos Negócios Estrangeiros e da Guerra é dividida em duas: a Secretaria de Estado dos Negócios Estrangeiros e a Secretaria de Estado dos Negócios da Guerra.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1736-06-28',
                    'dissolucao' => '1834-05-26',
                ],
            ],
            [
                'nome' => 'Secretaria de Estado dos Negócios da Marinha e Domínios Ultramarinos',
                'sigla' => 'SENMDU',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1736 e 1822. Este Ministério Precedeu o Ministério da Marinha.</span></p>
                <p><span>O departamento foi criado em 1736, pelo Rei D. João V, como Secretaria de Estado dos Negócios da Marinha e Domínios Ultramarinos (também referida como Secretaria de Estado da Marinha e Conquistas). Era responsável pelos assuntos marítimos e ultramarinos.</span></p>
<p><span>Durante os períodos de 1821-1823 e de 1834-1835, os assuntos do Ultramar deixam de ser administrados por um departamento específico, sendo repartidos pelos vários ministérios setoriais. Durante esses dois períodos, o ministério administrou apenas os assuntos marítimos, como Secretaria de Estado da Marinha.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1736-06-28',
                    'dissolucao' => '1834-05-26',
                ],
            ],
            [
                'nome' => 'Secretaria de Estado dos Negócios da Fazenda',
                'sigla' => 'SENF',
                'sinopse' => '<p><span>A Secretaria de Estado dos Negócios da Fazenda (1788 — 1834) foi um órgão da administração central do Estado português, criado por Decreto de 15 de Dezembro de 1788, da rainha D. Maria I de Portugal, que tinha a seu cargo a administração dos assuntos fiscais, a autorização e controlo da despesa e a gestão da dívida pública. Foi o órgão antecessor do actual Ministério das Finanças.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1801-01-06',
                    'dissolucao' => '1834-05-26',
                ],
            ],
            [
                'nome' => 'Secretaria de Estado dos Negócios Eclesiásticos e da Justiça',
                'sigla' => 'SENEJ',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1821 e 1822. Este Ministério Precedeu o Ministério da Justiça.</span></p>
                <p><span>Até 1821, os assuntos respeitantes à justiça eram geridos pela Secretaria de Estado dos Negócios Interiores do Reino (antecessora do atual Ministério da Administração Interna).</span></p>
<p><span>O atual Ministério da Justiça foi criado em 1821, na sequência do advento do liberalismo, como Secretaria de Estado dos Negócios Eclesiásticos e de Justiça. Dado que não existia ainda a separação entre a Igreja e o Estado, além da Justiça, uma parte importante da atividade desta Secretaria de Estado era a administração dos assuntos eclesiásticos. A Secretaria de Estado estava estruturada em três repartições (Negócios Eclesiásticos, Justiça e Segurança Pública). Dos ocupantes da cadeira ministerial destacam-se Mouzinho da Silveira, Joaquim António de Aguiar e o Visconde de Seabra. Na segunda metade do século XIX, ainda que a sua denominação oficial não tenha sido alterada, passou a ser conhecida por Ministério dos Negócios Eclesiásticos e de Justiça.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1821-08-23',
                    'dissolucao' => '1834-05-26',
                ],
            ],
            [
                'nome' => 'Presidência do Conselho de Ministros',
                'sigla' => 'PCM',
                'sinopse' => '<p><span>A Presidência do Conselho de Ministros (PCM) é o departamento central do Governo de Portugal. Tem por missão prestar apoio ao Conselho de Ministros, ao Primeiro-Ministro e aos demais membros do Governo aí organicamente integrados e promover a coordenação interministerial dos diversos departamentos governamentais. A PCM é equiparada a um ministério diretamente chefiado pelo primeiro-ministro, na sua qualidade de presidente do Conselho de Ministros.</span></p>
<p><span>Na Presidência do Conselho de Ministros, estão normalmente integrados — quando existem — os vice-primeiros-ministros, os ministros de Estado, os ministros sem pasta e os ministros encarregados de matérias específicas mas que não tutelam nenhum ministério. Tal como os outros departamentos do Governo, a PCM integra também secretários e subsecretários de Estado, uns dependentes dos seus vários ministros e outros diretamente dependentes do primeiro-ministro.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1834-05-26',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Secretaria de Estado dos Negócios do Reino',
                'sigla' => 'SENR',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1821 e 1834. Este Ministério Precedeu o Ministério do Reino.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1821-01-30',
                    'dissolucao' => '1834-05-26',
                ],
            ],
            [
                'nome' => 'Ministério do Reino',
                'sigla' => 'MR',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1834 e 1910. Este Ministério Precedeu o Ministério da Administração Interna.</span></p>
<p><span>O Ministério do Reino foi um departamento governamental português ao qual cabia a condução das políticas de administração do território, de instrução pública (hoje Educação) e de segurança interna, incluindo as questões da polícia ou Intendência-Geral da Polícia da Corte e do Reino. Deu origem primeiro ao Ministério do Interior e depois ao actual Ministério da Administração Interna.</span></p>
<p><span>O Ministério do Reino teve a sua origem na Secretaria de Estado dos Negócios Interiores do Reino, criada por Alvará de 28 de Julho de 1736, na sequência da reorganização dos órgãos da administração central do Estado português.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1830-03-15',
                    'dissolucao' => '1910-10-05',
                ],
            ],
            [
                'nome' => 'Ministério da Marinha e Ultramar',
                'sigla' => 'MMU',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1822 e 1910.</span></p>
<p><span>O Ministério da Marinha e Ultramar era o antigo departamento governativo de Portugal que se ocupava dos assuntos marítimos e dos territórios ultramarinos, tanto no âmbito civil como militar.</span></p>
<span><p>O departamento foi fundado no século XVIII com a designação de Secretaria de Estado dos Negócios da Marinha e Domínios Ultramarinos. A partir de finais do século XIX passa a ser conhecido por Ministério da Marinha e Ultramar. Durante a Primeira República muda a sua designação para Ministério da Marinha e Colónias. Posteriormente foi dividido em dois departamentos separados: o Ministério da Marinha e o Ministério das Colónias.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1830-03-15',
                    'dissolucao' => '1910-10-05',
                ],
            ],
            [
                'nome' => 'Ministério dos Negócios Estrangeiros',
                'sigla' => 'MNE',
                'sinopse' => '<p><span>Ministério de Portugal, ativo desde 1820. O Ministério dos Negócios Estrangeiros (MNE) é o departamento do Governo de Portugal, responsável pela formulação, coordenação e execução da política externa. O MNE é, commumente, apelidado de “Necessidades” em virtude de ter a sua sede no Palácio das Necessidades em Lisboa.</span></p>
<p><span>Embora a atividade diplomática em Portugal tenha uma longa história, remontando ao Condado Portucalense, a primeira Secretaria de Estado vocacionada para os assuntos de Estado foi criada pelo Rei D. João IV após a Restauração, através de alvará de 29 de novembro de 1643. A esta Secretaria de Estado cabiam as matérias relativas a negociações (tratados, casamentos e alianças), à comunicação com estadistas estrangeiros sobre paz e guerra e ao envio de agentes diplomáticos para o exterior.</span></p>
<p><span>Mais tarde, a reorganização da Administração Pública na primeira metade do século XVIII, imposta pela experiência, traduziu-se, pelo Alvará de 28 de julho de 1736, na criação de três secretarias de Estado - a dos Negócios Interiores do Reino, a da Marinha e dos Domínios Ultramarinos e a dos Negócios Estrangeiros e da Guerra - em substituição das antigas secretarias da Assinatura, das Mercês e de Estado. Data, portanto, desse Alvará a existência de uma secretaria de Estado dedicada aos Negócios Estrangeiros, embora só em 1738 haja tido lugar a posse efetiva do primeiro secretário de Estado.</span></p>
<p><span>Anexos mantiveram-se, numa mesma secretaria, os Negócios Estrangeiros e os da Guerra, com uma efémera separação de 6 de janeiro a 28 de julho de 1801, até que na Portaria da Junta Provisória do Governo de 27 de setembro de 1820 os dois ramos da Administração Pública aparecem distintos e entregues à direcção de pessoas diversas. Esta separação foi confirmada definitivamente pela Carta de Lei de 12 de junho de 1822, que reorganizou as secretarias de Estado, passando então a existir definitivamente a Secretaria de Estado dos Negócios Estrangeiros.</span></p>
<p><span>Sempre à Secretaria de Estado dos Negócios Estrangeiros, através de todos os diplomas que regulam o seu funcionamento, foram atribuídas as matérias que ainda hoje competem ao Ministério dos Negócios Estrangeiros. A partir de meados do século XIX, a designação “ministério” começa a ser usada preferencialmente à de “secretaria de Estado” para designar os departamentos governamentais, passando a usar-se o termo “Ministério dos Negócios Estrangeiros” para designar aquele departamento.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1830-03-15',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Guerra',
                'sigla' => 'MG',
                'sinopse' => '<p><span>O Ministério da Guerra (MG) era o antigo departamento governamental de Portugal responsável pela administração dos assuntos relativos ao Exército Português. Em 1950 passou a designar-se "Ministério do Exército (ME)".</span></p>
<p><span>O departamento foi criado em 1820, como Secretaria de Estado dos Negócios da Guerra, a partir da separação, em dois ministérios, da antiga Secretaria de Estado dos Negócios Estrangeiros e da Guerra. O termo "secretaria de estado" passou a ser substituído pelo de "ministério" no final do século XIX.</span></p>
<p><span>Em 1950, o Ministério da Guerra mudou a sua denominação para "Ministério do Exército", passando parte das suas antigas funções — sobretudo ao nível operacional — para a responsabilidade do então criado Departamento da Defesa Nacional.</span></p>
<p><span>A partir do golpe de 25 de Abril de 1974, o ME foi extinto, passando o Chefe do Estado-Maior do Exército (CEME) a ter um estatuto equivalente ao de ministro, assumindo as antigas funções atribuídas ao anterior ministro do Exército.</span></p>
<p><span>Na sequência da revisão constitucional de 1982, as antigas funções políticas do ministro do Exército passaram, quase na totalidade, para o ministro da Defesa Nacional, voltando o CEME a ter apenas funções militares.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1830-03-15',
                    'dissolucao' => '1950-08-02',
                ],
            ],
            [
                'nome' => 'Ministério dos Negócios Eclesiásticos e da Justiça',
                'sigla' => 'MNEJ',
                'sinopse' => '<p><span>Ministério dos Negócios Eclesiásticos e da Justiça (MNEJ) foi a designação dada em Portugal ao departamento governamental que antecedeu o actual Ministério da Justiça.</span></p>
<p><span>O Ministério tem a sua origem em 1821 com a criação da Secretaria de Estado dos Negócios de Justiça, e teve por objectivo a reorganização da Secretaria de Estado dos Negócios do Reino, que acumulavam diversas áreas. A nova Secretária tinha por função gerir os assuntos ligados à justiça civil e criminal, aos negócios eclesiásticos, às nomeações dos lugares de magistratura, a inspecção das prisões e a segurança pública.</span></p>
<p><span>Em 1832, o Secretário de Estado interino dos Negócios de Justiça, Mouzinho da Silveira, estabelece uma nova organização do sistema judicial. A Secretaria de Estado dos Negócios Eclesiásticos e de Justiça passa a integrar três Repartições: Negócios Eclesiásticos, Justiça e Segurança Pública. Em 1834, o Ministro e Secretário de Estado Joaquim António de Aguiar elabora a Lei de 30 de Maio, que extinguia todos os edifícios e ordens religiosos, à excepção das casas religiosas do sexo feminino, as quais estavam sujeitas a um regime especial de acordo com a idade das religiosas.</span></p>
<p><span>Em 1849, esta Secretaria passa a ter quatro repartições:</span></p>
<p><span>
<ul><li>Central: gestão do Arquivo Geral e apoio ao expediente do Ministro;</li>
<li>Negócios Eclesiásticos: relações com a Santa Sé, estatuto civil do clero e património eclesiástico;</li>
<li>Negócios de Justiça: divisão judicial do território, tribunais judiciais e sistema penitenciário;</li>
<li>Contabilidade: elaboração e execução do orçamento do Ministério, e gestão patrimonial.</li></ul></span></p>
<p><span>O Ministério dos Negócios Eclesiásticos e de Justiça foi reorganizado, uma vez mais, em 1892, com vista à redução de despesas, passando a ser composta por três Direcções: Negócios Eclesiásticos, Negócios de Justiça e Central.</span></p>
<p><span>Com a Implantação da República Portuguesa, a partir de 8 de Outubro de 1910, a designação do ministério passa a Ministério da Justiça.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1830-03-15',
                    'dissolucao' => '1910-10-05',
                ],
            ],
            [
                'nome' => 'Ministério da Fazenda',
                'sigla' => 'MF',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1822 e 1910. Este Ministério Precedeu o Ministério das Finanças.</span></p>
                <p><span>O Ministério das Finanças tem a sua origem nas vedorias da Fazenda criadas no século XIV para gerirem os assuntos financeiros do Estado. A partir 1584, as vedorias são substituídas pelo Conselho do Tribunal da Fazenda. Em 1761, é criado o Erário Régio que se transforma no departamento central de finanças do Estado, sendo extinto o Conselho da Fazenda.</span></p>
<p><span>Em 1788, é criado o moderno Ministério das Finanças, sendo então denominado Secretaria de Estado dos Negócios da Fazenda. A partir de 1849 passa a designar-se Ministério dos Negócios da Fazenda ou simplesmente Ministério da Fazenda.</span></p>
<p><span>Em 1910, o departamento muda a sua denominação para Ministério das Finanças.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1830-03-15',
                    'dissolucao' => '1910-10-12',
                ],
            ],
            [
                'nome' => 'Ministério das Obras Públicas, Comércio e Indústria',
                'sigla' => 'MOPCI',
                'sinopse' => '<p><span>O Ministério das Obras Públicas, Comércio e Indústria (1852 — 1910) foi um departamento governativo de Portugal. O ministério foi criado por decreto de 30 de Agosto de 1852, da Rainha D. Maria II, no âmbito da Regeneração, para assegurar o serviço de coordenação e fomento das obras públicas, do comércio e da indústria, com destaque para construção e manutenção das estradas e portos. Este ministério, embora mantendo um núcleo competencial centrado nas obras públicas, sofreu ao longo dos últimos 150 anos diversas alterações orgânicas, com adição de competências e sucessivas cisões, sendo o antecessor directo dos actuais Ministério das Obras Públicas, Transportes e Comunicações, Ministério da Economia e da Inovação e Ministério da Agricultura, do Desenvolvimento Rural e das Pescas.</span></p>
<p><span>Até ao advento do movimento político da Regeneração, o serviço das obras públicas estava incluído no Ministério do Reino. Em 1852, com o arranque das políticas de fomento que caracterizaram a fase inicial da Regeneração, pretendendo-se dar maior desenvolvimento à viação publica, aproveitar as riquezas mineiras do solo e fomentar o comércio e a indústria, por decreto assinado no Paço de Mafra pela rainha D. Maria II, datado de 30 de Agosto de 1852, foi criado o Ministério das Obras Publicas, Comércio e Indústria.</span></p>
<p><span>No novo Ministério foram concentrados todos os serviços relativos às áreas das obras públicas e fomento económico que até então eram tratados nas diferentes repartições do Ministério do Reino. Pouco depois passou também para o novo ministério o serviço dos correios e postas, que estava a cargo do Ministério dos Negócios Estrangeiros.</span></p>
<p><span>Na sequência do golpe de 5 de Outubro de 1910 que implantou a República em Portugal, o Ministério das Obras Públicas, Comércio e Indústria passou a denominar-se Ministério do Fomento, mantendo as mesmas competências.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1852-08-30',
                    'dissolucao' => '1910-10-10',
                ],
            ],
            [
                'nome' => 'Ministério da Instrução Pública',
                'sigla' => 'MIP',
                'sinopse' => '<p><span>A primeira referência à instrução pública em Portugal remonta ao século XVII. Foi brevemente substituida pelo Ministério da Instrução Pública e Belas Artes. Só voltou a ter forma no século XX.</span></p>
                <p><span>Ministério da Instrução Pública foi a denominação dada em Portugal, entre 1913 e 1936, ao departamento governamental responsável pela política da educação.</span></p>
<p><span>Em 1936 passou a denominar-se Ministério da Educação Nacional.</span></p>
<p><span>Ministério da Instrução Pública foi a denominação dada em Portugal, entre 1913 e 1936, ao departamento governamental responsável pela política da educação.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1870-06-22',
                    'dissolucao' => '1936-04-11',
                ],
            ],
            [
                'nome' => 'Ministério da Instrução Pública e Belas Artes',
                'sigla' => 'MIPBA',
                'sinopse' => '<p><span>Ministério da Instrução Pública e Belas Artes foi a designação dada entre 1890 e 1892 ao departamento ministerial do Governo da Monarquia Constitucional Portuguesa competente em matéria de educação e de política cultural. Foi a segunda tentativa de criação de um departamento autónomo na área da instrução pública, mas foi efémera, durando menos de dois anos. O departamento apenas seria restaurado com a implantação da República Portuguesa.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1890-04-05',
                    'dissolucao' => '1890-10-13',
                ],
            ],
            [
                'nome' => 'Ministério da Educação e das Belas Artes',
                'sigla' => 'MEBA',
                'sinopse' => '<p><span>Ministério da Educação e das Belas Artes foi a designação dada entre 1892 e 1907 ao departamento ministerial do Governo da Monarquia Constitucional Portuguesa competente em matéria de educação e de política cultural. Foi a terceira tentativa de criação de um departamento autónomo na área da instrução pública, mas foi efémera, durando menos de quinze anos. O departamento apenas seria restaurado com a implantação da República Portuguesa.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1892-10-13',
                    'dissolucao' => '1892-03-03',
                ],
            ],
            [
                'nome' => 'Ministério do Interior',
                'sigla' => 'MI',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1910 e 1974.</span></p>
<p><span>O Ministério do Interior foi criado após a implementação da Republica, substituindo o Ministério do Reino, designação que manteve até à publicação do Decreto-Lei n.º 203/74, de 15 de Maio, que na sequência da Revolução de 25 de Abril de 1974 criou o actual Ministério da Administração Interna.</span></',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1910-10-05',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério da Marinha e Colónias',
                'sigla' => 'MMC',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo apenas entre 1910 e 1911. Substituiu o Ministério da Marinha e Ultramar do regime anterior, e seria dissolvido em 1911. Os assuntos ultramarinos, são separados do ministério, criando-se um departamento específico para os mesmos, denominado "Ministério das Colónias". O ministério passa, então, a denominar-se, apenas "Ministério da Marinha".</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1910-10-05',
                    'dissolucao' => '1911-08-23',
                ],
            ],
            [
                'nome' => 'Ministério da Marinha',
                'sigla' => 'MM',
                'sinopse' => '<p><span>O Ministério da Marinha (MM) era o antigo departamento do Governo de Portugal que se ocupava dos assuntos marítimos, tanto militares como civis. Até 1911, também era responsável pelos assuntos do Ultramar Português.</span></p>
<p><span>Sob sua tutela direta encontrava-se a Marinha de Guerra Portuguesa. Também era da sua responsabilidade a política executiva nas áreas da marinha mercante, das pescas, da autoridade marítima, da investigação marítima e dos assuntos culturais relacionados com o Mar.</span></p>
<p><span>Na sequência do golpe militar de 25 de Abril de 1974, o Ministério da Marinha deixou de existir como ministério governamental. No entanto, a sua estrutura continuou a existir transitoriamente sob a designação de "Ex-Ministério da Marinha", passando a ser dirigida pelo Chefe do Estado Maior da Armada, que passou a ter o estatuto de ministro. O Ex-Ministério da Marinha manteve as funções militares e de autoridade marítima do anterior ministério, mas as restantes foram, entretanto, divididas por vários outros departamentos governamentais.</span></p>
<p><span>Em 1982, o que restava da estrutura do Ex-Ministério da Marinha foi integrada no Ministério da Defesa Nacional, formando a Marinha Portuguesa. Desde então alguns governos criaram ocasionalmente um Ministério do Mar com as anteriores atribuições civis (sobretudo ao nível das pescas e dos transportes marítimos) do antigo Ministério da Marinha.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1911-09-03',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério das Colónias',
                'sigla' => 'MC',
                'sinopse' => '<p><span>O Ministério das Colónias (1911 — 1951) foi um departamento ministerial do Governo de Portugal que tinha como responsabilidade a condução das políticas civis especificamente dirigidas aos territórios sob domínio colonial português, incluindo a adaptação e aplicação a esses territórios das políticas que no então território metropolitano da República Portuguesa eram responsabilidade de outros ministérios.</span></p>
<p><span>Com a reorganização governamental promulgada por Decreto da Assembleia Nacional Constituinte de 23 de Agosto de 1911, os assuntos da Marinha foram separados dos assuntos ultramarinos, sendo então criados o Ministério das Colónias e o Ministério da Marinha.</span></p>
<p><span>Pelo Decreto-Lei n.º 38 300, de 15 de Junho de 1951, na sequência da revisão constitucional que transformou as colónias portuguesas em províncias ultramarinas, o departamento passou a designar-se Ministério do Ultramar, departamento que sucedeu ao Ministério das Colónias em todas as suas atribuições.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1911-09-03',
                    'dissolucao' => '1950-08-02',
                ],
            ],
            [
                'nome' => 'Ministério da Justiça',
                'sigla' => 'MJ',
                'sinopse' => '<p><span>O atual Ministério da Justiça foi criado em 1821, na sequência do advento do liberalismo, como Secretaria de Estado dos Negócios Eclesiásticos e de Justiça. Dado que não existia ainda a separação entre a Igreja e o Estado, além da Justiça, uma parte importante da atividade desta Secretaria de Estado era a administração dos assuntos eclesiásticos. A Secretaria de Estado estava estruturada em três repartições (Negócios Eclesiásticos, Justiça e Segurança Pública). Dos ocupantes da cadeira ministerial destacam-se Mouzinho da Silveira, Joaquim António de Aguiar e o Visconde de Seabra. Na segunda metade do século XIX, ainda que a sua denominação oficial não tenha sido alterada, passou a ser conhecida por Ministério dos Negócios Eclesiásticos e de Justiça.</span></p>
<p><span>Com a implantação do regime republicano em 1910, o departamento passou a designar-se Ministério da Justiça e dos Cultos. Tendo o novo regime estabelecido a separação entre a Igreja e o Estado, o Ministério da Justiça e dos Cultos, tinha competência para os assuntos relativos à justiça e ainda para a regulação dos cultos. No período da Primeira República o mais conhecido titular da pasta da Justiça foi Afonso Costa e, entre as realizações mais importantes deste período, contam-se a criação do Registo Civil (1914), a criação do Arquivo de Identificação (1918) e a emissão dos primeiros bilhetes de identidade (1919).</span></p>
<p><span>Durante os anos ditadura militar (1926-1933), o Ministério manteve a mesma denominação. Procedeu-se à institucionalização da Ordem dos Advogados (1926), à integração da Polícia de Investigação Criminal (1927) na orgânica ministerial, à promulgação do estatuto judiciário (1927-1928), à reforma do mapa judiciário e às codificações no âmbito do registo civil e do processo penal (1929).</span></p>
<p><span>Com o Estado Novo, o Ministério deixa de ter qualquer competência nos assuntos religiosos, passando a dedicar-se apenas aos assuntos judiciais, em 1940 sendo alterado o seu nome para Ministério da Justiça. De entre os diversos projetos desenvolvidos na primeira metade do regime do Estado Novo destacam-se a implementação da nova rede de estabelecimentos prisionais, a concretização das brigadas de trabalho prisional, o lançamento dos projetos dos palácios de justiça e das casas para magistrados, a criação dos tribunais de execução das penas e dos tribunais plenários criminais de Lisboa e Porto, a reconversão da Polícia de Investigação Criminal em Polícia Judiciária, a implementação das medidas de segurança, a abertura da Colónia Penal do Tarrafal (1945-1954), a introdução de diversos ajustamentos na estrutura do estatuto judiciário (1944) e de substanciais alterações ao Código Penal. São ainda de destacar a aprovação dos novos Código de Processo Civil (1961) e Código Civil (1966).</span></p>
<p><span>Dos primeiros anos da Terceira República, destacam-se a integração no sistema judicial dos tribunais administrativos e fiscais e os tribunais do trabalho. Entre 1974 e 1976, o Ministério da Justiça desocupou o Limoeiro e a Cadeia da Relação do Porto e abriu as portas à feminização das magistraturas. Sucederam-se iniciativas legislativas de monta como a atualização do Código Civil (1977) e da legislação penal, com a aprovação de um novo Código Penal (1982) e de um novo Código de Processo Penal (1987).</span></p>
<p><span>Em 2001, o Ministério da Justiça sofreu uma profunda reforma na organização dos seus serviços, afirmando-se, pela primeira vez, como o departamento governamental “responsável pela concepção, condução, execução e avaliação da política de justiça”.</span></p>
<p><span>Para o efeito, a nova Lei Orgânica manteve os serviços clássicos existentes como a administração da justiça, o sistema prisional, o essencial da rede de centros educativos de menores, a medicina legal, os registos e notariado, a polícia judiciária e a gestão de infraestruturas e equipamentos e criou o Gabinete de Política Legislativa e Planeamento e o Gabinete de Relações Internacionais, Europeias e de Cooperação, organismos que dotaram o Ministério da Justiça de condições para se assumir como o centro responsável pela política de justiça na ordem interna e internacional.</span></p>
<p><span>São também desta data a criação de novos instrumentos de avaliação e responsabilização do sistema de justiça, com a criação da Inspeção-Geral dos Serviços de Justiça, e de descongestionamento do núcleo duro do sistema judiciário com a criação da Direção-Geral da Administração Extrajudicial, dedicada à dinamização dos meios de resolução alternativa de litígios.</span></p>
<p><span>Em 2006, o Ministério da Justiça adaptou a sua orgânica aos princípios definidos pelo Programa de Reestruturação da Administração Central do Estado (PRACE), aprofundando e aperfeiçoando os resultados obtidos na reestruturação de 2001, introduzindo-lhe fatores de similitude orgânica transversais a toda a Administração Central do Estado. Sublinha-se a integração do Instituto Nacional da Propriedade Industrial, com o seu singular acervo arquivístico de marcas e patentes.</span></p>
<p><span>Em 2011, o movimento de atualização do Ministério da Justiça prosseguiu com a adaptação do seu organograma às linhas gerais previstas no Programa de Redução e Melhoria da Administração Central (PREMAC), adotando um modelo de organização mais reduzido. Procedeu-se à revisão e ajustamento das atribuições e competências de todos os serviços e organismos, de modo a potenciar a sua operacionalidade. A título de exemplo refere-se a fusão dos serviços prisionais e dos serviços de reinserção social permitindo uma maior articulação entre as áreas da reinserção social e da execução das medidas privativas de liberdade.</span></p>
<p><span>No âmbito da vigência do XXI Governo Constitucional e dos dois governos seguintes (2019-2024), a lei orgânica do Governo passou a prever a adoção de uma organização mais flexível que a tradicional, não contemplando a existência de ministérios ou outros departamentos governamentais para além da própria Presidência do Conselho de Ministros. As pastas a cargo dos diversos ministros passaram a ser genericamente referidas como "áreas de governo". Na comunicação do Governo e na maioria da nova legislação, o Ministério da Justiça passou assim a ser referido como "área de governo da Justiça" ou simplesmente "Justiça". Contudo, coloquialmente, continua a ser referido pela sua designação tradicional, designação essa que ainda se mantêm na legislação anterior a 2019 ainda em vigor, bem como está incorporada na designação da própria secretaria-geral que dá apoio a esta área de governo.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1910-10-05',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Justiça e dos Cultos',
                'sigla' => 'MJC',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1810 e 1934. Temporariamente substituiu o Ministério da Justiça.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1914-12-01',
                    'dissolucao' => '1934-10-23',
                ],
            ],
            [
                'nome' => 'Ministério das Finanças',
                'sigla' => 'MJC',
                'sinopse' => '<p><span>O Ministério das Finanças tem a sua origem nas vedorias da Fazenda criadas no século XIV para gerirem os assuntos financeiros do Estado. A partir 1584, as vedorias são substituídas pelo Conselho do Tribunal da Fazenda. Em 1761, é criado o Erário Régio que se transforma no departamento central de finanças do Estado, sendo extinto o Conselho da Fazenda.</span></p>
<p><span>Em 1788, é criado o moderno Ministério das Finanças, sendo então denominado Secretaria de Estado dos Negócios da Fazenda. A partir de 1849 passa a designar-se Ministério dos Negócios da Fazenda ou simplesmente Ministério da Fazenda.</span></p>
<p><span>Em 1910, o departamento muda a sua denominação para Ministério das Finanças.</span></p>
<p><span>Desde então, o ministério tem mantido quase sempre a mesma denominação, com excepção de alguns períodos limitados em que se chamou Ministério das Finanças e da Coordenação Económica (março-maio de 1974), Ministério da Coordenação Económica (maio-junho de 1974), Ministério das Finanças e do Plano (1980–1983) ou Ministério das Finanças e Administração Pública (2002–2011).</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1910-10-05',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério do Fomento',
                'sigla' => 'MF',
                'sinopse' => '<p><span>Ministério do Fomento foi a designação dada, na sequência do golpe republicano de 5 de outubro de 1910, ao anterior Ministério das Obras Públicas, Comércio e Indústria. Manteve as mesmas competências deste, sendo responsável pelas áreas das obras públicas e da gestão da economia. O ministério sofreria algumas mudanças entre 1911 e 1917, perdendo algumas funções, entregues a novos ministérios ou juntas administrativas. Em 1917, passou a designar-se Ministério do Comércio, com algumas de suas tarefas sendo transferidas para o reformado Ministério do Trabalho, como o pelouro da Agricultura. O ministério seria, ainda nesse ano, subdividido em vários ministérios.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1910-10-10',
                    'dissolucao' => '1917-11-05',
                ],
            ],
            [
                'nome' => 'Ministério do Comércio',
                'sigla' => 'MC',
                'sinopse' => '<p><span>O Ministério do Comércio foi um antigo departamento do Governo da República Portuguesa. Sucedeu, na maior parte das atribuições, ao Ministério do Fomento, que havia sido criado com a implantação da República Portuguesa, em subsituição do antigo Ministério das Obras Públicas, Comércio e Indústria.</span></p>
<p><span>Apesar da nova designação do ministério dar ênfase à sua função de regulação do comércio (incluindo a formação que era dada nas escolas comerciais e nas escolas técnicas), o departamento manteve as responsabilidades pelas áreas da indústria, das obras públicas e das comunicações. Já o setor da agricultura, do anterior Ministério do Fomento, passou para a tutela do Ministério do Trabalho e Previdência Social.</span></p>
<p><span>A partir de 1919, o departamento passou a designar-se "Ministério do Comércio e Comunicações". Em 1932, o ministério foi extinto, sendo as suas responsabilidades repartidas pelos, então criados, Ministério do Comércio, Indústria e Agricultura e Ministério das Obras Públicas e Comunicações.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1917-11-05',
                    'dissolucao' => '1917-12-10',
                ],
            ],
            [
                'nome' => 'Ministério do Comércio e Comunicações',
                'sigla' => 'MCC',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1919 e 1932, substituiu o Ministério do Comércio.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1919-05-09',
                    'dissolucao' => '1932-07-05',
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura',
                'sigla' => 'MA',
                'sinopse' => '<p><span>Ministério da Agricultura foi criado em 1918, na sequência do golpe republicano de 5 de outubro de 1910. Deste então tem sido (des)activado conforme o Governo.</span></p>
<p><span>Periodos de tempo a destacar:</span></p>
<ul>
<li>1918 – 1932: Desde XV Governo Republicano até VII Governo Militar</li>
<li>1933-1940: I Governo do Estado Novo dissolvido no II Governo</li>
<li>1984 – 1985;1991 – 1995;2019 – 2024: IX, XII, XXII e XXIII Governos Constitucionais</li></ul>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1918-03-09',
                    'dissolucao' => '2024-04-02',
                ],
            ],
            [
                'nome' => 'Ministério das Subsistências e Transportes',
                'sigla' => 'MST',
                'sinopse' => '<p><span>O Ministério das Subsistências e Transportes (1918 - 1932) foi um departamento do Governo da República Portuguesa, existente entre 1918 e 1932. O ministério foi criado pelo Decreto nº 3902 de 9 de março de 1918, durante a vingência do governo de Sidónio Pais, herdando funções, até aí, atribuídas ao Ministério do Comércio e ao Ministério do Trabalho e Previdência Social. Durante o período de regime sidonista, o uso do termo "ministério" foi preterido em detrimento do termo "secretaria de Estado", sendo, consequentemente, o departamento referido como Secretaria de Estado das Subsistências e Transportes.</span></p>
<p><span>O departamento foi criado com o objetivo de responder à dificuldade de abastecimentos a Portugal e à, consequente, falta de géneros alimentares, provocadas pela Primeira Guerra Mundial. O Ministério das Subsistências e Transportes deveria fomentar o aumento da produção nacional e travar a especulação sobre os bens económicos de primeira necessidade.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1918-03-09',
                    'dissolucao' => '1918-07-15',
                ],
            ],
            [
                'nome' => 'Ministério dos Abastecimentos',
                'sigla' => 'MA',
                'sinopse' => '<p><span>Esta é uma lista de ministros detentores da pasta das Subsistências ou dos Abastecimentos em Portugal, entre a criação do Ministério das Subsistências e Transportes a 9 de março de 1918 e a extinção do Ministério dos Abastecimentos a 17 de setembro de 1919. Para os detentores da pasta dos Transportes, veja-se a lista de ministros dos Transportes de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1918-10-09',
                    'dissolucao' => '1919-09-17',
                ],
            ],
            [
                'nome' => 'Ministério do Comércio, Indústria e Agricultura',
                'sigla' => 'MCIA',
                'sinopse' => '<p><span>Ministério histórico de Portugal, ativo entre 1932 e 1933. O comparável em tempos modernos seria o Ministério da Economia, da Inovação e do Desenvolvimento (MEID).</span></p>
                <p><span>1932 - Criação do Ministério do Comércio, Indústria e Agricultura a partir da fusão dos ministérios do Comércio e Comunicações e da Agricultura.</span></p>
<p><span>1933 - Criação do Ministério do Comércio e Indústria e do Ministério da Agricultura a partir da divisão do anterior Ministério do Comércio, Indústria e Agricultura.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1932-07-05',
                    'dissolucao' => '1933-07-24',
                ],
            ],
            [
                'nome' => 'Ministério das Obras Públicas e Comunicações',
                'sigla' => 'MOPC',
                'sinopse' => '<p><span>Ministério histórico de Portugal, comparável em tempos modernos seria o Ministério das Obras Públicas, Transportes e Comunicações (MOPTC).</span></p>
                <p><span>1932 - Os setores das obras públicas, transportes terrestres, transportes aéreos e comunicações autonomizam-se, passando para a responsabilidade do novo Ministério das Obras Públicas e Comunicações (MOPC)</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1932-07-05',
                    'dissolucao' => '1968-09-27',
                ],
            ],
            [
                'nome' => 'Ministério do Trabalho e Previdência Social',
                'sigla' => 'MTPS',
                'sinopse' => '<p><span>O Ministério do Trabalho e Previdência Social foi um departamento do Governo da República Portuguesa criado pela Lei n.º 494, de 16 de março de 1916, para conduzir as políticas relativas às chamadas "áreas sociais". No contexto de então, abrangia os serviços governamentais nas áreas do trabalho, da previdência social e subsistências, e os de comunicações com exclusão da viação ordinária.</span></p>
<p><span>A estrutura orgânica do Ministério do Trabalho e Previdência Social foi aprovada pelo Decreto n.º 2354, de abril de 1916. Após alterações orgânicas em 1917, 1918, 1919, 1922, 1924 e 1925, o Ministério do Trabalho e Previdência Social foi extinto pelo Decreto n.º 11267, de 25 de novembro de 1925, sendo os seus organismos e serviços dispersos por diversos ministérios.</span></p>
<p><span>Um departamento governativo especializado nesta área apenas voltaria a surgir em 1933, quando pelo Decreto n.º 22428, de 10 de abril, foi criado o lugar de Subsecretário de Estado das Corporações e Previdência Social, a funcionar integrado na Presidência do Conselho de Ministros.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1916-03-17',
                    'dissolucao' => '1917-11-05',
                ],
            ],
            [
                'nome' => 'Ministério do Trabalho',
                'sigla' => 'MT',
                'sinopse' => '<p><span>O Ministério do Trabalho era um antigo departamento do Governo de Portugal, responsável pelas áreas do emprego, formação profissional e condições de trabalho.</span></p>
                <p><span>desde a criação do Ministério do Trabalho e Previdência Social a 17 de março de 1916 até aos dias de hoje e à integração da pasta no Ministério da Solidariedade, Emprego e Segurança Social. A lista cobre a Primeira República (1910–1926), o período ditatorial da Ditadura Militar, Ditadura Nacional e Estado Novo (1926–1974) e o atual período democrático (1974–presente).</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1917-11-05',
                    'dissolucao' => '1925-11-27',
                ],
            ],
            [
                'nome' => 'Ministério do Ultramar',
                'sigla' => 'MU',
                'sinopse' => '<p><span>O Ministério do Ultramar foi o departamento do Governo de Portugal responsável pela administração civil dos territórios ultramarinos sob domínio colonial português. Até 1951, era chamado "Ministério das Colónias" e, em 1974 passou a designar-se "Ministério da Coordenação Interterritorial".</span></p>
<p><span>As origens do Ministério do Ultramar estão na Secretaria de Estado dos Negócios da Marinha e Domínios Ultramarinos, criada no século XVIII. A secretaria de estado, passou a ser conhecida por Ministério da Marinha e Ultramar nos finais do século XIX, e, em 1910 passou a chamar-se Ministério da Marinha e Colónias.</span></p>
<p><span>Em 23 de Agosto de 1911, os assuntos da Marinha são finalmente separados dos assuntos ultramarinos, sendo criado o Ministério das Colónias separado do da Marinha.</span></p>
<p><span>Em 1951, na sequência da revisão constitucional que transforma as colónias portuguesas em províncias ultramarinas, o departamento passa a designar-se Ministério do Ultramar.</span></p>
<p><span>Depois do golpe de 25 de Abril de 1974 o ministério muda de denominação para Ministério da Coordenação Interterritorial agora com a missão principal de conduzir o processo de independência dos territórios ultramarinos.</span></p>
<p><span>Em 7 de Agosto de 1975, na sequência do fim dos territórios ultramarinos portugueses, na vigência do V Governo Provisório, o ministério é transformado na Secretaria de Estado da Descolonização, diretamente dependente do primeiro-ministro de Portugal. Pouco depois, já no âmbito do VI Governo Provisório o departamento ainda volta a ter estatuto de ministério, ao ser criado o Ministério da Cooperação, por sua vez englobando a Secretaria de Estado da Descolonização. O departamento só é definitivamente extinto ao entrar em funções o I Governo Constitucional em 10 de Setembro de 1976.</span></p>
<p><span>Com este governo foi transformado no Instituto para a Cooperação Económica, na dependência do Ministério das Finanças e do Ministério dos Negócios Estrangeiros.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1950-08-02',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério das Finanças e da Coordenação Económica',
                'sigla' => 'MFCE',
                'sinopse' => '<p><span>O Ministério das Finanças e da Coordenação Económica foi temporariamente substituto do Ministério das Finanças em 1974.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-03-15',
                    'dissolucao' => '1974-05-16',
                ],
            ],
            [
                'nome' => 'Ministério do Exército',
                'sigla' => 'ME',
                'sinopse' => '<p><span>Em 1950, o Ministério da Guerra mudou a sua denominação para "Ministério do Exército", passando parte das suas antigas funções — sobretudo ao nível operacional — para a responsabilidade do então criado Departamento da Defesa Nacional.</span></p>
<p><span>A partir do golpe de 25 de Abril de 1974, o ME foi extinto, passando o Chefe do Estado-Maior do Exército (CEME) a ter um estatuto equivalente ao de ministro, assumindo as antigas funções atribuídas ao anterior ministro do Exército.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1950-08-02',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério da Defesa Nacional',
                'sigla' => 'MDN',
                'sinopse' => '<p><span>O Ministério da Defesa Nacional (MDN) é o departamento do Governo de Portugal, responsável pela administração central portuguesa ao qual incumbe preparar e executar a política de defesa nacional, no âmbito das competências que lhe são conferidas, bem como assegurar e fiscalizar a administração das Forças Armadas e dos demais órgãos, serviços e organismos nele integrados.</span></p>
<p><span>Os planos para a constituição de um ministério da Defesa, com responsabilidade sobre todos os assuntos militares da Nação, até aí divididos por vários ministérios setoriais, vêm, pelo menos, já desde o princípio da década de 1930. Pouco antes da Segunda Guerra Mundial foi proposta a fusão do Ministério da Guerra e do Ministério da Marinha, num Ministério da Defesa unificado, que integraria os subsecretariados de Estado da Marinha, da Guerra (Exército) e do Ar (Aeronáutica). No entanto, esse plano teve sempre a oposição do Exército e da Marinha, que desejavam manter a sua autonomia, com ministérios próprios, separados.</span></p>
<p><span>Em 1950, fruto das lições da Segunda Guerra Mundial e da criação da NATO, onde Portugal entrou como membro fundador, foram finalmente ultrapassadas parte das objeções a um comando unificado da defesa e das forças armadas. Foi criado o cargo de Chefe do Estado-Maior General das Forças Armadas e o cargo de ministro da Defesa Nacional. De notar que, para ultrapassar as objeções do Exército e da Marinha, não foi criado um Ministério da Defesa, mas apenas um cargo de ministro da Defesa, mantendo-se a existência dos ministérios do Exército e da Marinha como departamentos separados.</span></p>
<p><span>O ministro da Defesa Nacional não tinha, portanto, um ministério próprio, fazendo parte da estrutura da Presidência do Conselho de Ministros, tutelando diretamente o Chefe de Estado-Maior General das Forças Armadas, o Secretariado-Geral da Defesa Nacional e o Subsecretariado de Estado da Aeronáutica, e exercendo uma acção de coordenação em relação aos ministros do Exército e da Marinha. O conjunto dos organismos sob tutela direta do ministro da Defesa Nacional constituíam o Departamento da Defesa Nacional. O ministro da Defesa Nacional era responsável pelo orçamento global e a condução operacional das Forças Armadas, ficando os assuntos administrativos e logísticos a cargo dos ministérios setoriais.</span></p>
<p><span>Foi basicamente com esta organização que foi dirigida a Guerra do Ultramar, entre 1961 e 1974. As alterações sofridas foram a passagem do Subsecretariado de Estado ao estatuto de Secretaria de Estado da Aeronáutica em 1961. A reestruturação de 1969 previu a transformação do Secretariado-Geral da Defesa Nacional no Estado-Maior General das Forças Armadas, o que só veio a acontecer em 1974.</span></p>
<p><span>Em 25 de abril de 1974, deu-se um golpe militar que derrubou o governo de Marcelo Caetano e pôs fim à Guerra do Ultramar. Na sequência deste golpe, as Forças Armadas assumiram a tutela do novo regime democrático instalado, tornando-se independentes do poder civil. Como tal, foi estabelecido o Conselho da Revolução presidido pelo Presidente da República (um militar) e composto apenas por militares, que assumiu a responsabilidade sobre todos os assuntos das forças armadas. Nesta organização o Chefe de Estado Maior das Forças Armadas tinha um estatuto equivalente ao do primeiro-ministro e os chefes dos estados-maiores dos ramos, assumiram a função dos anteriores ministros militares.</span></p>
<p><span>Foi então criado o Ministério da Defesa Nacional, chefiado pelo ministro da Defesa Nacional. O ministro da Defesa deixou contudo de ter qualquer tutela sobre as Forças Armadas, servindo apenas como elemento de ligação entre o Governo (poder civil) e aquelas, sobretudo no que dizia respeito à política de defesa e aos assuntos orçamentais.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1950-08-02',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério do Comércio e Indústria',
                'sigla' => 'MCI',
                'sinopse' => '<p><span>1933 - Criação do Ministério do Comércio e Indústria e do Ministério da Agricultura a partir da divisão do anterior Ministério do Comércio, Indústria e Agricultura; 1940 - Criação do Ministério da Economia a partir da fusão dos ministérios do Comércio e Indústria e da Agricultura;</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1933-07-24',
                    'dissolucao' => '1940-08-28',
                ],
            ],
            [
                'nome' => 'Ministério da Economia',
                'sigla' => 'ME',
                'sinopse' => '<p><span>O Ministério da Economia (ME) é o departamento do Governo de Portugal - extinto e reestabelecido por diversas vezes - responsável pela tutela e execução das políticas públicas respeitantes às atividades económicas, especialmente no que diz respeito aos setores do comércio, turismo, serviços, indústria.</span></p>
<p><span>Nos seus diversos ressurgimentos, o departamento teve várias designações como "Ministério da Economia e Inovação" e "Ministério da Economia, Inovação e Desenvolvimento".</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1968-09-27',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura e Comércio',
                'sigla' => 'MAC',
                'sinopse' => '<p><span>1974 (março) - A 15 de março, é publicado um decreto-lei que cria o Ministério da Agricultura e Comércio e o Ministério da Indústria e Energia por subdivisão do Ministério da Economia. Em virtude da revolução ocorrida no mês seguinte, este decreto-lei tem poucos efeitos práticos.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-03-15',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério da Indústria e Energia',
                'sigla' => 'MIE',
                'sinopse' => '<p><span>1974 (março) - A 15 de março, é publicado um decreto-lei que cria o Ministério da Agricultura e Comércio e o Ministério da Indústria e Energia por subdivisão do Ministério da Economia. Em virtude da revolução ocorrida no mês seguinte, este decreto-lei tem poucos efeitos práticos.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-03-15',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério das Obras Públicas',
                'sigla' => 'MOP',
                'sinopse' => '<p><span>Ministério histórico de Portugal, seria reconhecido como Ministério das Infraestruturas.</span></p>
                <p><span>1932 - Os setores das obras públicas, transportes terrestres, transportes aéreos e comunicações autonomizam-se, passando para a responsabilidade do novo Ministério das Obras Públicas e Comunicações (MOPC); 1946 - O MOPC divide-se em dois: o Ministério das Obras Públicas - responsável pelas obras públicas - e o Ministério das Comunicações - responsável pelos transportes terrestres, transportes aéreos e comunicações;</span></p>
                <p><span>Em 1975 o Ministério das Obras Públicas foi restaurado. Em 1978 absorveu as funções do, então extinto, Ministério da Habitação, Urbanismo e Construção, passando a denominar-se "Ministério da Habitação e Obras Públicas"</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1968-09-27',
                    'dissolucao' => '1978-04-25',
                ],
            ],
            [
                'nome' => 'Ministério das Comunicações',
                'sigla' => 'MC',
                'sinopse' => '<p><span>O Ministério das Comunicações era um antigo departamento do Governo de Portugal responsável pela política executiva nas áreas dos transportes terrestres, transportes aéreos, portos e comunicações.</span></p>
<p><span>O ministério foi criado pelo Decreto-Lei n.º 36 061 de 27 de dezembro de 1946, a partir da autonomização do Subsecretariado de Estado das Comunicações do Ministério das Obras Públicas e Comunicações, absorvendo também alguns serviços que estavam dependentes da Presidência do Conselho de Ministros.</span></p>
<p><span>Em 1974, foi substituído pela Secretaria de Estado dos Transportes e Comunicações, integrada no novo Ministério do Equipamento Social e do Ambiente. Em 1975, os transportes e comunicações foram novamente autonomizados, sendo o ministério recriado com a denominação de Ministério dos Transportes e Comunicações. Os transportes e comunicações voltaram a juntar-se às obras públicas em 1981, o que se mantém, desde então.</span></p>
<p><span>A maioria das funções e responsabilidades dos antigos Ministérios das Comunicações e dos Transportes e Comunicações estão, actualmente, atribuídas a Secretaria de Estado das Infraestrututas, dos Transportes e das Comunicações do Ministério da Economia e também no Ministério da Agricultura e do Mar e no Ministério do Ambiente, Ordenamento do Território e Energia.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1968-09-27',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério da Educação Nacional',
                'sigla' => 'MEN',
                'sinopse' => '<p><span>O Ministério da Educação Nacional (MEN) era um antigo departamento do Governo de Portugal, responsável pela educação e formação de cidadãos, desde a educação pré-escolar até ao ensino superior.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1936-04-11',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério das Corporações e Previdência Social',
                'sigla' => 'MCP',
                'sinopse' => '<p><span>O Ministério das Corporações e Previdência Social foi um antigo departamento do Governo de Portugal, responsável pela administração das corporações e pela previdência social.</span></p>
                <p><span>Desde a criação do Ministério das Corporações e Previdência Social a 17 de março de 1916 até aos dias de hoje e à integração da pasta no Ministério da Solidariedade, Emprego e Segurança Social.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1950-08-02',
                    'dissolucao' => '1973-11-07',
                ],
            ],
            [
                'nome' => 'Ministério das Corporações e Segurança Social',
                'sigla' => 'MCSS',
                'sinopse' => '<p><span>O Ministério das Corporações e Previdência Social foi um antigo departamento do Governo de Portugal, responsável pela administração das corporações e pela previdência social.</span></p>
                <p><span>Desde a criação do Ministério das Corporações e Previdência Social a 17 de março de 1916 até aos dias de hoje e à integração da pasta no Ministério da Solidariedade, Emprego e Segurança Social.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1973-11-07',
                    'dissolucao' => '1974-04-25',
                ],
            ],
            [
                'nome' => 'Ministério da Saúde e Assistência',
                'sigla' => 'MSA',
                'sinopse' => '<p><span>O Ministério da Saúde e Assistência foi um antigo departamento do Governo de Portugal, responsável pela saúde e assistência social.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1958-08-14',
                    'dissolucao' => '1973-11-07',
                ],
            ],
            [
                'nome' => 'Ministério da Saúde',
                'sigla' => 'MS',
                'sinopse' => '<p><span>O Ministério da Saúde (MS) é o departamento do Governo de Portugal, responsável por definir e conduzir a política nacional de saúde, garantindo uma aplicação e utilização sustentáveis de recursos e a avaliação dos seus resultados.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1973-11-07',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Administração Interna',
                'sigla' => 'MAI',
                'sinopse' => '<p><span>O Ministério da Administração Interna (MAI) é o departamento do Governo de Portugal, responsável pela execução das políticas de segurança pública, de proteção e socorro, de imigração e asilo, de prevenção e segurança rodoviária e pela administração dos assuntos eleitorais. Criado em 1736, como Secretaria de Estado dos Negócios Interiores do Reino é o ministério português mais antigo continuamente em existência. No século XIX, passou a ser conhecido por Ministério do Reino e após a implantação da república em 1910 teve a sua designação oficial alterada para Ministério do Interior que manteve até 1974.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1974-04-25',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura, Comércio e Pescas',
                'sigla' => 'MACP',
                'sinopse' => '<p><span>O Ministério da Agricultura, Comércio e Pescas foi a designação de um departamento do VIII Governo Constitucional. Sucedeu ao Ministério da Agricultura e Pescas, em 1981, e foi predecedeu, até 1983, ao Ministério da Agricultura, Florestas e Alimentação. Teve como único ministro Basílio Horta.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-04-02',
                    'dissolucao' => '1983-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura, do Desenvolvimento Rural e das Pescas',
                'sigla' => 'MACP',
                'sinopse' => '<p><span>O Ministério da Agricultura, do Desenvolvimento Rural e das Pescas foi a designação de um departamento dos XIII, XIV, XV, XVII e XVIII Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1995-10-08',
                    'dissolucao' => '2011-06-20',
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura, Florestas e Alimentação',
                'sigla' => 'MAFA',
                'sinopse' => '<p><span>O Ministério da Agricultura, Florestas e Alimentação foi a designação de um departamento do IX Governo Constitucional, de junho de 1983 a outubro de 1984. O único titular deste ministério foi Manuel Soares Costa.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1983-06-01',
                    'dissolucao' => '1984-10-01',
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura, Florestas e Desenvolvimento Rural',
                'sigla' => 'MAFDR',
                'sinopse' => '<p><span>O Ministério da Agricultura, Florestas e Desenvolvimento Rural (MAFDR) foi um departamento do Governo de Portugal. Resulta da divisão do anterior Ministério da Agricultura e do Mar. No XXI Governo, o ministro titular da pasta é Luís Capoulas Santos.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2015-11-26',
                    'dissolucao' => '2019-10-26',
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura e do Mar',
                'sigla' => 'MAM',
                'sinopse' => '<p><span>O Ministério da Agricultura e do Mar é um departamento do Governo de Portugal, responsável pela gestão dos assuntos respeitantes à agricultura e ao mar. Resultou, em 2013, do desmantelamento do Ministério da Agricultura, do Mar, do Ambiente e do Ordenamento do Território. Foi composto pela Ministra Assunção Cristas, que era coadjuvada por 3 Secretários de Estado.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2013-11-26',
                    'dissolucao' => '2015-11-26',
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura, do Mar, do Ambiente e do Ordenamento do Território',
                'sigla' => 'MAMAOT',
                'sinopse' => '<p><span>O Ministério da Agricultura, do Mar, do Ambiente e do Ordenamento do Território (MAMAOT) foi o departamento do Governo de Portugal que tinha por missão a definição, coordenação e execução das políticas agrícolas, agro-alimentar, silvícola, de desenvolvimento rural, de exploração e potenciação dos recursos do mar, de ambiente e de ordenamento do território.</span></p>
<p><span>O MAMAOT foi criado no âmbito do objetivo do XIX Governo Constitucional de implementar uma política de redução do número de departamentos governamentais, resultando da fusão dos anteriores ministérios da Agricultura, do Desenvolvimento Rural e das Pescas e do Ambiente e do Ordenamento do Território. O MAMAOT passou também a partilhar as competências atribuídas a outros ministérios (Transportes, Defesa, Negócios Estrangeiros, Educação) em todos os assuntos relacionados com o Mar e com os recursos hídricos.</span></p>
<p><span>Acabou por ser desmantelado em 2013, com as suas competências a serem novamente divididas pelo Ministério da Agricultura e do Mar e pelo Ministério do Ambiente, Ordenamento do Território e Energia.</span></p>',
                'extinta' => true,
            ],
            [
                'nome' => 'Ministério da Agricultura e Pescas',
                'sigla' => 'MAP',
                'sinopse' => '<p><span>O Ministério da Agricultura e Pescas (MAP) é o departamento do Governo de Portugal, responsável pela execução das políticas públicas e pela tutela dos assuntos respeitantes à agricultura e atividades associadas como a silvicultura, a pecuária, a alimentação, o desenvolvimento rural e a pesca. Este ministério foi a designação de um departamento dos IV, V e VI Governos Provisórios e I, II, III, IV, V, VI e VII, XXIV (Atual) Governos Constitucionais de Portugal.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1975-03-26',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura, Pescas e Alimentação',
                'sigla' => 'MAPA',
                'sinopse' => '<p><span>O Ministério da Agricultura, Pescas e Alimentação foi a designação de um departamento dos X e XI Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1985-11-06',
                    'dissolucao' => '1991-10-31',
                ],
            ],
            [
                'nome' => 'Ministério da Agricultura, Pescas e Florestas',
                'sigla' => 'MAPF',
                'sinopse' => '<p><span>O Ministério da Agricultura, Pescas e Florestas foi a designação de um departamento do XVI Governo Constitucional de Portugal, liderado por Santana Lopes. Foi antecedido e sucedido pelo Ministério da Agricultura, do Desenvolvimento Rural e das Pescas. O seu único ministro foi Carlos Costa Neves.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2004-07-17',
                    'dissolucao' => '2005-03-12',
                ],
            ],
            [
                'nome' => 'Ministério do Ambiente',
                'sigla' => 'MA',
                'sinopse' => '<p><span>O antigo Ministério do Ambiente seria o actual Ministério do Ambiente e da Energia (MAE).</span></p>',
                'extinta' => true,
                'datas' => [
                    'fundacao' => '1995-10-28',
                    'dissolucao' => '2018-10-15',
                ],

            ],
            [
                'nome' => 'Ministério do Ambiente e do Ordenamento do Território',
                'sigla' => 'MAOT',
                'sinopse' => '<p><span>O antigo Ministério do Ambiente e do Ordenamento do Território seria o actual Ministério do Ambiente e da Energia (MAE). O ministério de José Socrates.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-10-25',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério do Ambiente, do Ordenamento do Território e do Desenvolvimento Regional',
                'sigla' => 'MAOTDR',
                'sinopse' => '<p><span>O antigo Ministério do Ambiente, do Ordenamento do Território e do Desenvolvimento Regional seria o actual Ministério do Ambiente e da Energia (MAE).</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2005-03-12',
                    'dissolucao' => '2009-10-26',
                ],
            ],
            [
                'nome' => 'Ministério do Ambiente, Ordenamento do Território e Energia',
                'sigla' => 'MAOTE',
                'sinopse' => '<p><span>O Ministério do Ambiente, Ordenamento do Território e Energia foi um departamento do Governo de Portugal, responsável pela gestão dos assuntos respeitantes ao meio ambiente, ordenamento do território e energia. Resultou, em 2013, do desmantelamento do Ministério da Agricultura, do Mar, do Ambiente e do Ordenamento do Território. Era liderado pelo Ministro Jorge Moreira da Silva e compreende 4 Secretários de Estado.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2013-10-26',
                    'dissolucao' => '2015-11-26',
                ],
            ],
            [
                'nome' => 'Ministério do Ambiente e da Ação Climática',
                'sigla' => 'MAAC',
                'sinopse' => '<p><span>O antigo Ministério do Ambiente e da Ação Climática seria o actual Ministério do Ambiente e da Energia (MAE).</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2015-11-26',
                    'dissolucao' => '2024-04-02',
                ],
            ],
            [
                'nome' => 'Ministério do Ambiente e da Energia',
                'sigla' => 'MAE',
                'sinopse' => '<p><span>O Ministério do Ambiente e da Energia (MAE) é o departamento do Governo de Portugal responsável pelas questões ambientais e energéticas.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1995-10-28',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério do Ambiente e Recursos Naturais',
                'sigla' => 'MARN',
                'sinopse' => '<p><span>O antigo Ministério do Ambiente e Recursos Naturais seria o actual Ministério do Ambiente e da Energia (MAE).</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1990-08-17',
                    'dissolucao' => '1995-10-25',
                ],
            ],
            [
                'nome' => 'Ministério do Ambiente e da Transição Energética',
                'sigla' => 'MATE',
                'sinopse' => '<p><span>O Ministério do Ambiente e da Transição Energética (MATE) foi a designação do antigo departamento do governo português responsável pelas questões ambientais e energéticas.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2018-10-15',
                    'dissolucao' => '2024-04-02',
                ],
            ],
            [
                'nome' => 'Ministério dos Assuntos Sociais',
                'sigla' => 'MAS',
                'sinopse' => '<p><span>O Ministério dos Assuntos Sociais foi um antigo departamento do Governo de Portugal, responsável pela coordenação da política pública nas áreas da Saúde e Segurança Social.</span></p>
<p><span>O ministério foi criado a seguir ao 25 de Abril de 1974, assumindo as funções do antigo Ministério da Saúde e, do sector da Segurança Social, do antigo Ministério das Corporações e Segurança Social.</span></p>
<p><span>O Ministério dos Assuntos Sociais foi extinto em 1983. Nessa altura a sua responsabilidade na área da Saúde passou para o novo Ministério da Saúde. A maioria das suas restantes responsabilidades passou para o novo Ministério do Trabalho e Segurança Social, actualmente denominado Ministério do Trabalho, Solidariedade e Segurança Social.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-04-25',
                    'dissolucao' => '1983-04-25',
                ],
            ],
            [
                'nome' => 'Ministério das Atividades Económicas e do Trabalho',
                'sigla' => 'MAET',
                'sinopse' => '<p><span>O Ministério das Atividades Económicas e do Trabalho (AO 1945: Ministério das Actividades Económicas e do Trabalho) foi um efémero departamento do Governo da República Portuguesa, existente apenas durante a vingência do XVI Governo Constitucional, entre 2004 e 2005.</span></p>
<p><span>O ministério concentrou, num único departamento, duas áreas que, tradicionalmente, sempre foram geridas por departamentos governamentais separados: as atividades económicas e o emprego. O objetivo desta junção era a de adequar melhor a política de emprego e formação profissional à área económica, ao mesmo tempo, criando maior empregabilidade para as pessoas e melhor suprindo as necessidades em recursos humanos das actividades económicas.</span></p>
<p><span>O Ministério das Atividades Económicas e do Trabalho foi extinto em 2004, sendo as suas funções novamente divididas por dois departamentos: o Ministério da Economia e da Inovação e o Ministério do Trabalho e da Solidariedade Social. Atualmente (XIX Governo Constitucional) a área económica encontra-se no Ministério da Economia e área do trabalho encontra-se no Ministério da Solidariedade, Emprego e Segurança Social.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2004-07-17',
                    'dissolucao' => '2005-03-12',
                ],
            ],
            [
                'nome' => 'Ministério das Cidades, Administração Local, Habitação e Desenvolvimento Regional',
                'sigla' => 'MCALHDR',
                'sinopse' => '<p><span>O Ministério das Cidades, Administração Local, Habitação e Desenvolvimento regional foi um efémero departamento do Governo de Portugal, responsável pela política executiva nas áreas do Desenvolvimento regional, da Habitação e Urbanismo e da Administração Local. O ministério apenas existiu entre 2002 e 2004, reunindo funções que anteriormente se encontravam divididas por outros departamentos governamentais.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2002-04-06',
                    'dissolucao' => '2004-07-17',
                ],
            ],
            [
                'nome' => 'Ministério das Cidades, Ordenamento do Território e Ambiente',
                'sigla' => 'MCOTA',
                'sinopse' => '<p><span>O Ministério das Cidades, Ordenamento do Território e Ambiente foi um efémero departamento do Governo de Portugal, responsável pela política executiva nas áreas do Desenvolvimento regional, da Habitação e Urbanismo e da Administração Local. O ministério apenas existiu entre 2002 e 2004, reunindo funções que anteriormente se encontravam divididas por outros departamentos governamentais</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2002-04-06',
                    'dissolucao' => '2004-07-17',
                ],
            ],
            [
                'nome' => 'Ministério da Ciência e do Ensino Superior',
                'sigla' => 'MCES',
                'sinopse' => '<p><span>O Ministério da Ciência e do Ensino Superior foi um antigo departamento do Governo de Portugal, responsável pela política executiva nas áreas da Ciência e do Ensino Superior.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2002-04-06',
                    'dissolucao' => '2004-07-17',
                ],
            ],
            [
                'nome' => 'Ministério da Ciência, Inovação e Ensino Superior',
                'sigla' => 'MCIES',
                'sinopse' => '<p><span>O Ministério da Ciência, Inovação e Ensino Superior foi um efémero departamento do Governo de Portugal, responsável pela política executiva nas áreas da Ciência, da Inovação e do Ensino Superior.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2004-07-17',
                    'dissolucao' => '2005-03-12',
                ],
            ],
            [
                'nome' => 'Ministério da Ciência e Tecnologia',
                'sigla' => 'MCT',
                'sinopse' => '<p><span>O Ministério da Ciência e Tecnologia foi um antigo departamento do Governo de Portugal, responsável pela política executiva nas áreas da Ciência e da Tecnologia.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1995-10-28',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério da Ciência, Tecnologia e Ensino Superior',
                'sigla' => 'MCTES',
                'sinopse' => '<p><span>O Ministério da Ciência, Tecnologia e Ensino Superior (MCTES) foi o departamento governativo de Portugal responsável pela Ciência, Tecnologia e Ensino Superior.</span></p>
<p><span>O MCTES tem origem no Ministério da Ciência e Tecnologia, criado em 1995. Em 2002, passou a tutelar o ensino superior - até aí tutelado pelo Ministério da Educação, tutela esta que passou novamente para o Ministério da Educação em 2011 - passando a designar-se "Ministério da Ciência e Ensino Superior". Depois disso, apesar ter mantido as mesmas competências, mudou várias vezes de designação - acompanhando as mudanças de titulares - passando a "Ministério da Ciência, Inovação e Ensino Superior" em 2004 e "Ministério da Ciência, Tecnologia e Ensino Superior" em 2005.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1995-10-28',
                    'dissolucao' => '2011-03-12',
                ],
            ],
            [
                'nome' => 'Ministério da Coesão Territorial',
                'sigla' => 'MCT',
                'sinopse' => '<p><span>O Ministério da Coesão Territorial (MCT) é o departamento do Governo de Portugal, responsável pela tutela e execução das políticas públicas respeitantes à gestão territorial.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2019-10-26',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério do Comércio Externo',
                'sigla' => 'MCE',
                'sinopse' => '<p><span>O Ministério do Comércio Externo foi a designação de um departamento dos IV, V e VI Governos Provisórios de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-03-26',
                    'dissolucao' => '1976-07-23',
                ],
            ],
            [
                'nome' => 'Ministério do Comércio Interno',
                'sigla' => 'MCI',
                'sinopse' => '<p><span>O Ministério do Comércio Interno foi a designação de um departamento dos V e VI Governos Provisórios de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-08-08',
                    'dissolucao' => '1976-07-23',
                ],
            ],
            [
                'nome' => 'Ministério do Comércio e Turismo',
                'sigla' => 'MCT',
                'sinopse' => '<p><span>O Ministério do Comércio e Turismo foi um antigo departamento do Governo de Portugal, responsável pela política executiva nas áreas do comércio e do turismo.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1976-07-23',
                    'dissolucao' => '1995-10-25',
                ],
            ],
            [
                'nome' => 'Ministério da Comunicação Social',
                'sigla' => 'MCS',
                'sinopse' => '<p><span>O Ministério da Comunicação Social foi a designação de um departamento dos I, II, III, IV, V e VI Governos Provisórios e IV e V Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-04-25',
                    'dissolucao' => '1981-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Cooperação',
                'sigla' => 'MC',
                'sinopse' => '<p><span>O Ministério da Cooperação foi um departamento do VI Governo Provisório de Portugal, que existiu apenas entre 26 de setembro de 1975 e 23 de julho de 1976. O único ministro a titular a pasta foi Vítor Manuel Trigueiros Crespo.</span></p>
<p><span>O Ministério era responsável pelo processo de descolonização, incluindo o alojamento e transporte dos retornados a Portugal, e pelos assuntos ligados ao retorno dos emigrantes.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-09-26',
                    'dissolucao' => '1976-07-23',
                ],
            ],
            [
                'nome' => 'Ministério da Coordenação Económica',
                'sigla' => 'MCE',
                'sinopse' => '<p><span>O Ministério da Coordenação Económica foi um efémero departamento do I Governo Provisório de Portugal, criado a seguir ao 25 de Abril de 1974, reunindo as funções do Ministério das Finanças e do Ministério da Economia.</span></p>
<p><span>O ministério apenas existiu durante um breve período, de 16 de maio a 17 de julho de 1974, sendo novamente dividido em dois. O único ministro a titular a pasta foi Vasco Vieira de Almeida.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-05-16',
                    'dissolucao' => '1974-07-17',
                ],
            ],
            [
                'nome' => 'Ministério da Coordenação Económica e do Plano',
                'sigla' => 'MCEP',
                'sinopse' => '<p><span>O Ministério da Coordenação Económica e do Plano foi um departamento do V Governo Constitucional de Portugal, entre 1 de agosto de 1979 e 3 de janeiro de 1980. O único titular do ministério foi Carlos Corrêa Gago.</span></p>
<p><span>Outros ministérios com denominações semelhantes foram o Ministério do Planeamento e Coordenação Económica, em 1975, e o Ministério do Plano e Coordenação Económica, entre 1976 e 1978.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-08-01',
                    'dissolucao' => '1980-01-03',
                ],
            ],
            [
                'nome' => 'Ministério da Coordenação Interterritorial',
                'sigla' => 'MCI',
                'sinopse' => '<p><span>O Ministério da Coordenação Interterritorial foi a designação de um departamento dos I, II, III e IV Governos Provisórios de Portugal. Foi o sucessor do Ministério do Ultramar, que por sua vez sucedeu ao Ministério das Colónias, ambos durante o Estado Novo.</span></p>
<p><span>O único titular do cargo de ministro da Coordenação Interterritorial foi, nos quatro governos provisórios em que este existiu, António de Almeida Santos.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-05-16',
                    'dissolucao' => '1975-08-08',
                ],
            ],
            [
                'nome' => 'Ministério da Cultura',
                'sigla' => 'MC',
                'sinopse' => '<p><span>O Ministério da Cultura (MC) é o departamento do Governo de Portugal, responsável pelo agrupamento dos serviços, organismos e estruturas sob a superintendência do ministro da Cultura. Este, por sua vez, constituía o membro do Governo no qual estavam delegadas as competências de definição e execução de políticas de desenvolvimento cultural, de incentivo à criação artística e à difusão e internacionalização da cultura e da língua portuguesa.</span></p>
<p><span>Com a tomada de posse do XIX Governo Constitucional, em 2011, todos os serviços do extinto Ministério da Cultura foram integrados na Presidência do Conselho de Ministros, onde eram tutelados pelo secretário de Estado da Cultura, Jorge Barreto Xavier, directamente dependente do primeiro-ministro. Em 2015, com o XX Governo Constitucional, o ministério foi restaurado, com a designação Ministério da Cultura, Igualdade e Cidadania. Com a tomada de posse do XXI Governo Constitucional, o departamento voltou ao nome original. A actual ministra da cultura é Dalila Rodrigues.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '1983-07-09',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Cultura e Ciência',
                'sigla' => 'MCC',
                'sinopse' => '<p><span>O Ministério da Cultura e Ciência foi uma departamento do Governo de Portugal, responsável pelos assuntos culturais e científicos. O ministério apenas existiu no V Governo Constitucional, durante um breve período, entre 1 de agosto de 1979 e 3 de janeiro de 1980. O seu único titular foi Adérito Sedas Nunes.</span></p>
<p><span>Entre 1981 e 1983, voltou a existir com a denominação idêntica de Ministério da Cultura e Coordenação Científica. A maioria das funções, daquele antigo ministério, estão hoje distribuídas pelo Ministério da Cultura e pelo Ministério da Ciência, Inovação e Ensino Superior.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1979-08-01',
                    'dissolucao' => '1980-01-03',
                ],
            ],
            [
                'nome' => 'Ministério da Cultura e Coordenação Científica',
                'sigla' => 'MCCC',
                'sinopse' => '<p><span>O Ministério da Cultura e Coordenação Científica foi uma departamento do VIII Governo Constitucional de Portugal, responsável pelos assuntos culturais e científicos. O ministério existiu apenas durante um breve período, entre 4 de setembro de 1981 e 9 de junho de 1983, e o seu único titular foi Francisco Lucas Pires.</span></p>
<p><span>A maioria das funções, daquele antigo ministério, estão hoje distribuídas pelo Ministério da Cultura e pelo Ministério da Ciência, Inovação e Ensino Superior.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-09-04',
                    'dissolucao' => '1983-06-09',
                ],
            ],
            [
                'nome' => 'Ministério da Cultura, Igualdade e Cidadania',
                'sigla' => 'MCIC',
                'sinopse' => '<p><span>O Ministério da Cultura, Igualdade e Cidadania foi a designação de um departamento do XX Governo Constitucional de Portugal. Na sua curta vida, o ministério teve apenas um titular, Teresa Morais. O ministério, assim como o XX Governo, não chegou a durar um mês, tendo sido substituído pelo Ministério da Cultura do XXI Governo. Foi instituído a 30 de outubro e extinto no dia 26 de novembro de 2015, com a tomada de posse do governo seguinte.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2015-10-30',
                    'dissolucao' => '2015-11-26',
                ],
            ],
            [
                'nome' => 'Ministério da Defesa Nacional e dos Assuntos do Mar',
                'sigla' => 'MDNAM',
                'sinopse' => '<p><span>O Ministério da Defesa Nacional e dos Assuntos do Mar foi a designação de um departamento do XVI Governo Constitucional de Portugal. O único ministro da Defesa Nacional e dos Assuntos do Mar foi Paulo Portas, de 17 de julho de 2004 a 12 de março de 2005.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2004-07-17',
                    'dissolucao' => '2005-03-12',
                ],
            ],
            [
                'nome' => 'Ministério da Economia e do Emprego',
                'sigla' => 'MEE',
                'sinopse' => '<p><span>O Ministério da Economia e do Emprego (MEE) foi o departamento do Governo de Portugal que tinha por missão a concepção, execução e avaliação das políticas de crescimento do emprego sustentável, competitividade, inovação, internacionalização e comércio externo, investimento estrangeiro, relações de trabalho, formação profissional, energia e geologia, turismo, defesa dos consumidores, obras públicas, transportes e comunicações.</span></p>
<p><span>O MEE foi criado no âmbito do objetivo, do XIX Governo Constitucional, de implementar uma política de redução do número de departamentos governamentais, resultando da fusão dos anteriores ministérios da Economia, Inovação e Desenvolvimento e das Obras Públicas Transportes e Comunicações, bem como da área de emprego e formação profissional do anterior Ministério do Trabalho e da Solidariedade Social.</span></p>
<p><span>Acabou por ser desmantelado em 2013, passando a pasta do Emprego para o novo Ministério da Solidariedade, Emprego e Segurança Social e a pasta da energia para o novo Ministério do Ambiente, Ordenamento do Território e Energia.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2011-03-12',
                    'dissolucao' => '2013-03-12',
                ],
            ],
            [
                'nome' => 'Ministério da Economia e da Inovação',
                'sigla' => 'MEI',
                'sinopse' => '<p><span>O Ministério da Economia e da Inovação foi a designação de um departamento do XVII Governo Constitucional de Portugal. No XVIII Governo Constitucional, passou a Ministério da Economia, da Inovação e do Desenvolvimento.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2005-03-12',
                    'dissolucao' => '2009-10-26',
                ],
            ],
            [
                'nome' => 'Ministério da Economia, da Inovação e do Desenvolvimento',
                'sigla' => 'MEID',
                'sinopse' => '<p><span>O Ministério da Economia, da Inovação e do Desenvolvimento (MEID) foi o departamento do Governo de Portugal, responsável pela gestão dos assuntos respeitantes à economia portuguesa, especialmente nos setores da indústria, energia, comércio, turismo e serviços. O único ministro da Economia, da Inovação e do Desenvolvimento foi José António Vieira da Silva no XVIII Governo Constitucional liderado por José Sócrates, de 26 de outubro de 2009 a 21 de junho de 2011.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2009-10-26',
                    'dissolucao' => '2011-03-12',
                ],
            ],
            [
                'nome' => 'Ministério da Economia e do Mar',
                'sigla' => 'MEM',
                'sinopse' => '<p><span>O Ministério da Economia e do Mar é um departamento do Governo de Portugal - responsável pela tutela e execução das políticas públicas respeitantes às atividades económicas, especialmente no que diz respeito aos setores do comércio, turismo, serviços, indústria e o Mar</span></p>.',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2022-03-30',
                    'dissolucao' => '2024-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Educação',
                'sigla' => 'ME',
                'sinopse' => '<p><span>O Ministério da Educação (ME) é o departamento do Governo de Portugal, responsável pela educação e formação de cidadãos, desde a educação pré-escolar até ao ensino superior.</span></p>
                <p><span>Entre 1870 e a actualidade, o departamento governamental responsável pela educação sofreu diversas alterações na sua denominação e âmbito:
<ul>
<li>Ministério dos Negócios da Instrução Pública (1870 — 1870)</li>
<li>Ministério do Reino (1870 — 1890)</li>
<li>Ministério da Instrução Pública e Belas Artes (1890 — 1892)</li>
<li>Ministério do Reino (1892 - 1910)</li>
<li>Ministério do Interior (1910 - 1913)</li>
<li>Ministério da Instrução Pública (1913 — 1936)</li>
<li>Ministério da Educação Nacional (1936 — 1974)</li>
<li>Ministério da Educação e Cultura (1974 — 1975)</li>
<li>Ministério da Educação e Investigação Científica (1975 — 1978)</li>
<li>Ministério da Educação e Cultura (1978 — 1978)</li>
<li>Ministério da Educação e Investigação Científica (1978 — 1979)</li>
<li>Ministério da Educação (1979 — 1980)</li>
<li>Ministério da Educação e Ciência (1980 — 1981)</li>
<li>Ministério da Educação e das Universidades (1981 — 1982)</li>
<li>Ministério da Educação (1982 — 1985)</li>
<li>Ministério da Educação e Cultura (1985 — 1987)</li>
<li>Ministério da Educação (1987 — 2011)</li>
<li>Ministério da Educação e Ciência (2011 — 2015 )</li>
<li>Ministério da Educação (2015 — 2024).</li>
<li>Ministério da Educação, Ciência e Inovação (2024 — )</li></ul></span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2015-11-26',
                    'dissolucao' => '2024-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Educação, Ciência e Inovação',
                'sigla' => 'MECI',
                'sinopse' => '<p><span>O Ministério da Educação, Ciência e Inovação (MECI) é o departamento do Governo de Portugal, responsável por definir, coordenar, executar e avaliar as políticas nacionais dirigidas à educação, com as políticas de qualificação profissional. No XXIV Governo, o ministério tomou o nome de Ministério da Educação, Ciência e Inovação, sob a tutela de Fernando Alexandre.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2024-04-02',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Educação e Ciência',
                'sigla' => 'MEC',
                'sinopse' => '<p><span>O Ministério da Educação e Ciência foi a designação de um departamento dos VI, VII, XIX e XX Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1980-01-03',
                    'dissolucao' => '2015-11-26',
                ],
            ],
            [
                'nome' => 'Ministério da Educação e Cultura',
                'sigla' => 'MEC',
                'sinopse' => '<p><span>O Ministério da Educação e Cultura foi a designação de um departamento dos I, II, III, IV e V Governos Provisórios e dos II, III e X Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-04-25',
                    'dissolucao' => '1987-08-17',
                ],
            ],
            [
                'nome' => 'Ministério da Educação e Investigação Científica',
                'sigla' => 'MEIC',
                'sinopse' => '<p><span>O Ministério da Educação e Investigação Científica foi a designação de um departamento do VI Governo Provisório e dos I e IV Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-08-08',
                    'dissolucao' => '1979-07-07',
                ],
            ],
            [
                'nome' => 'Ministério da Educação e das Universidades',
                'sigla' => 'MEU',
                'sinopse' => '<p><span>O Ministério da Educação e das Universidades foi a designação de um departamento do VIII Governo Constitucional de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-09-04',
                    'dissolucao' => '1983-07-09',
                ],
            ],
            [
                'nome' => 'Ministério do Emprego e da Segurança Social',
                'sigla' => 'MESS',
                'sinopse' => '<p><span>O Ministério do Emprego e da Segurança Social foi a designação de um departamento dos XI e XII Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1987-08-17',
                    'dissolucao' => '1995-10-25',
                ],
            ],
            [
                'nome' => 'Ministério do Equipamento Social',
                'sigla' => 'MES',
                'sinopse' => '<p><span>O Ministério do Equipamento Social foi a designação de um departamento dos IX, XIII e XIV Governos Constitucionais de Portugal.</p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1983-07-09',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério do Equipamento Social e do Ambiente',
                'sigla' => 'MESA',
                'sinopse' => '<p><span>O Ministério do Equipamento Social e do Ambiente (MESA) foi um departamento do Governo de Portugal responsável pela política executiva nas áreas das obras públicas, transportes, comunicações e ambiente. O ministério foi criado a seguir ao 25 de abril de 1974, reunindo as funções dos anteriores Ministério das Obras Públicas e Ministério das Comunicações, mas dando, além disso, um especial destaque à política ambiental. Existiu apenas durante os I, II, III, IV e V Governos Provisórios, ou seja, de 16 de maio de 1974 a 19 de setembro de 1975.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-05-16',
                    'dissolucao' => '1975-09-19',
                ],
            ],
            [
                'nome' => 'Ministério do Equipamento, do Planeamento e da Administração do Território',
                'sigla' => 'MEPAT',
                'sinopse' => '<p><span>O Ministério do Equipamento, do Planeamento e da Administração do Território (MEPAT) foi um departamento do Governo de Portugal, com responsabilidade executiva nas áreas das obras públicas, transportes, comunicações, administração local, ordenamento do território, planeamento e desenvolvimento regional. O ministério foi criado em 1996, resultando da fusão do Ministério do Equipamento Social com o Ministério do Planeamento e da Administração do Território.</span></p>
<p><span>O MEPAT foi extinto em 1999, passando as suas funções relativas a obras públicas, transportes e comunicações, para o restaurado Ministério do Equipamento Social, as relativas ao ordenamento do território para o novo Ministério do Ambiente e do Ordenamento do Território e as restantes para o novo Ministério do Planeamento.</span></p>
<p><span>As funções do antigo MEPAT encontram-se, hoje, essencialmente divididas pelo actual Ministério das Obras Públicas, Transportes e Comunicações e pelo Ministério do Ambiente, do Ordenamento do Território e do Desenvolvimento Regional.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1996-04-02',
                    'dissolucao' => '1999-04-02',
                ],
            ],
            [
                'nome' => 'Ministério das Finanças e da Administração Pública',
                'sigla' => 'MFAP',
                'sinopse' => '<p><span>O Ministério das Finanças e da Administração Pública foi a designação de um departamento do XVI Governo Constitucional de Portugal. O único titular da pasta foi António Bagão Félix.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2004-07-17',
                    'dissolucao' => '2005-03-12',
                ],
            ],
            [
                'nome' => 'Ministério das Finanças e do Plano',
                'sigla' => 'MFP',
                'sinopse' => '<p><span>O Ministério das Finanças e do Plano foi a designação de um departamento dos II, III, IV, VI, VII, VIII e IX Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1976-07-23',
                    'dissolucao' => '1985-11-06',
                ],
            ],
            [
                'nome' => 'Ministério da Habitação',
                'sigla' => 'MH',
                'sinopse' => '<p><span>O Ministério da Habitação (MH) foi um efémero departamento do Governo da República Portuguesa, que existiu, apenas, entre 1975 e 1978. O ministério era responsável pela execução da política de habitação e de planeamento urbano do Governo.</span></p>
<p><span>O MHUC resultou da cisão, em três ministérios separados, do anterior Ministério do Equipamento Social e do Ambiente. Em 1978 o MHUC foi fundido com o Ministério das Obras Públicas, dando origem ao Ministério da Habitação e Obras Públicas e em 2023 voltou a ser um ministério.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-09-26',
                    'dissolucao' => '2024-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Habitação e Obras Públicas',
                'sigla' => 'MHOP',
                'sinopse' => '<p><span>O Ministério da Habitação e Obras Públicas foi a designação de um departamento dos II, III, IV, V, VI e VII Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1978-04-02',
                    'dissolucao' => '1981-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Habitação, Obras Públicas e Transportes',
                'sigla' => 'MHOPT',
                'sinopse' => '<p><span>O Ministério da Habitação, Obras Públicas e Transportes foi a designação de um departamento do VIII Governo Constitucional de Portugal. O único titular da pasta foi José Viana Baptista.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-09-04',
                    'dissolucao' => '1983-07-09',
                ],
            ],
            [
                'nome' => 'Ministério da Habitação, Urbanismo e Construção',
                'sigla' => 'MHUC',
                'sinopse' => '<p><span>O Ministério da Habitação, Urbanismo e Construção, seria mais recente o Ministério da Habitação, estado activo em no VI Governo Provisório e o I Governo Constitucional.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-09-26',
                    'dissolucao' => '1978-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Indústria',
                'sigla' => 'MI',
                'sinopse' => '<p><span>O Ministério da Indústria era um antigo departamento do Governo de Portugal responsável pelas áreas da Indústria, Energia e Tecnologia. O ministério foi criado, pela primeira vez, em março de 1974 - a partir da Secretaria de Estado da Indústria do anterior Ministério da Economia - durando apenas pouco mais de um mês, em virtude da ocorrência da revolução de 25 de abril de 1974. Em seguida foi recriado e extinto, várias vezes.</span></p>
                <p><span>O departamento assumiu as seguintes designações:</span></p>
<ul><li>Secretaria de Estado da Indústria: 1958-1974;</li>
<li>Ministério da Indústria e Energia: 1974;</li>
<li>Ministério da Indústria e Tecnologia: 1975-1979;</li>
<li>Ministério da Indústria: 1979-1980;</li>
<li>Ministério da Indústria e Energia: 1980-1981;</li>
<li>Ministério da Indústria, Energia e Exportação: 1981-1983;</li>
<li>Ministério da Indústria e Energia: 1983-1985;</li>
<li>Ministério da Indústria e Energia: 1987-1995.</li></ul>
<p><span>A maioria das funções do antigo Ministério da Indústria estão, actualmente, atribuídas ao secretário de Estado adjunto, da Indústria e Inovação integrado no Ministério da Economia e da Inovação.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-03-15',
                    'dissolucao' => '1995-10-25',
                ],
            ],
            [
                'nome' => 'Ministério da Indústria e Comércio',
                'sigla' => 'MIC',
                'sinopse' => '<p><span>O Ministério da Indústria e Comércio foi a designação de um departamento do X Governo Constitucional de Portugal. O único titular da pasta foi Fernando Santos Martins.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1987-08-17',
                    'dissolucao' => '1989-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Indústria, Energia e Exportação',
                'sigla' => 'MIEE',
                'sinopse' => '<p><span>O Ministério da Indústria, Energia e Exportação foi a designação de um departamento do VIII Governo Constitucional de Portugal. O único titular da pasta foi Ricardo Bayão Horta.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-09-04',
                    'dissolucao' => '1983-07-09',
                ],
            ],
            [
                'nome' => 'Ministério da Indústria e Tecnologia',
                'sigla' => 'MIT',
                'sinopse' => '<p><span>O Ministério da Indústria e Tecnologia foi a designação de um departamento dos IV, V e VI Governos Provisórios e I, II, III e IV Governos Constitucionais de Portugal. Foi sucedido em 1979 pelo Ministério da Indústria.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1975-09-26',
                    'dissolucao' => '1979-07-07',
                ],
            ],
            [
                'nome' => 'Ministério das Infraestruturas',
                'sigla' => 'MI',
                'sinopse' => '<p><span>O Ministério das Infraestruturas foi a designação de um departamento do XXIII Governo Constitucional de Portugal. O único titular da pasta foi António de Almeida Santos.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2022-03-30',
                    'dissolucao' => '2024-04-02',
                ],
            ],
            [
                'nome' => 'Ministério das Infraestruturas e da Habitação',
                'sigla' => 'MIH',
                'sinopse' => '<p><span>O Ministério das Infraestruturas e da Habitação foi a designação de um departamento dos XXII, XXIII e XXIV Governo Constitucional de Portugal.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2019-04-02',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério da Integração Europeia',
                'sigla' => 'MIE',
                'sinopse' => '<p><span>O Ministério da Integração Europeia foi a designação de um departamento do VII Governo Constitucional de Portugal, liderado por Pinto Balsemão e que não durou um ano. O único titular da pasta foi Álvaro Barreto.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-01-03',
                    'dissolucao' => '1981-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Justiça e da Reforma Administrativa',
                'sigla' => 'MJRA',
                'sinopse' => '<p><span>O Ministério da Justiça e da Reforma Administrativa foi a designação de um departamento do VIII Governo Constitucional de Portugal, liderado por Pinto Balsemão. O titular da pasta foi José Menéres Pimentel.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-09-04',
                    'dissolucao' => '1983-07-09',
                ],
            ],
            [
                'nome' => 'Ministério da Juventude e do Desporto',
                'sigla' => 'MJD',
                'sinopse' => '<p><span>O Ministério da Juventude e do Desporto foi a designação de um departamento do XIV Governo Constitucional de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-10-25',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério do Mar',
                'sigla' => 'MM',
                'sinopse' => '<p><span>O Ministério do Mar foi um ministério do Governo de Portugal, responsável pelas pescas, pela marinha mercante e por outros assuntos relacionados com os oceanos. O Ministério do Mar existiu, pela primeira vez, entre 1983 e 1985. Mais tarde voltou a existir entre 1991 e 1995, e de novo a partir do XXI Governo Constitucional de Portugal (em 2015).</span></p>
<p><span>As responsabilidades do Ministério do Mar correspondem, aproximadamente, às que cabiam ao ramo de fomento marítimo do antigo Ministério da Marinha que desde a extinção deste em 1974 - tinham sido repartidas por vários ministérios. No XIX Governo Constitucional essas responsabilidades estiveram atribuídas no Ministério da Agricultura e do Mar dirigido pela Ministra Assunção Cristas. No XXI Governo Constitucional, voltou a ser um ministério autónomo.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1983-07-09',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério da Modernização do Estado e da Administração Pública',
                'sigla' => 'MMEAP',
                'sinopse' => '<p><span>O Ministério da Modernização do Estado e da Administração Pública foi a designação de um departamento do XXII Governo Constitucional de Portugal, responsável por formular, conduzir, executar e avaliar uma política global e coordenada na área da modernização administrativa, em matéria de simplificação, inovação e participação dos cidadãos e outros interessados.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2019-04-02',
                    'dissolucao' => '2022-03-30',
                ],
            ],
            [
                'nome' => 'Ministério dos Negócios Estrangeiros e Comunidades Portuguesas',
                'sigla' => 'MNECP',
                'sinopse' => '<p><span>O Ministério dos Negócios Estrangeiros e Comunidades Portuguesas foi a designação de um departamento dos XV e XVI Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1985-11-06',
                    'dissolucao' => '2005-03-12',
                ],
            ],
            [
                'nome' => 'Ministério das Obras Públicas, Transportes e Comunicações',
                'sigla' => 'MOPTC',
                'sinopse' => '<p><span>O Ministério das Obras Públicas, Transportes e Comunicações (MOPTC) foi um departamento do Governo de Portugal, que tinha como missão definir, coordenar e executar a política nacional nos domínios da construção e obras públicas, dos transportes aéreos, fluviais, marítimos e terrestres e das comunicações.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-04-02',
                    'dissolucao' => '2011-06-20',
                ],
            ],
            [
                'nome' => 'Ministério das Obras Públicas, Transportes e Habitação',
                'sigla' => 'MOPTH',
                'sinopse' => '<p><span>O Ministério das Obras Públicas, Transportes e Habitação foi a designação de um departamento do XV Governo Constitucional de Portugal, liderado por Durão Barroso.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2002-04-06',
                    'dissolucao' => '2004-07-17',
                ],
            ],
            [
                'nome' => 'Ministério do Planeamento',
                'sigla' => 'MP',
                'sinopse' => '<p><span>O Ministério do Planeamento foi um departamento do Governo de Portugal, responsável pela política executiva na áreas do desenvolvimento regional e da estatística.</span></p>
<p><span>O ministério foi criado em 2000, assumindo parte das responsabilidades que estavam atribuídas ao, então extinto, Ministério do Equipamento, do Planeamento e da Administração do Território. Foi extinto em 2002. Nesse âmbito tutelava as comissões de coordenação das regiões, o Instituto Nacional de Estatística e o Projecto Hidrográfico do Alqueva.</span></p>
<p><span>Este ministério voltou a ser instituído em 2019 no XXI Governo Constitucional, e depois extinto em 2022. O último ministro foi Nelson de Souza.</span></p>
<p><span>A maioria das funções do antigo Ministério do Planeamento concentravam-se, até recentemente, no Ministério do Ambiente, Ordenamento do Território e da Energia, e a área da estatística na Presidência do Conselho de Ministros.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-10-25',
                    'dissolucao' => '2022-03-30',
                ],
            ],
            [
                'nome' => 'Ministério do Planeamento e da Administração do Território',
                'sigla' => 'MPAT',
                'sinopse' => '<p><span>O Ministério do Planeamento e da Administração do Território foi a designação de um departamento dos XI e XII Governos Constitucionais de Portugal, liderados por Cavaco Silva. O único titular da pasta foi Luís Valente de Oliveira.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2002-04-06',
                    'dissolucao' => '2004-07-17',
                ],
            ],
            [
                'nome' => 'Ministério do Planeamento e Coordenação Económica',
                'sigla' => 'MPCE',
                'sinopse' => '<p><span>O Ministério do Planeamento e Coordenação Económica foi a designação de um departamento dos IV e V Governos Provisórios de Portugal. O único titular da pasta foi Mário Murteira.</span></p>
<p><span>Outros ministérios com denominações semelhantes foram o Ministério do Plano e Coordenação Económica, entre 1976 e 1978, e o Ministério da Coordenação Económica e do Plano, entre 1979 e 1980.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-04-25',
                    'dissolucao' => '1975-03-26',
                ],
            ],
            [
                'nome' => 'Ministério do Planeamento e das Infraestruturas',
                'sigla' => 'MPI',
                'sinopse' => '<p><span>O Ministério do Planeamento e das Infraestruturas (MPI) foi um departamento governativo de Portugal. Foi criado pela primeira vez no XXI Governo Constitucional de António Costa, tendo como ministro Pedro Marques.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2015-11-26',
                    'dissolucao' => '2019-04-02',
                ],
            ],
            [
                'nome' => 'Ministério do Plano e da Administração do Território',
                'sigla' => 'MPAT',
                'sinopse' => '<p><span>O Ministério do Plano e da Administração do Território (MPAT) foi um departamento do Governo de Portugal, responsável pelas políticas de planeamento estratégico nacional, de administração local, de ordenamento do território, de planeamento e desenvolvimento regional, de ambiente e recursos naturais, de ciência e tecnologia e de planeamento e administração do território.</span></p>
<p><span>O ministério foi criado em 1985, reunindo responsabilidades e funções que, anteriormente, se encontravam divididas por muitos departamentos governamentais, nomeadamente Presidência do Conselho de Ministros, Ministério da Administração Interna, Ministério das Finanças e do Plano, Ministério do Equipamento Social, Ministério da Agricultura e Ministério da Indústria e Energia. A abrangência das suas responsabilidades e funções específicas, além do facto de ser responsável pelo planeamento estratégico interministerial, tornou o MPAT num dos mais importantes departamentos do Governo de Portugal.</span></p>
<p><span>Em 1987 a designação do MPAT é alterada para "Ministério do Planeamento e da Administração do Território". Em 1990 a responsabilidade pela política executiva na área do ambiente e recursos naturais passa para o novo Ministério do Ambiente e Recursos Naturais. O MPAT foi fundido com o Ministério das Obras Públicas, Transportes e Comunicações em 1995, dando origem ao Ministério do Equipamento, do Planeamento e da Administração do Território.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1985-11-06',
                    'dissolucao' => '1987-08-17',
                ],
            ],
            [
                'nome' => 'Ministério do Plano e Coordenação Económica',
                'sigla' => 'MPCE',
                'sinopse' => '<p><span>O Ministério do Plano e Coordenação Económica foi um departamento do I Governo Constitucional de Portugal,[1] responsável pela política de planeamento económico. O único titular do ministério foi António Sousa Gomes.</span></p>
<p><span>O ministério, com este exato nome, existiu apenas entre 23 de julho de 1976 e 30 de janeiro de 1978. No entanto, durante vários períodos da década de 1970 existiram ministérios com nomenclaturas similares,[carece de fontes] a seguir ao 25 de Abril de 1974.</span></p>
<p><span>Outros ministérios com denominações semelhantes foram o Ministério do Planeamento e Coordenação Económica, em 1975, e o Ministério da Coordenação Económica e do Plano, entre 1979 e 1980.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1976-07-23',
                    'dissolucao' => '1978-01-30',
                ],
            ],
            [
                'nome' => 'Ministério da Presidência e da Modernização Administrativa',
                'sigla' => 'MPMA',
                'sinopse' => '<p><span>O Ministério da Presidência e da Modernização Administrativa foi um departamento do Governo de Portugal, responsável pela execução da política de modernização administrativa, em matéria de simplificação, inovação e participação dos cidadãos e outros interessados.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2011-04-06',
                    'dissolucao' => '2015-11-26',
                ],
            ],
            [
                'nome' => 'Ministério da Qualificação e do Emprego',
                'sigla' => 'MQE',
                'sinopse' => '<p><span>O Ministério para a Qualificação e Emprego foi a designação de um departamento do XIII Governo Constitucional de Portugal. A única ministra a titular a pasta foi Maria João Rodrigues.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-10-25',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério da Qualidade de Vida',
                'sigla' => 'MQV',
                'sinopse' => '<p><span>O Ministério da Qualidade de Vida foi um efémero departamento do Governo de Portugal responsável pela política executiva nas áreas dos desportos e do ambiente. O ministério apenas existiu entre 1981 e 1985. A maioria das funções do antigo ministério estão, hoje, repartidas pelo Ministério da Agricultura e do Mar e pela Secretaria de Estado da Juventude e do Desporto (integrada na Presidência do Conselho de Ministros).</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1981-09-04',
                    'dissolucao' => '1985-04-02',
                ],
            ],
            [
                'nome' => 'Ministério da Reforma Administrativa',
                'sigla' => 'MRA',
                'sinopse' => '<p><span>O Ministério da Reforma Administrativa foi um departamento do Governo de Portugal, destinado a coordenar as políticas de reforma da Administração Pública, com vista à sua modernização e desburocratização. O ministério existiu apenas durante nos II e VII Governos Constitucionais, em 1978 e 1981, respetivamente.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1978-01-30',
                    'dissolucao' => '1981-06-04',
                ],
            ],
            [
                'nome' => 'Ministério da Reforma do Estado e da Administração Pública',
                'sigla' => 'MREAP',
                'sinopse' => '<p><span>O Ministério da Reforma do Estado e da Administração Pública foi a designação de um departamento do XIV Governo Constitucional de Portugal. O único titular da pasta foi Alberto Martins. Este ministério foi extinto em 2002, passando as suas responsabilidades para o Ministério das Finanças.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-10-25',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério da Segurança Social, da Família e da Criança',
                'sigla' => 'MSSFC',
                'sinopse' => '<p><span>O Ministério da Segurança Social, da Família e da Criança foi a designação de um departamento do XVI Governo Constitucional de Portugal. O único titular da pasta foi Fernando Negrão.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2005-03-12',
                    'dissolucao' => '2011-06-20',
                ],
            ],
            [
                'nome' => 'Ministério da Segurança Social e Trabalho',
                'sigla' => 'MSST',
                'sinopse' => '<p><span>O Ministério da Segurança Social e Trabalho foi a designação de um departamento do XV Governo Constitucional de Portugal. O único titular do cargo de ministro da Segurança Social e Trabalho foi António Bagão Félix naquele governo, de 2002 a 2004.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2002-04-06',
                    'dissolucao' => '2004-07-17',
                ],
            ],
            [
                'nome' => 'Ministério da Solidariedade, Emprego e Segurança Social',
                'sigla' => 'MSESS',
                'sinopse' => '<p><span>O Ministério da Solidariedade, Emprego e Segurança Social é um departamento do Governo de Portugal, que tem por missão a definição, promoção e execução de políticas de solidariedade e segurança social, combate à pobreza e à exclusão social, apoios à família e à natalidade, a crianças e jovens em risco, a idosos, à inclusão de pessoas com deficiência, de promoção do voluntariado e de cooperação activa e partilha de responsabilidades com as entidades da Economia Social.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '2013-03-12',
                    'dissolucao' => '2015-11-26',
                ],
            ],
            [
                'nome' => 'Ministério da Solidariedade e Segurança Social',
                'sigla' => 'MSSS',
                'sinopse' => '<p><span>O Ministério da Solidariedade e Segurança Social foi a designação de um departamento dos XIII e XIX Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
            ],
            [
                'nome' => 'Ministério do Trabalho e Segurança Social',
                'sigla' => 'MTSS',
                'sinopse' => '<p><span>O Ministério do Trabalho e Segurança Social foi a designação de um departamento dos IX e X Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1983-07-09',
                    'dissolucao' => '1987-08-17',
                ],
            ],
            [
                'nome' => 'Ministério do Trabalho e da Solidariedade',
                'sigla' => 'MTS',
                'sinopse' => '<p><span>O Ministério do Trabalho e da Solidariedade foi a designação de um departamento dos XIII e XIV Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1999-10-25',
                    'dissolucao' => '2002-04-06',
                ],
            ],
            [
                'nome' => 'Ministério do Trabalho, Solidariedade e Segurança Social',
                'sigla' => 'MTSSS',
                'sinopse' => '<p><span>O Ministério do Trabalho, Solidariedade e Segurança Social (MTSSS) é o departamento do Governo de Portugal responsável pelas áreas do emprego, formação profissional e condições de trabalho e que tem por missão a definição, promoção e execução de políticas de solidariedade e segurança social, combate à pobreza e à exclusão social, apoios à família e à natalidade, a crianças e jovens em risco, a idosos, à inclusão de pessoas com deficiência, de promoção do voluntariado e de cooperação activa e partilha de responsabilidades com as entidades da Economia Social. Foi criado no XXI Governo, no qual o ministro titular da pasta era José António Vieira da Silva. No atual XXIV Governo, a titular da pasta é Maria do Rosário Palma Ramalho</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2015-11-26',
                    'dissolucao' => null,
                ],
            ],
            [
                'nome' => 'Ministério do Trabalho e da Solidariedade Social',
                'sigla' => 'MTSS',
                'sinopse' => '<p><span>O Ministério do Trabalho e da Solidariedade Social (MTSS) foi um departamento do Governo de Portugal, responsável pela gestão dos assuntos respeitantes ao trabalho e à segurança social.</span></p>
<p><span>O ministério foi criado, pela primeira vez, em 1916. Desde então, o departamento foi extinto, restaurado e reorganizado, por diversas vezes, com as seguintes designações:</span></p>
<p><span>
<ul><li>Ministério do Trabalho e Previdência Social (1916 - 1925)</li>
<li>Subsecretariado de Estado das Corporações e Previdência Social (1933 - 1950)</li>
<li>Ministério das Corporações e Previdência Social (1950 - 1972)</li>
<li>Ministério das Corporações e Segurança Social (1973 - 1974)</li>
<li>Ministério dos Assuntos Sociais e Ministério do Trabalho (1974 - 1983)</li>
<li>Ministério do Trabalho e da Segurança Social (1983 - 1987)</li>
<li>Ministério do Emprego e da Segurança Social (1987 - 1995)</li>
<li>Ministério para a Qualificação e Emprego e Ministério da Solidariedade e da Segurança Social (1995 - 1999)</li>
<li>Ministério do Trabalho e da Solidariedade (1999 - 2002)</li>
<li>Ministério da Segurança Social e do Trabalho (2002 - 2004)</li>
<li>Ministério da Segurança Social, da Família e da Criança e Ministério das Actividades Económicas e do Trabalho (2004 - 2005)</li>
<li>Ministério do Trabalho e da Solidariedade Social (2005 - 2011)</li>
<li>Ministério da Solidariedade e Segurança Social (2011 - 2013)</li>
<li>Ministério da Solidariedade, Emprego e Segurança Social (2013 - 2015)</li>
<li>Ministério do Trabalho, Solidariedade e Segurança Social (26/11/2015 - atualidade)</li></ul>
</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1916-03-17',
                    'dissolucao' => '2015-11-26',
                ],
            ],
            [
                'nome' => 'Ministério dos Transportes e Comunicações',
                'sigla' => 'MTC',
                'sinopse' => '<p><span>O Ministério dos Transportes e Comunicações foi a designação de um departamento dos IV, V e VI Governos Provisórios e I, II, III, IV Governos Constitucionais de Portugal, V Governos Constitucionais de Portugal, VI Governos Constitucionais de Portugal e VII Governos Constitucionais de Portugal.</span></p>',
                'extinta' => true,
                'dados' => [
                    'fundacao' => '1974-04-25',
                    'dissolucao' => '1981-04-02',
                ],
            ],
            [
                'nome' => 'Ministério do Turismo',
                'sigla' => 'MT',
                'sinopse' => '<p><span>O Ministério do Turismo foi um efémero departamento do Governo da República Portuguesa, existente apenas durante a vigência do XVI Governo Constitucional, entre 2004 e 2005. O departamento resultou da autonomização do setor do turismo do anterior Ministério da Economia, transformando-o num ministério separado. O único ministro do Turismo foi Telmo Correia.</span></p>
<p><span>O Ministério do Turismo foi extinto com a entrada em funções do XVII Governo Constitucional, sendo o setor do turismo absorvido pelo Ministério da Economia e da Inovação. Atualmente está integrado no Ministério da Economia, dirigido por Pedro Siza Vieira.</span></p>',
                'extinta' => false,
                'dados' => [
                    'fundacao' => '2004-07-17',
                    'dissolucao' => '2005-03-12',
                ],
            ],
            [
                'nome' => 'Ministério Sem Pasta',
                'sigla' => 'MSP',
                'sinopse' => '<p><span>Ministério sem pasta é um termo usado para designar um ministério que não tem uma pasta atribuída, ou seja, que não tem um departamento governamental específico.</span></p>',
                'extinta' => false,
            ],

        ];

        foreach ($instituicoes as $instituicao) {
            $instituicao = Instituicao::create([
                'uuid' => Str::uuid(),
                'nome' => $instituicao['nome'],
                'sigla' => $instituicao['sigla'],
                'sinopse' => $instituicao['sinopse'],
                'responde_instituicao_id' => null,
                'nacional' => true,
                'extinta' => $instituicao['extinta'],
                'params' => null,
            ]);

            $instituicao->tipos()->attach([2, 8]);

            if (isset($instituicao['dados'])) {
                InstituicaoDados::create([
                    'instituicao_id' => $instituicao->id,
                    'fundacao' => $instituicao['dados']['fundacao'] ?? null,
                    'dissolucao' => $instituicao['dados']['dissolucao'] ?? null,
                ]);
            }
        }

    }
}
