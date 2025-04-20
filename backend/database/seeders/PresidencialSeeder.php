<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Cidadao;
use App\Models\CidadaoCargo;
use App\Models\Concelho;
use App\Models\ContactoTipo;
use App\Models\Instituicao;
use App\Models\InstituicaoAnexo;
use App\Models\InstituicaoCargo;
use App\Models\InstituicaoComTipo;
use App\Models\InstituicaoContacto;
use App\Models\InstituicaoMorada;
use App\Models\InstituicaoPresidencial;
use App\Models\Presidencial;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class PresidencialSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $presidentes = [
            [
                'nome' => 'Teófilo Braga',
                'nome_completo' => 'Joaquim Teófilo Fernandes Braga',
                'republica_id' => 5,
                'posse' => '1910-10-05',
                'termino' => '1911-08-24',
                'sinopse' => '<p><span>Teófilo Braga foi o primeiro presidente da República Portuguesa, nomeado a 5 de outubro de 1910 e exonerado a 24 de agosto de 1911, durante o Governo Provisório.</span></p><p><span>Teófilo Braga foi o primeiro presidente da República Portuguesa, nomeado a 5 de outubro de 1910 e exonerado a 24 de agosto de 1911, durante o Governo Provisório.</span></p><p><span>Primeiro chefe de Estado do regime republicano (acumulando com a chefia do governo), numa capacidade provisória até à eleição do primeiro presidente da República. Dissolução dos partidos monárquicos. Eleições para a Assembleia Nacional Constituinte de 1911. Constituição de 1911. Lei da Separação do Estado das Igrejas. Teófilo Braga continuará como presidente do Governo Provisório até 3 de setembro de 1911.</span></p>',
                'cargo' => 'Presidente do Governo Provisório',
            ],
            [
                'nome' => 'Manuel de Arriaga',
                'nome_completo' => 'Manuel José de Arriaga Brum da Silveira e Peyrelongue',
                'republica_id' => 5,
                'posse' => '1911-08-24',
                'termino' => '1915-05-29',
                'eleicao_id' => 85,
                'sinopse' => '<p><span>Manuel de Arriaga foi o segundo presidente da República Portuguesa, nomeado a 24 de agosto de 1911 e exonerado a 29 de maio de 1915, durante o Governo Constitucional.</span></p><p><span>Primeiro presidente constitucionalmente eleito ao abrigo da Constituição de 1911. Divisão do Partido Republicano Português nos partidos Democrático, Evolucionista e Unionista. Incursões monárquicas de Paiva Couceiro. Governos de Teófilo Braga (provisório), João Chagas, Augusto de Vasconcelos, Duarte Leite, Afonso Costa, Bernardino Machado, Azevedo Coutinho, Pimenta de Castro e João Chagas/José de Castro. Movimento das Espadas. Demitiu-se do cargo após a revolta de 14 de Maio de 1915, e a subsequente queda do governo de Pimenta de Castro. Junta Constitucional de 1915. Atentado contra João Chagas.</span></p>',
            ],
            [
                'nome' => 'Teófilo Braga',
                'nome_completo' => 'Joaquim Teófilo Fernandes Braga',
                'republica_id' => 5,
                'posse' => '1915-05-29',
                'termino' => '1915-10-05',
                'eleicao_id' => 86,
                'sinopse' => '<p><span>Presidente da República substituto incumbido de terminar o mandato presidencial iniciado em 1911 por Manuel de Arriaga. Governo de João Chagas/José de Castro. Eleições legislativas de 1915.</span></p>',
            ],
            [
                'nome' => 'Bernardino Machado',
                'nome_completo' => 'Bernardino Luís Machado Guimarães',
                'republica_id' => 5,
                'posse' => '1915-10-05',
                'termino' => '1917-12-11',
                'eleicao_id' => 87,
                'sinopse' => '<p><span>Presidente da República eleito em 1915.</span></p><p><span>Primeiro mandato presidencial de Bernardino Machado. Governos de José de Castro, Afonso Costa, António José de Almeida (governo da União Sagrada) e, novamente, de Afonso Costa. Entrada de Portugal na Primeira Guerra Mundial, do lado dos Aliados. Aparições marianas de Fátima. Junta Revolucionária de 1917, subsequente ao golpe de Sidónio Pais, tendo Bernardino Machado sido demitido.</span></p>',
            ],
            [
                'nome' => 'Sidónio Pais',
                'nome_completo' => 'Sidónio Bernardino Cardoso da Silva Pais',
                'republica_id' => 5,
                'posse' => '1917-12-12',
                'termino' => '1918-05-09',
                'sinopse' => '<p><span>De acordo com a Constituição de 1911, na ausência de um presidente da República, a totalidade do governo substitui-o. Governo liderado por Sidónio Pais, militar revoltoso, presidente da Junta Revolucionária de 1917 e presidente do Ministério. Governo de contornos ditatoriais.</span></p><p><span>De 27 de dezembro de 1917 a 9 de maio de 1918 acumula os cargos de presidente da República interino e de presidente do Ministério.</span></p>',
                'cargo' => 'Presidente da República interino',
            ],
            [
                'nome' => 'Sidónio Pais',
                'nome_completo' => 'Sidónio Bernardino Cardoso da Silva Pais',
                'republica_id' => 5,
                'posse' => '1918-05-09',
                'termino' => '1918-12-14',
                'eleicao_id' => 88,
                'sinopse' => '<p><span>Após as eleições de abril de 1918 é inaugurado como presidente da República, chefiando um governo presidencialista autoritário. Os ministros passam a designar-se secretários de Estado. Primeiro e único presidente eleito por sufrágio direto na 1.ª República. República Nova. Desastre na Batalha de La Lys. Apaziguamento das relações com a Igreja Católica. Eleições legislativas de 1918. Armistício da Primeira Guerra Mundial. Presidenticídio de 14 de dezembro de 1918.</span></p>',
            ],
            [
                'nome' => 'João do Canto e Castro',
                'nome_completo' => 'João do Canto e Castro Silva Antunes Júnior',
                'republica_id' => 5,
                'posse' => '1918-12-14',
                'termino' => '1918-12-16',
                'sinopse' => '<p><span>Regresso à Constituição de 1911. De acordo com esta, em caso de morte do presidente da República, este é substituído provisoriamente pela totalidade do governo, neste caso, o governo previamente liderado pelo próprio Sidónio Pais. A 15 de dezembro o governo elege João do Canto e Castro como presidente interino do Ministério.</span></p>',
                'cargo' => 'Presidente da República interino',
            ],
            [
                'nome' => 'João do Canto e Castro',
                'nome_completo' => 'João do Canto e Castro Silva Antunes Júnior',
                'republica_id' => 5,
                'posse' => '1918-12-16',
                'termino' => '1919-10-05',
                'eleicao_id' => 89,
                'sinopse' => '<p><span>Presidente da República substituto incumbido de terminar o mandato presidencial iniciado em 1915 por Bernardino Machado. Governos do próprio Canto e Castro, Tamagnini Barbosa, José Relvas, Domingos Pereira e Sá Cardoso. Revolta de Santarém, Monarquia do Norte e várias outras revoltas e tentativas de golpes.</span></p>',
            ],
            [
                'nome' => 'António Teixeira de Sousa',
                'republica_id' => 5,
                'posse' => '1919-10-05',
                'termino' => '1923-10-05',
                'eleicao_id' => 90,
                'sinopse' => '<p><span>Único presidente da 1.ª República a cumprir integralmente o seu mandato. Governos de Sá Cardoso, Fernandes Costa (Governo dos Cinco Minutos), Domingos Pereira, António Maria Baptista/Ramos Preto, António Maria da Silva, António Granjo, Álvaro de Castro, Liberato Pinto, Bernardino Machado, Barros Queirós, novamente António Granjo, Manuel Maria Coelho, Maia Pinto, Cunha Leal e novamente António Maria da Silva. Eleições legislativas de 1921. Revolta outubrista e episódio da Noite Sangrenta. Eleições legislatvias de 1922. Travessia aérea do Atlântico Sul por Gago Coutinho e Sacadura Cabral.</span></p>',
            ],
            [
                'nome' => 'Manuel Teixeira Gomes',
                'republica_id' => 5,
                'posse' => '1923-10-05',
                'termino' => '1925-12-11',
                'eleicao_id' => 91,
                'sinopse' => '<p><span>Alcunhado de presidente-escritor. Governos de António Maria da Silva, Ginestal Machado, Álvaro de Castro, Rodrigues Gaspar, Domingues dos Santos, Vitorino Guimarães, novamente António Maria da Silva e Domingos Pereira. Eleições legislativas de 1925. Golpe dos Generais. Renuncia ao mandato, num contexto de enorme instabilidade política e social.</span></p>',
            ],
            [
                'nome' => 'Bernardino Machado',
                'nome_completo' => 'Bernardino Luís Machado Guimarães',
                'republica_id' => 5,
                'posse' => '1925-12-11',
                'termino' => '1926-05-31',
                'eleicao_id' => 92,
                'sinopse' => '<p><span>Segundo mandato presidencial de Bernardino Machado. Presidente da República substituto incumbido de terminar o mandato presidencial iniciado em 1923 por Manuel Teixeira Gomes. Governos de Domingos Pereira e António Maria da Silva. Descoberta da burla de Alves dos Reis. Mandato novamente interrompido pela Revolução de 28 de maio de 1926.</span></p>',
            ],
            [
                'nome' => 'José Mendes Cabeçadas',
                'nome_completo' => 'José Mendes Cabeçadas Júnior',
                'republica_id' => 6,
                'posse' => '1926-05-31',
                'termino' => '1926-06-19',
                'sinopse' => '<p><span>De acordo com a Constituição de 1911, na ausência de um presidente da República, a totalidade do governo substitui-o. Governo liderado por Manuel Gomes da Costa, militar revoltoso, presidente da Junta Revolucionária de 1926 e presidente do Ministério. Governo de contornos ditatoriais.</span></p><p><span>De 31 de maio a 9 de julho de 1926 acumula os cargos de presidente da República interino e de presidente do Ministério.</span></p>',
                'cargo' => 'Presidente do Ministério',
            ],
            [
                'nome' => 'Manuel Gomes da Costa',
                'nome_completo' => 'Manuel de Oliveira Gomes da Costa',
                'republica_id' => 6,
                'posse' => '1926-06-19',
                'termino' => '1926-07-09',
                'sinopse' => '<p><span>Após o afastamento de Mendes Cabeçadas, segue-se um ministério de Gomes da Costa. Este ministério, ainda de acordo com a Constituição de 1911, assume a totalidade do poder executivo até dia 29 de junho, quando os poderes de presidente da República são oficialmente atribuídos ao seu presidente, Gomes da Costa.</span></p><p><span>Militar revoltoso da Revolução de 28 de maio de 1926. Presidente do Ministério (2.º da Ditadura Militar) com atribuição das competências da presidência da República. Derrubado por um contra-golpe de Estado, organizado por Óscar Carmona.</span></p>',
                'cargo' => 'Presidente do Ministério',
            ],
            [
                'nome' => 'Óscar Carmona',
                'nome_completo' => 'António Óscar de Fragoso Carmona',
                'republica_id' => 6,
                'posse' => '1926-07-09',
                'termino' => '1928-04-15',
                'sinopse' => '<p><span>Após o afastamento de Gomes da Costa, segue-se um ministério (3.º da Ditadura Militar) de Óscar Carmona. Este ministério, ainda de acordo com a Constituição de 1911, assume a totalidade do poder executivo até dia 29 de novembro, quando os poderes de presidente da República são oficialmente atribuídos ao seu presidente, Óscar Carmona. Estabelecimento da censura prévia.</span></p><p><span>Militar revoltoso do golpe de 28 de maio de 1926. Presidente interino até à realização de eleições presidenciais, acumulando com o cargo de presidente do Ministério.</span></p>',
                'cargo' => 'Presidente do Ministério',
            ],
            [
                'nome' => 'Óscar Carmona',
                'nome_completo' => 'António Óscar de Fragoso Carmona',
                'republica_id' => 6,
                'posse' => '1928-04-15',
                'termino' => '1933-04-11',
                'eleicao_id' => 93,
                'sinopse' => '<p><span>Presidente eleito por sufrágio direto, sendo o único candidato. Legitimação do novo regime, dando-se início ao período da Ditadura Nacional. Governos do próprio Óscar Carmona, de Vicente de Freitas, Ivens Ferraz, Domingos Oliveira e início da governação de Oliveira Salazar. Reequilíbrio das finanças públicas. Fundação do partido único: União Nacional. Ato Colonial, e oficialização do Império Colonial Português.</span></p>',
            ],
            [
                'nome' => 'Óscar Carmona',
                'nome_completo' => 'António Óscar de Fragoso Carmona',
                'republica_id' => 7,
                'posse' => '1933-04-11',
                'termino' => '1935-04-15',
                'sinopse' => '<p><span>Estabelecimento da Constituição de 1933 e início do Estado Novo, corporativista, autoritário e de inspiração fascista. Criação da PVDE (PIDE a partir de 1945).</span></p>',
            ],
            [
                'nome' => 'António de Oliveira Salazar',
                'republica_id' => 7,
                'posse' => '1935-04-15',
                'termino' => '1935-04-26',
                'eleicao_id' => 94,
                'sinopse' => '<p><span>Após o termo do primeiro mandato, Carmona, devido a doença, é impossibilitado de tomar posse. Nesse período, Oliveira Salazar, como presidente do Conselho, serve como presidente da República interino até à tomada de posse de Carmona.</span></p>',
                'cargo' => 'Presidente da República interino',
            ],
            [
                'nome' => 'Óscar Carmona',
                'nome_completo' => 'António Óscar de Fragoso Carmona',
                'republica_id' => 7,
                'posse' => '1935-04-26',
                'termino' => '1951-04-18',
                'eleicao_id' => 94,
                'sinopse' => '<p><span>Criação da Legião Portuguesa e da Mocidade Portuguesa. Neutralidade portuguesa durante a Segunda Guerra Mundial. Tratado de Amizade e Não Agressão Luso-Espanhol. Fundação do MUD. Exposição do Mundo Português. Concordata com a Santa Sé. Entrada de Portugal como membro fundador da NATO. Candidatura de Norton de Matos à presidência. Presidente morre no cargo.</span></p>',
            ],
            [
                'nome' => 'António de Oliveira Salazar',
                'republica_id' => 7,
                'posse' => '1951-04-18',
                'termino' => '1951-08-09',
                'sinopse' => '<p><span>Após a morte de Carmona, Oliveira Salazar, como presidente do Conselho, serve como presidente da República interino até à tomada de posse de Craveiro Lopes.</span></p>',
                'cargo' => 'Presidente da República interino',
            ],
            [
                'nome' => 'Francisco Craveiro Lopes',
                'nome_completo' => 'Francisco Higino Craveiro Lopes',
                'republica_id' => 7,
                'posse' => '1951-08-09',
                'termino' => '1958-08-09',
                'eleicao_id' => 97,
                'sinopse' => '<p><span>Nova política ultramarina. Anexação de Dadrá e Nagar Aveli pela União Indiana. Entrada nas Nações Unidas. Divergências entre Craveiro Lopes e Oliveira Salazar. Primeira emissão regular da RTP. Candidatura de Humberto Delgado à presidência, nas eleições presidenciais de 1958. Não teve apoio da União Nacional para o exercício de um segundo mandato.</span></p>',
            ],
            [
                'nome' => 'Américo Thomaz',
                'nome_completo' => 'Américo Deus Rodrigues Thomaz',
                'republica_id' => 7,
                'posse' => '1958-08-09',
                'termino' => '1974-04-25',
                'eleicao_id' => 98,
                'sinopse' => '<p><span>Entrada na EFTA. Fuga de Peniche. Início da Guerra Colonial. Golpe Botelho Moniz. Anexação do Estado da Índia pela União Indiana. Sequestro do Santa Maria, por Henrique Galvão. Crise académica de 1962. Grande vaga de emigração. Inauguração da Ponte Salazar (hoje Ponte 25 de Abril). Fundação da Acção Socialista Portuguesa. Assassinato de Humberto Delgado. Afastamento de Oliveira Salazar e chegada ao poder de Marcello Caetano. Primavera Marcelista. Movimento dos Capitães e Revolução de 25 de abril de 1974.</span></p>',
            ],
            [
                'nome' => 'António de Spínola',
                'nome_completo' => 'António de Spínola',
                'republica_id' => 8,
                'posse' => '1974-04-25',
                'termino' => '1974-05-15',
                'sinopse' => '<p><span>Acumulou todo o poder executivo após o 25 de abril de 1974, incluindo a chefia do Estado e do governo. Restabelecimento das liberdades políticas e individuais. Libertação dos presos políticos. Regresso dos exilados. Após a nomeação de António de Spínola para presidente da República, continuou a funcionar como chefe de governo por mais um dia. Existiu até 1975, passando os seus membros a integrar o Conselho da Revolução.</span></p>',
                'cargo' => 'Presidente da Junta de Salvação Nacional',
            ],
            [
                'nome' => 'António de Spínola',
                'nome_completo' => 'António de Spínola',
                'republica_id' => 8,
                'posse' => '1974-05-15',
                'termino' => '1974-09-30',
                'sinopse' => '<p><span>Militar e presidente da Junta de Salvação Nacional eleito por esta para o cargo de presidente da República. I Governo Provisório de Palma Carlos. II Governo Provisório de Vasco Gonçalves. Acordos de Lusaca. Reconhecimento da independência da Guiné-Bissau. Demite-se após o falhanço do golpe da "maioria silenciosa".</span></p>',
            ],
            [
                'nome' => 'Francisco da Costa Gomes',
                'republica_id' => 8,
                'posse' => '1974-09-30',
                'termino' => '1976-07-14',
                'sinopse' => '<p><span>Militar e membro da Junta de Salvação Nacional eleito por esta para o cargo de Presidente da República — e da própria JSN — após a renúncia de António de Spínola. III Governo Provisório, IV Governo Provisório e V Governo Provisório, todos liderados por Vasco Gonçalves. VI Governo Provisório de Pinheiro de Azevedo. Acordo do Alvor. Golpe de 11 de Março de 1975. Eleições para a Assembleia Constituinte de 1975. Verão Quente. Crise de 25 de Novembro de 1975. Reconhecimento da independência de Cabo Verde, São Tomé e Príncipe, Moçambique e Angola. Invasão de Timor pela Indonésia. Aprovação a 2 de Abril de 1976 da Constituição de 1976. Eleições legislativas de 1976.</span></p>',
            ],
            [
                'nome' => 'António Ramalho Eanes',
                'nome_completo' => 'António dos Santos Ramalho Eanes',
                'republica_id' => 8,
                'posse' => '1976-07-14',
                'termino' => '1986-03-09',
                'eleicao_id' => 101,
                'sinopse' => '<p><span>Militar. Primeiro presidente da República eleito democraticamente por sufrágio universal após o 25 de Abril de 1974, em 1976 e reeleito em 1980. VI Governo Provisório de Pinheiro de Azevedo. I Governo Constitucional e II Governo Constitucional, liderados por Mário Soares. III Governo Constitucional de Nobre da Costa. IV Governo Constitucional de Mota Pinto. V Governo Constitucional de Maria de Lourdes Pintasilgo. Eleições legislativas de 1979. VI Governo Constitucional de Sá Carneiro. Eleições legislativas de 1980. Caso Camarate. VII Governo Constitucional e VIII Governo Constitucional, liderados por Pinto Balsemão. Revisão Constitucional em 1982. Eleições legislativas de 1983. IX Governo Constitucional de Mário Soares. Bloco Central. Eleições legislativas de 1985. X Governo Constitucional de Cavaco Silva. Adesão à CEE.</span></p>',
            ],
            [
                'nome' => 'Mário Soares',
                'nome_completo' => 'Mário Alberto Nobre Lopes Soares',
                'republica_id' => 8,
                'posse' => '1986-03-09',
                'termino' => '1996-03-09',
                'eleicao_id' => 103,
                'sinopse' => '<p><span>Segundo presidente da República eleito democraticamente por sufrágio universal após o 25 de Abril de 1974, em 1986 e reeleito em 1991. Primeiro presidente da República civil desde 1926. X Governo Constitucional de Cavaco Silva. Após moção de censura aprovada pela Assembleia da República, Soares dissolve o Parlamento. Eleições legislativas de 1987. XI Governo Constitucional de Cavaco Silva. Revisão Constitucional em 1989. Eleições legislativas de 1991. XII Governo Constitucional de Cavaco Silva. Adesão ao Tratado de Maastricht. Revisão Constitucional em 1992. Eleições legislativas de 1995. XIII Governo Constitucional de António Guterres.</span></p>',
            ],
            [
                'nome' => 'Jorge Sampaio',
                'nome_completo' => 'Jorge Fernando Branco de Sampaio',
                'republica_id' => 8,
                'posse' => '1996-03-09',
                'termino' => '2006-03-09',
                'eleicao_id' => 105,
                'sinopse' => '<p><span>Terceiro presidente da República eleito democraticamente por sufrágio universal após o 25 de Abril de 1974, em 1996 e reeleito em 2001. XIII Governo Constitucional de António Guterres. Revisão Constitucional em 1997. Referendo de independência de Timor-Leste de 1999. Reconhecimento da independência de Timor-Leste. Eleições legislativas de 1999. XIV Governo Constitucional de António Guterres. Transferência da Soberania de Macau para a China. Reeleito em 2001. Revisão Constitucional em 2001. Após as Eleições autárquicas de 2001, Guterres demite-se e Sampaio dissolve o Parlamento. Eleições legislativas de 2002. XV Governo Constitucional de Durão Barroso. Revisão Constitucional em 2004. XVI Governo Constitucional de Santana Lopes. A 30 de novembro de 2004, Sampaio dissolve o Parlamento. Eleições legislativas de 2005. XVII Governo Constitucional de José Sócrates. Revisão Constitucional em 2005.</span></p>',
            ],
            [
                'nome' => 'Aníbal Cavaco Silva',
                'nome_completo' => 'Aníbal António da Costa Cavaco Silva',
                'republica_id' => 8,
                'posse' => '2006-03-09',
                'termino' => '2016-03-09',
                'eleicao_id' => 107,
                'sinopse' => '<p><span>Quarto presidente da República eleito democraticamente por sufrágio universal após o 25 de Abril de 1974, em 2006 e reeleito em 2011. XVII Governo Constitucional de José Sócrates. Crise do subprime em 2007. Eleições legislativas de 2009. XVIII Governo Constitucional de José Sócrates. Crise da dívida pública da Zona Euro. Após rejeição do PEC IV pelo parlamento em março de 2011, Sócrates demite-se e Cavaco Silva dissolve o Parlamento. Eleições legislativas de 2011. XIX Governo Constitucional de Passos Coelho. Crise política de julho de 2013, com a demissão não concretizada de Paulo Portas. Saída da troika financeira de Portugal em 2014. Eleições legislativas de 2015. XX Governo Constitucional de Passos Coelho. Moção de rejeição ao programa de governo aprovada pela Assembleia da República. XXI Governo Constitucional de António Costa.</span></p>',
            ],
            [
                'nome' => 'Marcelo Rebelo de Sousa',
                'nome_completo' => 'Marcelo Nuno Duarte Rebelo de Sousa',
                'republica_id' => 8,
                'posse' => '2016-03-09',
                'termino' => null,
                'eleicao_id' => 109,
                'sinopse' => '<p><span>Quinto presidente da República eleito democraticamente por sufrágio universal após o 25 de Abril de 1974, em 2016. XXI Governo Constitucional de António Costa. Eleição de António Guterres como 9.º Secretário-geral das Nações Unidas. Incêndio florestal de Pedrógão Grande em 2017. Incêndios florestais em Portugal de outubro de 2017. Escândalo de Tancos. Eleições legislativas de 2019. XXII Governo Constitucional de António Costa. Pandemia de COVID-19 em Portugal. Polémica SEF/homicídio de Ihor Humenyuk. Dissolução do Parlamento após a rejeição do Orçamento do Estado para 2022. Eleições legislativas de 2022. XXIII Governo Constitucional de António Costa. Operação Influencer e crise política portuguesa em 2023. XXIV Governo Constitucional de Luís Montenegro. Caso Spinumviva e rejeição de moção de confiança ao governo. Nova dissolução do Parlamento e eleições legislativas de 2025.</span></p>',
            ],
        ];

        $casaPresidenciaId = 19;
        InstituicaoComTipo::create(['instituicao_id' => $casaPresidenciaId, 'instituicao_tipo_id' => 1]);

        InstituicaoContacto::create([
            'instituicao_id' => $casaPresidenciaId,
            'contacto' => 'https://www.presidencia.pt/',
            'contacto_tipo_id' => ContactoTipo::where('tipo', 'Website')->first()->id,
        ]);
        InstituicaoMorada::create([
            'instituicao_id' => $casaPresidenciaId,
            'morada' => 'Calçada da Ajuda',
            'codigo_postal' => '1349-022',
            'localidade' => 'Lisboa',
            'concelho_id' => Concelho::where('nome', 'Lisboa')->first()->id,
        ]);
        InstituicaoAnexo::create([
            'instituicao_id' => $casaPresidenciaId,
            'anexo' => 'https://www.presidencia.pt/theme/images/brasao_PRP_cores_250px.svg',
            'uuid' => Str::uuid(),
            'anexo_tipo_id' => 1,
            'nome' => 'Logotipo',
            'descricao' => null,
        ]);

        foreach ($presidentes as $presidente) {

            // nao é dada disto primeiro so as datas em presidencial, depois a instuicao_presidencial, instuicao_cargo, cidadao, cidadao_cargo
            $presidencia = Presidencial::create([
                'uuid' => Str::uuid(),
                'republica_id' => $presidente['republica_id'],
                'eleicao_id' => isset($presidente['eleicao_id']) ? $presidente['eleicao_id'] : null,
                'posse' => $presidente['posse'],
                'termino' => isset($presidente['termino']) ? $presidente['termino'] : null,
                'sinopse' => $presidente['sinopse'],
            ]);

            $instPres = InstituicaoPresidencial::create([
                'uuid' => Str::uuid(),
                'instituicao_id' => $casaPresidenciaId,
                'presidencial_id' => $presidencia->id,
                'sinopse' => $presidente['sinopse'],
            ]);

            $instCargo = InstituicaoCargo::create([
                'uuid' => Str::uuid(),
                'tipo' => 'instituicao_presidencial',
                'cargo' => isset($presidente['cargo']) ? $presidente['cargo'] : 'Presidente da República',
                'instituicao_id' => $instPres->id,
            ]);

            $nome = mb_trim($presidente['nome']);
            $nome_completo = isset($presidente['nome_completo']) ? mb_trim($presidente['nome_completo']) : null;

            // First, try to find ALL existing citizens with this name
            $existingCidadaos = Cidadao::where('nome', $nome)->get();

            if ($existingCidadaos->isEmpty()) {
                // Case 1: No existing citizen with this name - create new
                $cidadao = Cidadao::create([
                    'uuid' => Str::uuid(),
                    'nome' => $nome,
                    'nome_completo' => $nome_completo,
                ]);
            } else {
                $foundMatch = false;

                // Check if we have an exact match (including nome_completo)
                foreach ($existingCidadaos as $existing) {
                    if ($nome_completo && $existing->nome_completo === $nome_completo) {
                        $cidadao = $existing;
                        $foundMatch = true;
                        break;
                    }
                }

                if (! $foundMatch) {
                    // Look for a record without nome_completo that we can update
                    $existingWithoutNomeCompleto = $existingCidadaos->first(function ($existing) {
                        return $existing->nome_completo === null;
                    });

                    if ($existingWithoutNomeCompleto && $nome_completo) {
                        $existingWithoutNomeCompleto->nome_completo = $nome_completo;
                        $existingWithoutNomeCompleto->save();
                        $cidadao = $existingWithoutNomeCompleto;
                    } else {
                        // Create new if no match and no updateable record found
                        if ($existingCidadaos[0]->nome === $nome) {
                            $cidadao = $existingCidadaos[0];
                        } else {
                            // Create new if no match and no updateable record found
                            $cidadao = Cidadao::create([
                                'uuid' => Str::uuid(),
                                'nome' => $nome,
                                'nome_completo' => $nome_completo,
                            ]);
                        }
                    }
                }
            }

            CidadaoCargo::create([
                'cidadao_id' => $cidadao->id,
                'cargo_id' => $instCargo->id,
                'inicio' => $presidente['posse'],
                'fim' => isset($presidente['termino']) ? $presidente['termino'] : null,
                'sinopse' => $presidente['sinopse'],
            ]);
        }

        $inst = Instituicao::create([
            'uuid' => Str::uuid(),
            'nome' => 'Secretaria-Geral da Presidência da República',
            'responde_instituicao_id' => $casaPresidenciaId,
            'nacional' => true,
            'extinta' => false,
        ]);
        InstituicaoComTipo::create(['instituicao_id' => $inst->id, 'instituicao_tipo_id' => 1]);
        InstituicaoContacto::create([
            'instituicao_id' => $casaPresidenciaId,
            'contacto' => 'https://www.sg.presidencia.pt/pag/homepage.aspx',
            'contacto_tipo_id' => ContactoTipo::where('tipo', 'Website')->first()->id,
        ]);

        $inst = Instituicao::create([
            'uuid' => Str::uuid(),
            'nome' => 'Conselho de Estado',
            'responde_instituicao_id' => $casaPresidenciaId,
            'nacional' => true,
            'extinta' => false,
        ]);
        InstituicaoComTipo::create(['instituicao_id' => $inst->id, 'instituicao_tipo_id' => 1]);

        Instituicao::create([
            'uuid' => Str::uuid(),
            'nome' => 'Conselho Superior de Defesa Nacional',
            'responde_instituicao_id' => $casaPresidenciaId,
            'nacional' => true,
            'extinta' => false,
        ]);
        InstituicaoComTipo::create(['instituicao_id' => $inst->id, 'instituicao_tipo_id' => 1]);

        Instituicao::create([
            'uuid' => Str::uuid(),
            'nome' => 'Condecorações',
            'responde_instituicao_id' => $casaPresidenciaId,
            'nacional' => true,
            'extinta' => false,
        ]);
        InstituicaoComTipo::create(['instituicao_id' => $inst->id, 'instituicao_tipo_id' => 1]);

    }
}
