<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\AnexoTipo;
use App\Models\Governo;
use App\Models\GovernoAnexo;
use App\Models\Republica;
use App\Models\RepublicaAnexo;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class RepublicasGovernosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        try {
            $republicas = [
                [
                    'nome' => 'Monarquia Absoluta',
                    'inicio' => '1736-06-28',
                    'fim' => '1822-09-24',
                    'sinopse' => 'Regime monárquico absoluto que governou Portugal desde da reforma administrativa de 1736 até 1822.',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                    'governos' => [
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo de João V de Portugal',
                            'inicio' => '1736-06-28',
                            'fim' => '1750-08-02',
                            'sinopse' => '<p><span>O 1.º governo de João V de Portugal constituído a 28 de Julho de 1736 e exonerado a 2 de Agosto de 1750, foi presidido pelo Padre Pedro da Mota, na qualidade de secretário de Estado dos Negócios Interiores do Reino (se bem que o cargo de chefe de governo não estava ainda definido), sendo o executivo encabeçado pelo próprio D. João V.</span></p>
<p><span>Foi o primeiro gabinete constituído após a reforma da administração central, criada por Alvará de 28 de Julho de 1736 de D. João V, que organizou o executivo na moderna forma de divisão em ministérios especializados num determinado sector governativo. Até então, o governo era constituído por dois secretários de Estado, o da Assinatura de Documentos Régios e o das Mercês, além do escrivão da puridade. Estes órgãos não eram especializados em nenhum assunto governativo específico, actuando em todas as áreas.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo de José I de Portugal',
                            'inicio' => '1750-08-02',
                            'fim' => '1756-05-06',
                            'sinopse' => '<p><span>O 1.º governo de José I de Portugal constituído a 2 de Agosto de 1750, foi presidido pelo Padre Pedro da Mota, na qualidade de secretário de Estado dos Negócios Interiores do Reino (se bem que o cargo de chefe de governo não estava ainda definido), sendo o executivo encabeçado pelo próprio D. José I.</span></p>
<p><span>Pedro da Mota e Silva faleceu na sequência do Terramoto de 1755, tendo o cargo ficado vago mas, na prática, sido preenchido por Sebastião José de Carvalho e Melo, que apenas viria a tomar posse oficialmente em 1756.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo de José I de Portugal',
                            'inicio' => '1756-05-06',
                            'fim' => '1777-03-14',
                            'sinopse' => '<p><span>O 2.º governo de José I de Portugal, constituído a 6 de Maio de 1756 e substituído a 14 de Março de 1777, foi presidido por Sebastião José de Carvalho e Melo (subsequentemente elevado aos títulos de Conde de Oeiras e, mais tarde, Marquês de Pombal, durante a incumbência do cargo), na qualidade de secretário de Estado dos Negócios Interiores do Reino (se bem que o cargo de chefe de governo não estava ainda definido), sendo o executivo encabeçado pelo próprio D. José I.</span></p>
<p><span>Após a morte de D. José, em 1777, o Marquês de Pombal apresentou a sua demissão, que foi aceite por D. Maria por decreto de 4 de Março de 1777. Os secretários de Estado da Marinha e dos Negócios Estrangeiros haviam de ser reconduzidos no cargo durante o próximo governo.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo de Maria I de Portugal',
                            'inicio' => '1777-03-14',
                            'fim' => '1788-12-15',
                            'sinopse' => '<p><span>O 1.º governo de Maria I de Portugal, constituído a 14 de Março de 1777 e substituído a 15 de Dezembro de 1788, foi presidido pelo Marquês de Angeja, na qualidade de ministro adjunto ao despacho (se bem que o cargo de chefe de governo não estava ainda definido), sendo o executivo encabeçado pela própria D. Maria I.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo de Maria I de Portugal',
                            'inicio' => '1788-12-15',
                            'fim' => '1801-01-06',
                            'sinopse' => '<p><span>O 2.º governo de Maria I de Portugal, constituído a 15 de Dezembro de 1788 e substituído a 6 de Janeiro de 1801, foi presidido por José de Seabra da Silva, na qualidade de secretário de Estado dos Negócios Interiores do Reino (se bem que o cargo de chefe de governo não estava ainda definido), sendo o executivo encabeçado pela própria D. Maria I. Após 1792, o Príncipe D. João passou a assumir o despacho em nome de sua mãe e, após 1799, passou a assinar a título próprio, na qualidade de Príncipe Regente.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo da regência do Príncipe D. João',
                            'inicio' => '1801-01-06',
                            'fim' => '1804-04-15',
                            'sinopse' => '<p><span>O 1.º governo da regência do Príncipe D. João, constituído a 6 de Janeiro de 1801 e exonerado a 15 de Abril de 1804, foi presidido pelo Duque de Lafões, na qualidade de ministro assistente ao despacho (se bem que o cargo de chefe de governo não estava ainda definido), sendo o executivo encabeçado pelo próprio D. João, Príncipe Regente, que exercia a regência por incapacidade da rainha D. Maria I.</span></p>
                                        <p><span>A 6 de Janeiro de 1801, as secretarias de Estado dos Negócios da Guerra e a dos Negócios Estrangeiros foram separadas, mas logo se voltaram a unir em 23 de Julho de 1801.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo da regência do Príncipe D. João',
                            'inicio' => '1804-04-15',
                            'fim' => '1807-11-26',
                            'sinopse' => '<p><span>O 2.º governo da regência do Príncipe D. João, constituído a 15 de Abril de 1804 e exonerado a 26 de Novembro de 1807, foi presidido pelo Conde de Vila Verde e, mais tarde, pelo futuro Conde da Barca, na qualidade de ministro assistente ao despacho (se bem que o cargo de chefe de governo não estava ainda definido), sendo o executivo encabeçado pelo próprio D. João, Príncipe Regente, que exercia a regência por incapacidade da rainha D. Maria I.</span></p>',
                        ],
                        [
                            'nome' => 'Conselho de Regência de 1807',
                            'inicio' => '1807-11-26',
                            'fim' => '1808-02-01',
                            'sinopse' => '<p><span>O Conselho de Regência de 1807 é a designação pela qual ficou conhecido o Conselho de Regência ordenado pelo Príncipe Regente D. João a 26 de Novembro de 1807, três dias antes da transferência da corte para o Brasil.</span></p>',
                        ],
                        [
                            'nome' => 'Governo Napoleónico',
                            'inicio' => '1808-02-01',
                            'fim' => '1808-08-30',
                            'sinopse' => '<p><span>O Conselho de Governo de 1808, constituído a 1 de Fevereiro de 1808 e exonerado a 30 de Agosto de 1808 (Convenção de Sintra), foi presidido pelo General Jean-Andoche Junot, na qualidade de General-em-Chefe do Exército Francês em Portugal, em nome de Napoleão Bonaparte, Imperador dos Franceses e Rei da Itália.</span></p>',
                        ],
                        [
                            'nome' => 'Junta Provisional',
                            'inicio' => '1808-08-30',
                            'fim' => '1808-09-26',
                            'sinopse' => '<p><span>A Junta Provisional do Governo Supremo foi o órgão, sediado no Porto, que que administrou Portugal entre 19 de Junho e 26 de Setembro de 1808, enquanto o Conselho de Regência não se encontrava restabelecido em Lisboa após a intervenção inglesa durante a primeira invasão francesa de Portugal.</span></p>',
                        ],
                        [
                            'nome' => 'Conselho de Regência de 1809',
                            'inicio' => '1809-01-02',
                            'fim' => '1820-08-24',
                            'sinopse' => '<p><span>Este novo conselho, indigitado em 2 de Janeiro de 1809, no Palácio do Rio de Janeiro, no Brasil para Portugal. Por decreto de 24 de Maio de 1810, o Príncipe Regente aceita a demissão do Marquês das Minas e indigita, para além dos Governadores já existentes.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo da regência do Príncipe D. João',
                            'inicio' => '1808-09-26',
                            'fim' => '1817-04-20',
                            'sinopse' => '',
                        ],
                        [
                            'sigla' => 'IV',
                            'nome' => 'Governo de João IV de Portugal',
                            'inicio' => '1817-04-20',
                            'fim' => '1821-07-04',
                            'sinopse' => '<p><span>No Brasil a História de Portugal continua.</span></p>',
                        ],
                    ],
                ],
                [
                    'nome' => 'Primeiro Liberalismo (Vintismo)',
                    'inicio' => '1822-09-24',
                    'fim' => '1828-02-26',
                    'sinopse' => '<p><span>Em 1807, com as invasões francesas, a família real portuguesa exilou-se no Brasil, e a Grã-Bretanha passou a exercer uma forte influência sobre Portugal, nomeadamente por oficiais britânicos, como o marechal Beresford que assumiu o comando das tropas portuguesas. Isso gerou descontentamento entre os portugueses, levando à criação de movimentos de oposição, como a conspiração de 1817, liderada por Gomes Freire de Andrade, que acabou por ser descoberto e executado, tornando-se um símbolo dos ideais liberais.</span></p>
                                    <p><span>O movimento também teve reflexos nas sociedades secretas como o Sinédrio , que, em 1820, protagonizou a Revolução que levou à instauração de um regime constitucional.</span></p>
                                    <p><span>O Vintismo caracteriza-se por ser um período político que durou em Portugal entre 1820 e 1823, marcado pelo radicalismo das soluções liberais e pelo predomínio das Cortes Constituintes, influenciado pela Constituição Espanhola de Cádis.</span></p>
                                    <p><span>Este movimento iniciou-se com o pronunciamento militar do Porto, em agosto de 1820. O objetivo central do Vintismo era a regeneração do país, promovendo uma aliança entre o rei e as forças sociais representadas nas Cortes, na expectativa de criar uma constituição que garantisse uma melhor governação. Assim, o movimento Vintista visava o fim do absolutismo e o estabelecimento de um regime constitucional. No entanto, a independência do Brasil em 1822 foi um golpe para o regime, enfraquecendo a economia portuguesa e provocando uma reação negativa entre os vintistas.</span></p>
                                    <p><span>O Vintismo terminou com a Vilafrancada quando o infante D.Miguel liderou uma sublevação militar que resultou na abolição da Constituição de 1822 e no restabelecimento dos ideais do Antigo Regime, ainda que de forma mitigada.</span></p>',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                    'governos' => [
                        [
                            'nome' => 'Revoluções liberais do Porto e Lisboa',
                            'inicio' => '1820-08-24',
                            'fim' => '1820-09-28',
                            'sinopse' => '<p><span>A Revolução do Porto, também referida como Revolução Liberal do Porto, foi um movimento de cunho liberal que eclodiu a 24 de agosto de 1820 na cidade do Porto e teve repercussões tanto na História de Portugal quanto na História do Brasil. O movimento resultou no retorno (1821) da Corte Portuguesa, que se transferira para o Brasil durante a Guerra Peninsular, e no fim do absolutismo em Portugal, com a ratificação e implementação da primeira Constituição portuguesa (1822).</span></p>
                            <p><span>A revolução espalhou-se rapidamente, sem resistências, para outros centros urbanos do país, consolidando-se com a adesão de Lisboa.</span></p>
                            <p><span>Aqui, a 15 de setembro de 1820, um movimento de oficiais subalternos, desencadeado pelo tenente Aurélio José de Moraes, com o apoio da burguesia e de populares, depôs os Regentes e constituiu um governo interino.</span></p>
                            <p><span>Finalmente, a 28 de setembro, ambos os governos, do Porto e de Lisboa, uniram-se numa única "Junta Provisional do Supremo Governo do Reino", com o encargo de organizar as eleições para as Cortes Constituintes.</span></p>',
                        ],
                        [
                            'nome' => 'Junta Provisional do Governo',
                            'inicio' => '1820-09-28',
                            'fim' => '1821-01-30',
                            'sinopse' => '<p><span>A Junta Provisional do Governo Supremo do Reino foi o governo que administrou Portugal após a Revolução liberal do Porto a 24 de Agosto de 1820. Esta junta era composta por dois órgãos: Junta Provisional do Governo Supremo do Reino e Junta Preparatória das Cortes</span></p>',
                        ],
                        [
                            'nome' => 'Regência de 1821',
                            'inicio' => '1821-01-30',
                            'fim' => '1821-07-04',
                            'sinopse' => '<p><span>A Regência de 1821 (de seu nome oficial e completo Regência do Reino em Nome d\'El-Rei o Senhor D. João VI) é a designação pela qual ficou conhecido o governo de regência designado pelas Cortes Constituintes a 30 de Janeiro de 1821, e exonerado após o regresso de D. João VI do Brasil e nomeação de novo governo, a 4 de Julho de 1821.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo do Vintismo',
                            'inicio' => '1821-07-04',
                            'fim' => '1821-09-07',
                            'sinopse' => '<p><span>O 1.º governo do Vintismo, nomeado a 4 de Julho e exonerado a 7 de Setembro de 1821, foi o primeiro governo após o regresso de D. João VI a Lisboa, após um longo período no Rio de Janeiro.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo do Vintismo',
                            'inicio' => '1821-09-07',
                            'fim' => '1823-05-27',
                            'sinopse' => '<p><span>O 2.º governo do Vintismo foi nomeado a 7 de Setembro de 1821 e exonerado a 27 de Maio de 1823 por ocasião da Vilafrancada.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo do Vintismo',
                            'inicio' => '1823-05-27',
                            'fim' => '1823-06-01',
                            'sinopse' => '<p><span>O 3.º governo do Vintismo, nomeado a 28 de Maio e exonerado a 1 de Junho de 1823, no contexto das convulsões políticas da Vilafrancada, foi inicialmente dominado por José António Faria de Carvalho, na qualidade de Ministro e Secretário de Estado dos Negócios do Reino, tendo este sido substituido por Marciano de Azevedo quando desertou (juntamente com os ministros da Guerra e dos Negócios Estrangeiros, José Maria das Neves Costa e Hermano José Braamcamp do Sobral) para o lado de D. Miguel em Santarém.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo do Regime Joanino',
                            'inicio' => '1823-06-01',
                            'fim' => '1825-01-15',
                            'sinopse' => '<p><span>O 1.º governo do Regime Joanino, nomeado a 1 de Junho de 1823 e exonerado a 15 de Janeiro de 1825, foi presidido por Manuel Inácio Martins Pamplona Corte Real (elevado à condição de Conde de Subserra ao iniciar funções), na qualidade de Ministro Assistente ao Despacho.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo do Regime Joanino',
                            'inicio' => '1825-01-15',
                            'fim' => '1826-08-01',
                            'sinopse' => '<p><span>O 2.º governo do Regime Joanino, nomeado a 15 de Janeiro de 1825 e exonerado a 1 de Agosto de 1826, foi dominado por José Joaquim de Almeida e Araújo Correia de Lacerda e Fernando Luís Pereira de Sousa Barradas, na qualidade de Ministro e Secretário de Estado dos Negócios do Reino, e de Ministro e Secretário de Estado dos Negócios Eclesiásticos e da Justiça, respectivamente.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo da Carta',
                            'inicio' => '1826-08-01',
                            'fim' => '1826-12-06',
                            'sinopse' => '',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo da Carta',
                            'inicio' => '1826-12-06',
                            'fim' => '1826-12-16',
                            'sinopse' => '',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo da Carta',
                            'inicio' => '1826-12-16',
                            'fim' => '1827-06-01',
                            'sinopse' => '',
                        ],
                        [
                            'sigla' => 'IV',
                            'nome' => 'Governo da Carta',
                            'inicio' => '1827-06-01',
                            'fim' => '1827-09-07',
                            'sinopse' => '',
                        ],
                        [
                            'sigla' => 'V',
                            'nome' => 'Governo da Carta',
                            'inicio' => '1827-09-07',
                            'fim' => '1828-02-28',
                            'sinopse' => '',
                        ],
                    ],
                ],
                [
                    'nome' => 'Miguelismo (Monarquia Tradicional)',
                    'inicio' => '1828-02-26',
                    'fim' => '1834-05-26',
                    'sinopse' => '<p><span>Miguelista é, na historiografia portuguesa, um apoiante do chamado Miguelismo, nomeadamente os que lutaram pela legitimidade permanente do Rei Miguel I de Portugal na linha de sucessão ao trono português e que vieram depois a fundar o Partido Legitimista e o Partido Realista que nele se integrou. Estes eram conservadores e portanto partidários duma monarquia tradicional, como forma de governo, em oposição à monarquia constitucional que era proposta pelos liberais portugueses seus opositores (então denominados "malhados").</span></p>
<p><span>Muito do seu pensamento, já a meados do século XX, em Portugal, foi proposto pelo movimento Integralismo Lusitano e pela Causa Monárquica.</span></p>
<p><span>Como forma de combater a Maçonaria, a aparente conspiradora aliada do pensamento liberal e ponto de reunião contra os ideais tradicionalistas, os Miguelistas fundaram igualmente uma organização secreta com a designação Ordem Equestre e Militar de São Miguel da Ala, mas, que pouco depois foi encerrada ao ser desautorizada por vontade do Papa.</span></p>
<p><span>Em 2004, um pretendente do ramo Miguelista, Duarte Pio de Bragança, deslocou-se à sede do Grande Oriente Lusitano (GOL), da Maçonaria Portuguesa, no que constituiu a primeira visita de um descendente da extinta Casa de Bragança a esta instituição maçónica. O grão-mestre António Arnaut declarou publicamente que: "Não há hoje nenhum contencioso entre a Maçonaria e a Casa de Bragança" e acrescentou que a "reconciliação da Maçonaria Portuguesa com a Casa de Bragança" deu-se na ocasião dessa mesma visita de Duarte Pio. António Arnaut também recordou, por exemplo, que o próprio Francisco Correia de Herédia, 1.º Visconde da Ribeira Brava, trisavô de Isabel de Herédia, a esposa de Duarte Pio, integrou o fracassado movimento de 28 de Janeiro de 1908, quatro dias antes do Regicídio, que visava assassinar o rei D. Carlos I e alcançar o derrube da monarquia em Portugal. Muitos tradicionalistas enxergaram as atitudes de Duarte Pio como uma traição à dita causa legitimista.</span></p>',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                    'governos' => [
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo de D. Miguel I',
                            'inicio' => '1828-02-26',
                            'fim' => '1831-06-01',
                            'sinopse' => '<p><span>O 1.º governo do Miguelismo, nomeado a 26 de fevereiro de 1828 e exonerado a 1 de julho de 1831, foi presidido pelo duque de Cadaval, na qualidade de Ministro Assistente ao Despacho, sendo o executivo encabeçado por D. Miguel I de Portugal.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo de D. Miguel I',
                            'inicio' => '1831-06-01',
                            'fim' => '1833-09-22',
                            'sinopse' => '<p><span>O 2.º governo do Miguelismo, nomeado a no final de julho de 1831 e exonerado a 22 de setembro de 1833, não teve presidente, ficando extinta a pasta de Ministro Assistente ao Despacho com a demissão do Duque de Cadaval, sendo o executivo encabeçado por D. Miguel I de Portugal.</span></p>
<p><span>Após a tomada de Lisboa pelos liberais a 24 de julho de 1833, o governo vê-se obrigado a estar constantemente em movimento. Por isso, e por os decretos de nomeação e exoneração não terem sido publicados na Gazeta de Lisboa, a sua constituição é de alguma forma imprecisa, com várias dúvidas sobre alguns dos titulares e das datas em que exerceram.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo de D. Miguel I',
                            'inicio' => '1833-09-22',
                            'fim' => '1834-05-26',
                            'sinopse' => '<p><span>O 3.º governo do Miguelismo, nomeado a 22 de setembro de 1833 e exonerado a 26 de maio de 1834 na sequência da Concessão de Evoramonte.</span></p>
<p><span>Não teve presidente, dada a extinção da função de Ministro Assistente ao Despacho a 1 de Julho de 1831, sendo o executivo encabeçado por D. Miguel I de Portugal.</span></p>
<p><span>Após a tomada de Lisboa pelos liberais a 24 de julho de 1833, o governo vê-se obrigado a estar constantemente em movimento. Por isso, e por os decretos de nomeação e exoneração não terem sido publicados na Gazeta de Lisboa, a sua constituição é de alguma forma imprecisa, com várias dúvidas sobre alguns dos titulares e das datas em que exerceram.</span></p>',
                        ],
                    ],
                ],
                [
                    'nome' => 'Segundo Liberalismo (Monarquia Constitucional)',
                    'inicio' => '1834-05-26',
                    'fim' => '1910-10-05',
                    'sinopse' => '<p><span>A aprovação da Constituição Política da Monarquia Portuguesa de 1822, pelas Cortes Gerais e Extraordinárias da Nação Portuguesa, foi resultado direto da Revolução Liberal de 1820 e marcou o início da Monarquia Constitucional no Reino Unido de Portugal, Brasil e Algarves. Esse período deu início ao conhecido como o Primeiro Liberalismo e ficou conhecido como Vintismo.</span></p>
<p><span>Contudo, a Constituição de 1822 tinha um caráter radical, o que gerou descontentamento entre setores mais conservadores da sociedade, com a Vilafrancada, deu-se fim a Constituição de 1822 e ao Vintismo. Com a morte de D. João VI, surgiu um conflito sucessório. O seu filho mais velho, D. Pedro I do Brasil (anteriormente D. Pedro IV de Portugal), já havia declarado a independência do Brasil em 1822 e tornando-se Imperador do Brasil, das consequências da independência formaria o Império do Brasil e o regresso do Reino de Portugal e dos Algarves. Para garantir um regime liberal em Portugal sem abdicar do trono brasileiro, D. Pedro IV promulgou a Carta Constitucional da Monarquia Portuguesa de 1826 para o Reino de Portugal e dos Algarves, criando um sistema bicameral: Câmara dos Digníssimos Pares do Reino e a Câmara dos Senhores Deputados da Nação Portugueza, este período ficou conhecido como o Cartismo. Chamou então o seu irmão, D. Miguel I, que estava exilado, para governar como regente e jurar a Constituição.</span></p>
<p><span>No entanto, D. Miguel I não respeitou o compromisso assumido: retornou a Portugal, colocou fim ao Primeiro Liberalismo, restaurou a monarquia absoluta e assumiu o trono como rei absoluto. Este golpe levou à eclosão da Guerra Civil Portuguesa (1832-1834), um conflito entre os liberais, que defendiam a monarquia constitucional e a Carta de 1826, apoiando D. Pedro IV e sua filha, D. Maria II, e os absolutistas, que apoiavam D. Miguel I e a sua mãe D. Carlota, já falecida em 1830, e a monarquia tradicional.</span></p>
<p><span>Os liberais saíram vitoriosos, dando início ao Segundo Liberalismo, com D. Maria II como rainha de Portugal. Durante esse período, a instabilidade política levou à adoção de uma nova Constituição Política da Monarquia Portuguesa de 1838, com inspiração mais progressista e redução dos poderes da coroa, ficando conhecida como a Constituição Setembrista. A Constituição de 1838 foi o resultado da Revolução de Setembro, que, em 1836, foi uma tentativa de reforma radical promovida por um movimento progressista dentro do Partido Liberal, conhecido os antigos Vintistas e depois Setembristas. Esse movimento conseguiu depor o governo moderado do Duque da Terceira, implementando um regime mais centralizado e democrático, mas ao mesmo tempo gerou divisões internas.</span></p>
<p><span>A situação política continuava instável, e em 1842, um golpe liderado por Costa Cabral, um político moderado, restaurou a Carta Constitucional de 1826, consolidando o poder da monarquia constitucional de caráter mais conservador, conhecido por Cabralismo. Esse golpe e a subsequente restauração da Carta representaram um retorno ao equilíbrio entre os poderes da coroa e do parlamento, mas também reforçaram as tensões internas entre liberais progressistas e moderados.</span></p>
<p><span>Durante esse período, Portugal atravessou vários momentos de conflito político, como a Revolução da Maria da Fonte e a Guerra da Patuleia (1846-1847), um confronto armado entre facções liberais moderadas, os cartistas, e progressistas, os setembristas, apoiadas por diferentes setores da sociedade. A guerra teve repercussões significativas para a estabilidade política do país, culminando em uma intervenção estrangeira para restaurar a ordem. Após isso houve um insurreição militar em 1 de maio de 1851 e deu inicio á Regeneração.</span></p>
<p><span>Durante o resto do século XIX, Portugal atravessou diversas crises políticas e económicas, alternando entre governos mais autoritários e tentativas de maior liberalização. O Partido Regenerador e o Partido Progressista revezaram-se no poder, com ambos os lados tentando modernizar o país e estabilizar o regime. No entanto, a crescente instabilidade e os problemas econômicos do país minaram a confiança no sistema monárquico.</span></p>
<p><span>O sistema monárquico, no entanto, entrou em declínio no final do século XIX e início do século XX. A situação agravou-se com o Regicídio de 1908, de D. Carlos I, quando o rei e o seu filho mais velho, o príncipe herdeiro D. Luís Filipe, foram assassinados. Dois anos depois, em 5 de outubro de 1910, com a ajuda do Partido Republicano, foi proclamada a Implantação da República Portuguesa, pondo fim à monarquia em Portugal.</span></p>',
                    'image_url' => 'https://pt.wikipedia.org/wiki/Ficheiro:Bras%C3%A3o_de_armas_do_reino_de_Portugal.svg#/media/Ficheiro:Bras%C3%A3o_de_armas_do_reino_de_Portugal.svg',
                    'governos' => [
                        [
                            'nome' => 'Governo da Regência',
                            'inicio' => '1830-03-15',
                            'fim' => '1834-09-24',
                            'sinopse' => '<p><span>O Governo da Regência de D. Pedro, nomeado a 15 de março de 1830, na Terceira, Açores, e exonerado a 29 de setembro de 1834, foi o governo português do lado liberal chefiado por D. Pedro, Duque de Bragança (que era regente) em defesa do direito ao trono português por parte da sua filha D. Maria II, durante a Guerra Civil Portuguesa de 1828–1834, e opondo-se à usurpação deste pelo seu irmão D. Miguel.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1834-09-24',
                            'fim' => '1835-05-27',
                            'sinopse' => '<p><span>O 1.º governo da Monarquia Constitucional, ou 1.º governo do Devorismo, nomeado a 24 de setembro de 1834 e exonerado a 27 de maio de 1835, foi liderado pelo duque de Palmela, e posteriormente pelo conde de Linhares. Foi o primeiro governo português a ter efetivamente um chefe de governo entre os seus membros, apesar de este cargo não estar juridicamente definido. Entre os dias 28 de abril e 4 de maio de 1835, a totalidade deste executivo serviu como chefe de governo de Portugal, por ausência de um presidente do Conselho de Ministros. Era constituído por conservadores (palmelistas), e por seguidores de D. Pedro IV pertencentes ao Grande Oriente Lusitano (chamorros).</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1835-05-27',
                            'fim' => '1835-07-15',
                            'sinopse' => '<p><span>O 2.º governo da Monarquia Constitucional, também conhecido como a primeira fase do 2.º governo do Devorismo, também conhecido como governo de fusão, e pejorativamente inicialmente por ministério dos impossíveis, nomeado a 27 de maio de 1835 e exonerado a 15 de julho de 1835, foi presidido pelo marquês de Saldanha, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido. Era um governo de fusão, constituído por elementos da esquerda política e por conservadores.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1835-07-15',
                            'fim' => '1835-11-18',
                            'sinopse' => '<p><span>O 3.º governo da Monarquia Constitucional, também conhecido como a segunda fase do 2.º governo do Devorismo, também conhecido como ministério dos godos, nomeado a 15 de julho de 1835 e exonerado a 18 de novembro de 1835, foi presidido pelo marquês de Saldanha, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido. Era um governo de fusão, constituído por elementos da esquerda política e por conservadores.</span></p>',
                        ],
                        [
                            'sigla' => 'IV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1835-11-18',
                            'fim' => '1836-04-20',
                            'sinopse' => '<p><span>O 4.º governo da Monarquia Constitucional, ou 3.º governo do Devorismo, também conhecido pejorativamente por ministério dos vândalos, nomeado a 18 de novembro de 1835 e exonerado a 20 de abril de 1836, foi presidido, a partir de dia 25 de novembro, por José Jorge Loureiro, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido. De 18 a 25 de novembro, a totalidade do governo deteve o poder executivo, por ausência de um presidente do Conselho de Ministros. O presidente do Conselho de Ministros e ministro e secretário de Estado dos Negócios da Guerra foi exonerado no dia 19 de abril de 1836, sendo substituído nos dois cargos pelo duque da Terceira Os restantes elementos do governo foram exonerados no dia seguinte. Para todos os efeitos, o duque da Terceira conta como chefe do governo seguinte.</span></p>',
                        ],
                        [
                            'sigla' => 'V',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1836-04-20',
                            'fim' => '1836-09-10',
                            'sinopse' => '<p><span>O 5.º governo da Monarquia Constitucional, ou 4.º governo do Devorismo, o último deste período, nomeado a 20 de abril de 1836 e exonerado a 10 de setembro de 1836, foi presidido pelo duque da Terceira (que foi nomeado um dia antes), se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'VI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1836-09-10',
                            'fim' => '1836-11-04',
                            'sinopse' => '<p><span>O 6.º governo da Monarquia Constitucional, ou 1.º governo do Setembrismo, nomeado a 10 de setembro de 1836 e tendo o seu fim a 4 de novembro de 1836 após o golpe da Belenzada, foi presidido pelo conde de Lumiares, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'nome' => 'Gabinete dos Mortos',
                            'inicio' => '1836-11-04',
                            'fim' => '1836-11-05',
                            'sinopse' => '<p><span>Gabinete dos Mortos foi o governo falhado do José Bernardino de Portugal e Castro, o marquês de Valença, nomeado a 4 de novembro de 1836 e exonerado um dia depois (se bem que alguns ministros só o seriam a 6 de novembro), sem ter, no entanto, chegado a tomar posse. O governo resultou da Belenzada, um contra-golpe de inspiração cartista em resposta à revolução de Setembro que impusera o Setembrismo.</span></p>',
                        ],
                        [
                            'sigla' => 'VII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1836-11-05',
                            'fim' => '1837-06-01',
                            'sinopse' => '<p><span>O 7.º governo da Monarquia Constitucional, ou 2.º governo do Setembrismo, nomeado a 5 de novembro de 1836 (se bem que alguns ministros só seriam nomeados a 6 de novembro) e exonerado a 1 de junho de 1837, foi presidido pelo visconde de Sá da Bandeira, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'VIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1837-06-01',
                            'fim' => '1837-08-10',
                            'sinopse' => '<p><span>O 8.º governo da Monarquia Constitucional, ou 3.º governo do Setembrismo, nomeado a 1 de junho de 1837 e exonerado a 10 de agosto de 1837, foi presidido por António Dias de Oliveira (a partir de 2 de junho), se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'IX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1837-08-10',
                            'fim' => '1839-04-18',
                            'sinopse' => '<p><span>O 9.º governo da Monarquia Constitucional, ou 4.º governo do Setembrismo, nomeado a 10 de agosto de 1837 e exonerado a 18 de abril de 1839, foi presidido pelo visconde de Sá da Bandeira, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'X',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1839-04-18',
                            'fim' => '1839-11-26',
                            'sinopse' => '<p><span>O 10.º governo da Monarquia Constitucional, ou 5.º governo do Setembrismo, nomeado a 18 de abril de 1839 e exonerado a 26 de novembro de 1839, foi presidido pelo barão de Sabrosa, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'XI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1839-11-26',
                            'fim' => '1841-06-09',
                            'sinopse' => '<p><span>O 11.º governo da Monarquia Constitucional, ou 6.º governo do Setembrismo, nomeado a 26 de novembro de 1839 e exonerado a 9 de junho de 1841, foi presidido pelo conde do Bonfim, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'XII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1841-06-09',
                            'fim' => '1842-02-07',
                            'sinopse' => '<p><span>O 12.º governo da Monarquia Constitucional, ou 7.º governo do Setembrismo, último governo deste período, nomeado a 9 de junho de 1841 e exonerado a 7 de fevereiro de 1842, foi presidido por Joaquim António de Aguiar, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'XIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1842-02-07',
                            'fim' => '1842-02-09',
                            'sinopse' => '<p><span>O 13.º governo da Monarquia Constitucional, mais conhecido como Governo do Entrudo, foi o executivo presidido pelo Duque de Palmela que governou Portugal por 3 dias, por coincidência os dias em torno do Carnaval, de 7 a 9 de Fevereiro de 1842. Este governo efémero foi formado no contexto da resistência à sublevação político-militar que fora desencadeada a 27 de Janeiro daquele ano sob a liderança de Costa Cabral e que levaria à restauração da Carta Constitucional da Monarquia Portuguesa (por Decreto de 10 de Fevereiro) e ao período conhecido pelo cabralismo.</span></p>',
                        ],
                        [
                            'nome' => 'Junta Provisória de Governo',
                            'inicio' => '1842-02-07',
                            'fim' => '1842-02-09',
                            'sinopse' => '<p><span>A Junta Provisória de Governo foi um órgão revolucionário criado a 27 de janeiro de 1842, na sequência do golpe cartista que restaurou a Carta Constitucional portuguesa de 1826. Era composta por António Bernardo da Costa Cabral, pelo barão da Ponte de Santa Maria, por Marcelino Máximo de Azevedo e Melo e por António Pereira dos Reis. O governo de Joaquim António de Aguiar foi forçado pelo golpe a demitir-se, sendo substituido por um governo de transição chefiado pelo Duque de Palmela intitulado Governo do Entrudo, por ter coincidido com o Carnaval. Este governo esteve no poder entre os dias 7 e 8 de fevereiro de 1842, sendo substituído oficialmente apenas no dia 9 de fevereiro pelo segundo governo do Duque da Terceira. Entre os dias 8 e 9, a Junta Provisória de Governo deteve o poder executivo, sendo chefe de governo de Portugal, a título provisório.</span></p>',
                        ],
                        [
                            'sigla' => 'XIV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1842-02-09',
                            'fim' => '1846-05-20',
                            'sinopse' => '<p><span>O 14.º governo da Monarquia Constitucional, ou 1.º governo da restauração da Carta, nomeado a 9 de fevereiro de 1842 e exonerado a 20 de maio de 1846, foi presidido pelo duque da Terceira, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'XV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1846-05-20',
                            'fim' => '1846-10-06',
                            'sinopse' => '<p><span>O 15.º governo da Monarquia Constitucional, ou 2.º governo da restauração da Carta, nomeado a 20 de maio de 1846 e exonerado a 6 de outubro de 1846, foi presidido pelo duque de Palmela, mas o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'XVI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1846-10-06',
                            'fim' => '1847-12-18',
                            'sinopse' => '<p><span>O 16.º governo da Monarquia Constitucional, ou 3.º governo da restauração da Carta, nomeado a 6 de outubro de 1846 e exonerado a 18 de dezembro de 1847, foi presidido pelo marquês de Saldanha, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido. Entre 28 de abril e 18 de dezembro de 1847, a presidência do Conselho de Ministros de Saldanha foi suspensa devido à participação daquele na guerra da Patuleia, sendo o poder executivo exercido pela totalidade do Conselho de Ministros. Durante esse período, a 4 de novembro de 1846, o título do marquês de Saldanha passou a ducal.</span></p>',
                        ],
                        [
                            'sigla' => 'XVII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1847-12-18',
                            'fim' => '1849-06-18',
                            'sinopse' => '<p><span>O 17.º governo da Monarquia Constitucional, também conhecido como a segunda parte do 3.º governo da restauração da Carta, nomeado a 18 de dezembro de 1847 e exonerado a 18 de junho de 1849, foi presidido pelo duque de Saldanha, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'XVIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1849-06-18',
                            'fim' => '1851-04-26',
                            'sinopse' => '<p><span>O 18.º governo da Monarquia Constitucional, ou 4.º governo da restauração da Carta, nomeado a 18 de junho de 1849 e exonerado a 26 de abril de 1851, foi presidido por António Bernardo da Costa Cabral, conde de Tomar, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido.</span></p>',
                        ],
                        [
                            'sigla' => 'XIX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1851-04-26',
                            'fim' => '1851-05-01',
                            'sinopse' => '<p><span>O 19.º governo da Monarquia Constitucional, ou 5.º governo da restauração da Carta, nomeado a 26 de abril de 1851 e exonerado a 1 de maio de 1851, foi presidido pelo duque da Terceira, se bem que o cargo de presidente do Conselho de Ministros ainda não estava juridicamente definido. Foi um curto governo de transição entre o Cabralismo e a Regeneração.</span></p>',
                        ],
                        [
                            'sigla' => 'XX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1851-05-01',
                            'fim' => '1851-05-22',
                            'sinopse' => '<p><span>O 20.º governo da Monarquia Constitucional, também conhecido como a primeira parte do 1.º governo da Regeneração, nomeado a 1 de maio de 1851 e exonerado a 22 de maio de 1851, foi presidido pelo duque de Saldanha. Este governo foi efetuado em ditadura.</span></p>',
                        ],
                        [
                            'sigla' => 'XXI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1851-05-22',
                            'fim' => '1856-06-06',
                            'sinopse' => '<p><span>O 21.º governo da Monarquia Constitucional, também conhecido como a segunda parte do 1.º governo da Regeneração, nomeado a 22 de maio de 1851 e exonerado a 6 de junho de 1856, foi presidido pelo duque de Saldanha. Numa primeira fase, entre 22 de maio de 1851 e 31 de dezembro de 1852, o governo foi efetuado em ditadura. A partir do Ato Adicional de 5 de julho de 1852, que definia que a nomeação dos deputados seria feita por eleição direta, o governo passa a efetuar eleições.</span></p>
<p><span>Em Fevereiro de 1856, o Partido Histórico põe a correr no país uma forte propaganda contra os novos impostos anunciados pelo Ministro da Fazenda, Fontes Pereira de Melo, recolhendo 50 mil assinaturas. Saldanha pede ao rei D. Pedro V, que havia subido ao trono meses antes, a nomeação de doze Pares. Tendo o rei recusado, Saldanha apresentou a demissão do ministério a 2 de junho.</span></p>',
                        ],
                        [
                            'sigla' => 'XXII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1856-06-06',
                            'fim' => '1859-03-16',
                            'sinopse' => '<p><span>O 22.º governo da Monarquia Constitucional, ou 2.º governo da Regeneração, nomeado a 6 de junho de 1856 e exonerado a 16 de março de 1859, foi presidido pelo marquês de Loulé.</span></p>
<p><span>Logo na sua estreia parlamentar, o governo tido como de Esquerda, declarou a intenção de prosseguir a mesma política do seu antecessor Regenerador, elegendo como principal prioridade do seu programa os melhoramentos técnicos e materiais do país. Este estado de coisas pôs a descoberto uma fractura dentro do Partido Histórico, entre uma tendência inclinada à colaboração com a Direita (a "unha branca") e uma tendência mais radical que insistia na afirmação da autonomia da Esquerda (a "unha negra").</span></p>',
                        ],
                        [
                            'sigla' => 'XXIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1859-03-16',
                            'fim' => '1860-05-01',
                            'sinopse' => '<p><span>O 23.º governo da Monarquia Constitucional, também conhecido como a primeira parte do 3.º governo da Regeneração, nomeado a 16 de março de 1859 e exonerado a 1 de maio de 1860, foi presidido inicialmente pelo duque da Terceira, até à sua morte a 26 de abril de 1860. Entre 26 de abril e 1 de maio, não houve presidente do Conselho de Ministros, sendo este coletivamente liderado pela totalidade do Conselho de Ministros (composto na altura por Fontes Pereira de Melo, Martens Ferrão, Casal Ribeiro e António Serpa).</span></p>',
                        ],
                        [
                            'sigla' => 'XXIV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1860-05-01',
                            'fim' => '1860-07-04',
                            'sinopse' => '<p><span>O 24.º governo da Monarquia Constitucional, também conhecido como a segunda parte do 3.º governo da Regeneração, nomeado a 1 de maio de 1860 e exonerado a 4 de julho de 1860, foi presidido por Joaquim António de Aguiar.</span></p>',
                        ],
                        [
                            'sigla' => 'XXV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1860-07-04',
                            'fim' => '1865-04-17',
                            'sinopse' => '<p><span>O 25.º governo da Monarquia Constitucional, ou 4.º governo da Regeneração, nomeado a 4 de julho de 1860 e exonerado a 17 de abril de 1865, foi presidido pelo marquês de Loulé, sendo interrompido pela presidência interina do visconde de Sá da Bandeira de 12 de setembro a 6 de outubro de 1862. A partir de 3 de outubro de 1862, foi atribuído o título ducal a Loulé.</span></p>',
                        ],
                        [
                            'sigla' => 'XXVI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1865-04-17',
                            'fim' => '1865-09-04',
                            'sinopse' => '<p><span>O 26.º governo da Monarquia Constitucional, ou 5.º governo da Regeneração, nomeado a 17 de abril de 1865 e exonerado a 4 de setembro do mesmo ano, foi presidido pelo marquês de Sá da Bandeira.</span></p>',
                        ],
                        [
                            'sigla' => 'XXVII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1865-09-04',
                            'fim' => '1868-01-04',
                            'sinopse' => '<p><span>O 27.º governo da Monarquia Constitucional, ou 6.º governo da Regeneração, mais conhecido por governo da Fusão por juntar regeneradores e históricos, é a designação dada ao executivo de coligação nomeado a 4 de setembro de 1865 e exonerado a 4 de janeiro de 1868, e presidido por Joaquim António de Aguiar.</span></p>
<p><span>Facto marcante deste governo foi a abolição da pena de morte para os crimes civis, em 1 de julho de 1867, através da promulgação do novo Código Civil.</span></p>
<p><span>Este governo acabaria por cair no início do ano de 1868 na revolta a que se chamou Janeirinha, que tinha por base o protesto contra as leis que criavam o imposto de consumo e procediam à reforma administrativa do território.</span></p>',
                        ],
                        [
                            'sigla' => 'XXVIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1868-01-04',
                            'fim' => '1868-07-22',
                            'sinopse' => '<p><span>O 28.º governo da Monarquia Constitucional, ou 7.º governo da Regeneração, nomeado a 4 de janeiro de 1868 e exonerado a 22 de julho do mesmo ano, foi presidido pelo conde de Ávila. De 14 de janeiro a 19 de março, este governo exerceu o seu poder em ditadura, apenas efetuando eleições a 22 de março. Nestas, o partido do governo em atuação ganhou com grande vantagem. Uma das primeiras medidas foi a revogação da lei sobre o consumo que tinha dado origem à Janeirinha.</span></p>',
                        ],
                        [
                            'sigla' => 'XXIX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1868-07-22',
                            'fim' => '1869-08-11',
                            'sinopse' => '<p><span>O 29.º governo da Monarquia Constitucional, ou 8.º governo da Regeneração, nomeado a 22 de julho de 1868 e exonerado a 11 de agosto de 1869, foi presidido pelo marquês de Sá da Bandeira. De 10 de novembro de 1868 a 24 de abril de 1869, data de eleições, o governo foi feito em ditadura. É considerado o primeiro governo reformista pela medidas tomadas na administração, nomeadamente na saúde e obras públicas. Uma das medidas mais marcantes, foi a abolição da escravatura em 23 de fevereiro de 1869.</span></p>',
                        ],
                        [
                            'sigla' => 'XXX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1869-08-11',
                            'fim' => '1870-05-19',
                            'sinopse' => '<p><span>O 30.º governo da Monarquia Constitucional, ou 9.º governo da Regeneração, nomeado a 11 de agosto de 1869 e exonerado parcialmente a 19 de maio de 1870 (alguns ministros foram exonerados no dia 20), foi presidido pelo duque de Loulé. Foi derrubado pelo golpe de Estado que ficou conhecido por Saldanhada, e que deu início a um novo governo, chefiado pelo duque de Saldanha, apoiado por todas as forças oposicionistas ao governo histórico de Loulé.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1870-05-19',
                            'fim' => '1870-08-29',
                            'sinopse' => '<p><span>O 31.º governo da Monarquia Constitucional, ou 10.º governo da Regeneração, nomeado a 19 de maio de 1870 (alguns ministros foram apenas nomeados no dia 20) e exonerado a 29 de agosto do mesmo ano, foi presidido pelo duque de Saldanha. Foi um governo exercido em ditadura.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1870-08-29',
                            'fim' => '1870-10-29',
                            'sinopse' => '<p><span>O 32.º governo da Monarquia Constitucional, ou 11.º governo da Regeneração, nomeado a 29 de agosto de 1870 e exonerado a 29 de outubro do mesmo ano, foi presidido pelo marquês de Sá da Bandeira. Foi um governo transitório cujo objetivo principal foi a preparação de eleições, que se realizariam a 18 de setembro do mesmo ano. Sá da Bandeira manteve os militares nos quartéis, evitando, assim, a intervenção destes na vida política.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1870-10-29',
                            'fim' => '1871-09-13',
                            'sinopse' => '<p><span>O 33.º governo da Monarquia Constitucional, ou 12.º governo da Regeneração, nomeado a 29 de outubro de 1870 e exonerado a 13 de setembro de 1871, foi presidido pelo marquês de Ávila.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXIV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1871-09-13',
                            'fim' => '1877-03-05',
                            'sinopse' => '<p><span>O 34.º governo da Monarquia Constitucional, ou 1.º governo do Fontismo, e 13.º governo desde a Regeneração, nomeado a 13 de setembro de 1871 e exonerado a 5 de março de 1877, foi presidido por António Maria de Fontes Pereira de Melo.</span></p>
<p><span>Foi um governo que iniciou um novo ciclo político de estabilidade e desenvolvimento, que duraria cerca de cinco anos e meio. Foram efetuadas eleições em 12 de julho de 1874. É um período de novas ideias e movimentos, em que surge a Associação Católica do Porto, o Partido Socialista Português e o Partido Progressista, resultado da fusão do Partido Histórico com o Partido Reformista. É eleito o Directório do Partido Republicano Português. Também neste novo período, é fundada a Sociedade de Geografia de Lisboa, em 1876, e a Caixa Geral de Depósitos.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1877-03-05',
                            'fim' => '1878-01-29',
                            'sinopse' => '<p><span>O 35.º governo da Monarquia Constitucional, ou 1.º governo do Rotativismo, e o 14.º desde a Regeneração, nomeado a 5 de março de 1877 e exonerado a 29 de janeiro de 1878, foi presidido pelo marquês de Ávila.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXVI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1878-01-29',
                            'fim' => '1879-06-01',
                            'sinopse' => '<p><span>O 36.º governo da Monarquia Constitucional, 2.º governo do Rotativismo e 2.º governo do Fontismo, e o 15.º desde a Regeneração, nomeado a 29 de janeiro de 1878 e exonerado a 1 de junho de 1879, foi presidido por António Maria de Fontes Pereira de Melo.</span></p>
<p><span>São realizadas eleições em 13 de novembro de 1878.</span></p>
<p><span>O governo fez várias reformas das quais se destacam a da lei eleitoral, um novo código administrativo e a reforma da Câmara dos Pares. Em 1879, foi assinado um acordo polémico, o Tratado de Lourenço Marques, o qual permitia a presença da marinha britânica nas águas territoriais moçambicanas e o desembarque das suas tropas no porto de Lourenço Marques. A contestação a este tratado, foi uma das causas para a queda do governo.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXVII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1879-06-01',
                            'fim' => '1881-03-25',
                            'sinopse' => '<p><span>O 37.º governo da Monarquia Constitucional, 3.º governo do Rotativismo, e o 16.º desde a Regeneração, nomeado a 1 de junho de 1879 e exonerado a 25 de março de 1881, foi presidido por Anselmo José Braamcamp.</span></p>
<p><span>São realizadas eleições em 19 de outubro de 1879.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXVIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1881-03-25',
                            'fim' => '1881-11-14',
                            'sinopse' => '<p><span>O 38.º governo da Monarquia Constitucional, também conhecido como a primeira fase do 4.º governo do Rotativismo, do 3.º governo do Fontismo e do 17.º desde a Regeneração, nomeado a 25 de março de 1881 e exonerado a 14 de novembro do mesmo ano, foi presidido por António Rodrigues Sampaio.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXIX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1881-11-14',
                            'fim' => '1883-10-24',
                            'sinopse' => '<p><span>O 39.º governo da Monarquia Constitucional, também conhecido como a segunda fase do 4.º governo do Rotativismo, do 3.º governo do Fontismo e do 17.º desde a Regeneração, nomeado a 14 de novembro de 1881, foi presidido por António Maria de Fontes Pereira de Melo.</span></p>',
                        ],
                        [
                            'sigla' => 'XL',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1883-10-24',
                            'fim' => '1886-02-20',
                            'sinopse' => '<p><span>O 40.º governo da Monarquia Constitucional, também conhecido como a terceira fase do 4.º governo do Rotativismo, do 3.º governo do Fontismo e do 17.º desde a Regeneração, nomeado a 24 de outubro de 1883 e exonerado a 20 de fevereiro de 1886, foi presidido por António Maria de Fontes Pereira de Melo.</span></p>',
                        ],
                        [
                            'sigla' => 'XLI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1886-02-20',
                            'fim' => '1890-01-14',
                            'sinopse' => '<p><span>O 41.º governo da Monarquia Constitucional e 5.º governo do Rotativismo, e 18.º desde a Regeneração, nomeado a 20 de fevereiro de 1886 e exonerado a 14 de janeiro de 1890, foi presidido por José Luciano de Castro.</span></p>',
                        ],
                        [
                            'sigla' => 'XLII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1890-01-14',
                            'fim' => '1890-10-13',
                            'sinopse' => '<p><span>O 42.º governo da Monarquia Constitucional, 6.º governo do Rotativismo, e do 19.º desde a Regeneração, nomeado a 14 de janeiro de 1890 e exonerado a 13 de outubro de 1890, foi presidido por António Serpa.</span></p>',
                        ],
                        [
                            'sigla' => 'XLIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1890-10-13',
                            'fim' => '1891-05-21',
                            'sinopse' => '<p><span>O 43.º governo da Monarquia Constitucional, também conhecido como a primeira fase do 7.º governo do Rotativismo, e do 20.º desde a Regeneração, nomeado a 13 de outubro de 1890 e exonerado a 21 de maio de 1891, foi presidido por João Crisóstomo.</span></p>',
                        ],
                        [
                            'sigla' => 'XLIV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1891-05-21',
                            'fim' => '1892-01-17',
                            'sinopse' => '<p><span>O 44.º governo da Monarquia Constitucional, também conhecido como a segunda fase do 7.º governo do Rotativismo, e do 20.º desde a Regeneração, nomeado a 21 de maio de 1891 e exonerado a 17 de janeiro de 1892, foi presidido por João Crisóstomo.</span></p>',
                        ],
                        [
                            'sigla' => 'XLV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1892-01-17',
                            'fim' => '1892-05-27',
                            'sinopse' => '<p><span>O 45.º governo da Monarquia Constitucional, também conhecido como a primeira fase do 8.º governo do Rotativismo, e do 21.º desde a Regeneração, nomeado a 17 de janeiro de 1892 e exonerado a 27 de maio do mesmo ano, foi presidido por José Dias Ferreira.</span></p>',
                        ],
                        [
                            'sigla' => 'XLVI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1892-05-27',
                            'fim' => '1893-02-22',
                            'sinopse' => '<p><span>O 46.º governo da Monarquia Constitucional, também conhecido como a segunda fase do 8.º governo do Rotativismo, e do 21.º desde a Regeneração, nomeado a 27 de maio de 1892 e exonerado a 22 de fevereiro de 1893, foi presidido por José Dias Ferreira.</span></p>',
                        ],
                        [
                            'sigla' => 'XLVII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1893-02-22',
                            'fim' => '1897-02-07',
                            'sinopse' => '<p><span>O 47.º governo da Monarquia Constitucional, 9.º governo do Rotativismo, e do 22.º desde a Regeneração, nomeado a 22 de fevereiro de 1893 e exonerado a 7 de fevereiro de 1897, foi presidido por Ernesto Hintze Ribeiro.</span></p>',
                        ],
                        [
                            'sigla' => 'XLVIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1897-02-07',
                            'fim' => '1898-08-18',
                            'sinopse' => '<p><span>O 48.º governo da Monarquia Constitucional, também conhecido como a primeira fase do 10.º governo do Rotativismo, e do 23.º desde a Regeneração, nomeado a 7 de fevereiro de 1897 e exonerado a 18 de agosto de 1898, foi presidido por José Luciano de Castro.</span></p>',
                        ],
                        [
                            'sigla' => 'XLVIX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1898-08-18',
                            'fim' => '1900-06-25',
                            'sinopse' => '<p><span>O 49.º governo da Monarquia Constitucional, também conhecido como a segunda fase do 10.º governo do Rotativismo, e do 23.º desde a Regeneração, nomeado a 18 de agosto de 1898 e exonerado a 25 de junho de 1900, foi presidido por José Luciano de Castro.</span></p>',
                        ],
                        [
                            'sigla' => 'L',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1900-06-25',
                            'fim' => '1903-02-28',
                            'sinopse' => '<p><span>O 50.º governo da Monarquia Constitucional e também conhecido como a primeira fase do 24.º governo desde a Regeneração, nomeado a 25 de junho de 1900 e exonerado a 28 de fevereiro de 1903, foi presidido por Ernesto Hintze Ribeiro.</span></p>',
                        ],
                        [
                            'sigla' => 'LI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1903-02-28',
                            'fim' => '1904-10-20',
                            'sinopse' => '<p><span>O 51.º governo da Monarquia Constitucional e também conhecido como a segunda fase do 24.º governo desde a Regeneração, nomeado a 28 de fevereiro de 1903 e exonerado a 20 de outubro de 1904, foi presidido por Ernesto Hintze Ribeiro.</span></p>',
                        ],
                        [
                            'sigla' => 'LII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1904-10-20',
                            'fim' => '1905-12-27',
                            'sinopse' => '<p><span>O 52.º governo da Monarquia Constitucional e também conhecido como a primeira fase do 25.º governo desde a Regeneração, nomeado a 20 de outubro de 1904 e exonerado a 27 de dezembro de 1905, foi presidido por José Luciano de Castro.</span></p>',
                        ],
                        [
                            'sigla' => 'LIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1905-12-27',
                            'fim' => '1906-03-20',
                            'sinopse' => '<p><span>O 53.º governo da Monarquia Constitucional e também conhecido como a segunda fase do 25.º governo desde a Regeneração, nomeado a 27 de dezembro de 1905 e exonerado a 20 de março de 1906, foi presidido por José Luciano de Castro.</span></p>',
                        ],
                        [
                            'sigla' => 'LIV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1906-03-20',
                            'fim' => '1906-05-19',
                            'sinopse' => '<p><span>O 54.º governo da Monarquia Constitucional e 25.º governo desde a Regeneração, nomeado a 20 de março de 1906 e exonerado a 19 de maio do mesmo ano, foi presidido por Ernesto Hintze Ribeiro.</span></p>',
                        ],
                        [
                            'sigla' => 'LV',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1906-05-19',
                            'fim' => '1908-02-04',
                            'sinopse' => '<p><span>O 55.º governo da Monarquia Constitucional e 27.º governo desde a Regeneração, nomeado a 19 de maio de 1906 e exonerado a 4 de fevereiro de 1908 (na sequência do Regicídio de 1908), foi presidido por João Franco.</span></p>',
                        ],
                        [
                            'sigla' => 'LVI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1908-02-04',
                            'fim' => '1908-12-25',
                            'sinopse' => '<p><span>O 56.º governo da Monarquia Constitucional e 28.º governo desde a Regeneração, também conhecido como governo da acalmação, nomeado a 4 de fevereiro de 1908 e exonerado a 25 de dezembro do mesmo ano, foi presidido por Francisco Ferreira do Amaral.</span></p>',
                        ],
                        [
                            'sigla' => 'LVII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1908-12-25',
                            'fim' => '1909-04-11',
                            'sinopse' => '<p><span>O 57.º governo da Monarquia Constitucional e 29.º governo desde a Regeneração, nomeado a 25 de dezembro de 1908 e exonerado a 11 de abril de 1909, foi presidido por Artur de Campos Henriques.</span></p>',
                        ],
                        [
                            'sigla' => 'LVIII',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1908-04-11',
                            'fim' => '1909-05-14',
                            'sinopse' => '<p><span>O 58.º governo da Monarquia Constitucional e 30.º governo desde a Regeneração, nomeado a 11 de abril de 1909 e exonerado a 14 de maio do mesmo ano, foi presidido por Sebastião Teles.</span></p>',
                        ],
                        [
                            'sigla' => 'LVIX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1908-05-14',
                            'fim' => '1909-12-22',
                            'sinopse' => '<p><span>O 59.º governo da Monarquia Constitucional e 31.º governo desde a Regeneração, nomeado a 14 de maio de 1909 e exonerado a 22 de dezembro do mesmo ano, foi presidido por Venceslau de Lima.</span></p>',
                        ],
                        [
                            'sigla' => 'LX',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1909-12-22',
                            'fim' => '1910-06-26',
                            'sinopse' => '<p><span>O 60.º e penúltimo governo da Monarquia Constitucional e 32.º governo desde a Regeneração, nomeado a 22 de dezembro de 1909 e exonerado a 26 de junho de 1910, foi presidido por Francisco da Veiga Beirão.</span></p>',
                        ],
                        [
                            'sigla' => 'LXI',
                            'nome' => 'Governo da Monarquia Constitucional',
                            'inicio' => '1910-06-26',
                            'fim' => '1910-10-05',
                            'sinopse' => '<p><span>O 61.º e último governo da Monarquia Constitucional e 33.º governo desde a Regeneração, nomeado a 26 de junho de 1910 e exonerado a 5 de outubro de 1910 (após a revolução republicana), foi presidido por António Teixeira de Sousa.</span></p>',
                        ],
                    ],
                ],
                [
                    'nome' => 'Primeira República Portuguesa',
                    'inicio' => '1910-10-05',
                    'fim' => '1926-05-30',
                    'sinopse' => '',
                    'image_url' => 'https://pt.wikipedia.org/wiki/Ficheiro:Coat_of_arms_of_Portugal.svg#/media/Ficheiro:Coat_of_arms_of_Portugal.svg',
                    'governos' => [
                        [
                            'nome' => 'Governo Provisório da República Portuguesa',
                            'inicio' => '1910-10-05',
                            'fim' => '1911-09-04',
                            'sinopse' => '<p><span>O Governo Provisório da República Portuguesa foi o directório que, após a proclamação da República Portuguesa em 5 de Outubro de 1910, ficou encarregado de dirigir superiormente a Nação até que fosse aprovada uma nova Lei fundamental. O Governo Provisório manteve-se em funções até à aprovação da nova constituição (a Constituição de 1911), em 24 de Agosto de 1911, dando por encerrados os seus trabalhos e auto-dissolvendo-se a 4 de Setembro, quando deu lugar ao primeiro governo constitucional, chefiado por João Chagas.</span></p>
<p><span>Também se chamaram de Governos Provisórios da República Portuguesa os primeiros seis governos empossados pelos presidentes da República nomeados pela Junta de Salvação Nacional, organismo que vinha previsto no programa do Movimento das Forças Armadas para o exercício político, até à formação de um governo civil, para precaver a destituição imediata do Presidente da República (o almirante Américo Thomaz) e Governo, dissolução da Assembleia Nacional e do Conselho de Estado, promulgando a Lei Constitucional n.º 1/74, de 25 de Abril e, após os acontecimentos de 11 de Março de 1975 e de a JSN ter sido extinta, pelo Conselho da Revolução.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1911-09-04',
                            'fim' => '1911-11-12',
                            'sinopse' => '<p><span>O Governo Provisório da República Portuguesa foi o directório que, após a proclamação da República Portuguesa em 5 de Outubro de 1910, ficou encarregado de dirigir superiormente a Nação até que fosse aprovada uma nova Lei fundamental. O Governo Provisório manteve-se em funções até à aprovação da nova constituição (a Constituição de 1911), em 24 de Agosto de 1911, dando por encerrados os seus trabalhos e auto-dissolvendo-se a 4 de Setembro, quando deu lugar ao primeiro governo constitucional, chefiado por João Chagas.</span></p>
<p><span>Também se chamaram de Governos Provisórios da República Portuguesa os primeiros seis governos empossados pelos presidentes da República nomeados pela Junta de Salvação Nacional, organismo que vinha previsto no programa do Movimento das Forças Armadas para o exercício político, até à formação de um governo civil, para precaver a destituição imediata do Presidente da República (o almirante Américo Thomaz) e Governo, dissolução da Assembleia Nacional e do Conselho de Estado, promulgando a Lei Constitucional n.º 1/74, de 25 de Abril e, após os acontecimentos de 11 de Março de 1975 e de a JSN ter sido extinta, pelo Conselho da Revolução.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1911-11-12',
                            'fim' => '1912-06-16',
                            'sinopse' => '<p><span>O 3.º governo da Primeira República Portuguesa, também conhecido como Governo da Concentração, chefiado pelo presidente do Ministério Augusto de Vasconcelos, foi o Governo de Portugal nomeado a 12 de novembro de 1911 (tendo tomado posse no dia seguinte, e apenas sido publicado o decreto de nomeação em Diário do Governo nesse dia) e exonerado e terminado o seu mandato a 16 de junho de 1912 (tendo o decreto de exoneração só sido publicado em Diário do Governo no dia 17 de junho).</span></p>',
                        ],
                        [
                            'sigla' => 'IV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1912-06-16',
                            'fim' => '1913-01-09',
                            'sinopse' => '<p><span>O 4.º governo da Primeira República Portuguesa, chefiado pelo presidente do Ministério Duarte Leite, foi o Governo de Portugal nomeado a 16 de junho de 1912 (tendo nesse dia tomado posse, se bem que o decreto de nomeação só tenha sido publicado em Diário do Governo no dia seguinte) e exonerado e terminado o seu mandato a 9 de janeiro de 1913 (tendo o decreto de exoneração sido publicado apenas no dia seguinte). Por um curto período (23 de setembro a 30 de setembro/1 de outubro de 1912), Duarte Leite foi substituído interinamente pelo ministro dos Negócios Estrangeiros Augusto de Vasconcelos na presidência do Ministério.</span></p>',
                        ],
                        [
                            'sigla' => 'V',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1913-01-09',
                            'fim' => '1914-02-09',
                            'sinopse' => '<p><span>O 5.º governo da Primeira República Portuguesa, nomeado a 9 de janeiro de 1913 e exonerado a 9 de fevereiro de 1914, foi liderado por Afonso Costa. Foi o primeiro governo democrático, com eleições para os deputados a 16 de novembro de 1913, e eleições para os corpos administrativos a 30 de Novembro.</span></p>',
                        ],
                        [
                            'sigla' => 'VI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1914-02-09',
                            'fim' => '1914-06-23',
                            'sinopse' => '<p><span>O 6.º governo da Primeira República Portuguesa, nomeado a 9 de fevereiro de 1914 e exonerado a 23 de junho de 1914, foi liderado por Bernardino Machado. Seguiu-se-lhe um novo governo de Bernardino Machado, que durou de 23 de junho a 12 de dezembro de 1914.</span></p>',
                        ],
                        [
                            'sigla' => 'VII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1914-06-23',
                            'fim' => '1914-12-12',
                            'sinopse' => '<p><span>O 7.º governo da Primeira República Portuguesa, nomeado a 23 de junho de 1914 e exonerado a 12 de dezembro de 1914, foi liderado por Bernardino Machado, sendo o segundo governo consecutivo liderado pelo futuro presidente da República.</span></p>',
                        ],
                        [
                            'sigla' => 'VIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1914-12-12',
                            'fim' => '1915-01-25',
                            'sinopse' => '<p><span>O 8.º governo da Primeira República Portuguesa, nomeado a 12 de dezembro de 1914 e exonerado a 25 de janeiro de 1915, foi liderado por Vítor Hugo de Azevedo Coutinho. Ficou conhecido como o Governo dos Miseráveis de Vítor Hugo.</span></p>',
                        ],
                        [
                            'sigla' => 'IX',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1915-01-25',
                            'fim' => '1915-05-15',
                            'sinopse' => '<p><span>O 9.º governo da Primeira República Portuguesa, nomeado a 25 de janeiro de 1915 e exonerado a 15 de maio de 1915, foi liderado por Joaquim Pimenta de Castro, acumulando este todas as pastas interinamente entre 25 e 28 de janeiro. Ficou conhecido por Governo da Ditadura Militar.</span></p>',
                        ],
                        [
                            'nome' => 'Junta Constitucional de 1915',
                            'inicio' => '1915-05-14',
                            'fim' => '1915-05-17',
                            'sinopse' => '<p><span>A Junta Constitucional de 1915, também conhecida como Junta Revolucionária foi um órgão provisório formado após o golpe militar de 14 de Maio de 1915, que destituiu o governo do general Joaquim Pimenta de Castro. Um dos objectivos do golpe era forçar a participação de Portugal na Grande Guerra, o que foi conseguido. Governou apenas três dias, até 17 de Maio, já que cessou funções com a tomada de posse do ministério presidido interinamente por José de Castro (o presidente do Ministério nomeado era João Chagas, que foi impedido de tomar posse após sofrer um atentado), que mais tarde viria a ocupar efetivamente o cargo. Neste curto período, a Junta foi encarregada de supervisionar todos os departamentos governamentais, até à tomada de posse dos respetivos ministros do 10.º governo republicano.</span></p>
                                            <p><span>Os membros da Junta Constitucional estavam ligados ao agrupamento Jovem Turquia, que coorganizou o movimento de 14 de Maio de 1915. Jovem Turquia foi um grupo de oficiais do Exército Português liderados por Álvaro de Castro e afectos ao Partido Democrático. Este grupo organizou-se em torno da loja maçónica Jovem Turquia, da qual adoptou o nome. Os jovens turcos, como eram conhecidos, tiveram um papel relevante nos acontecimentos revolucionários de 1915 e na cadeia de eventos que levou Portugal a declarar guerra à Alemanha e a entrar na Primeira Guerra Mundial.</span></p>',
                        ],
                        [
                            'sigla' => 'X',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1915-05-17',
                            'fim' => '1915-07-19',
                            'sinopse' => '<p><span>O 10.º governo da Primeira República Portuguesa, nomeado a 15 de maio de 1915 e exonerado a 19 de junho do mesmo ano, foi liderado nominalmente por João Chagas. No entanto, no dia 17 de maio o presidente do Ministério sofreu um atentado que o cegaria de um olho, não chegando a tomar oficialmente posse. O ministro da Instrução Pública indigitado, José de Castro ocupou interinamente o cargo de presidente do Ministério até à exoneração do governo a 19 de junho, para tomar posse como presidente efetivo do 11.º ministério, que duraria até 29 de novembro.</span></p>',
                        ],
                        [
                            'sigla' => 'XI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1915-07-19',
                            'fim' => '1915-11-29',
                            'sinopse' => '<p><span>O 11.º governo da Primeira República Portuguesa, nomeado a 19 de junho de 1915 e exonerado a 29 de novembro do mesmo ano, foi liderado por José de Castro. No anterior governo, José de Castro servira como presidente interino do Ministério, em substituição de João Chagas que sofrera um atentado impossibilitando-o de tomar posse.</span></p>',
                        ],
                        [
                            'sigla' => 'XII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1915-11-29',
                            'fim' => '1916-03-15',
                            'sinopse' => '<p><span>O 12.º governo da Primeira República Portuguesa, nomeado a 29 de novembro de 1915 e exonerado a 15 de março de 1916, foi liderado por Afonso Costa. Daria lugar ao chamado Governo da União Sagrada.</span></p>',
                        ],
                        [
                            'sigla' => 'XIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1916-03-15',
                            'fim' => '1917-04-25',
                            'sinopse' => '<p><span>O 13.º governo da Primeira República Portuguesa, também conhecido como Ministério da União Sagrada, ou simplesmente União Sagrada, nomeado a 15 de março de 1916 e exonerado a 25 de abril de 1917, foi liderado por António José de Almeida. Para fazer face à participação portuguesa na I Guerra Mundial, tinha, por base, a união de todos os partidos políticos portugueses como resposta à nova conjuntura imposta pelos alemães. Na prática, apenas dois partidos se uniram: o Partido Democrático, liderado por Afonso Costa, e o Partido Republicano Evolucionista, de António José de Almeida. Seria este último o seu presidente.</span></p>
<p><span>Esta união durou até 25 de Abril de 1917, constituindo um dos governos que mais tempo esteve em funções (cerca de 406 dias), durante a Primeira República Portuguesa.</span></p>',
                        ],
                        [
                            'sigla' => 'XIV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1917-04-25',
                            'fim' => '1917-12-10',
                            'sinopse' => '<p><span>O 14.º governo da Primeira República Portuguesa, nomeado a 25 de abril de 1917 e exonerado a 10 de dezembro de 1917, foi liderado por Afonso Costa.</span></p>',
                        ],
                        [
                            'nome' => 'Junta Revolucionária de 1917',
                            'inicio' => '1917-12-08',
                            'fim' => '1917-12-12',
                            'sinopse' => '<p><span>A Junta Revolucionária de 1917 foi um órgão governamental provisório criado no decurso do golpe de Estado de 5–8 de dezembro de 1917 liderado por Sidónio Pais. Era composta pelo próprio Sidónio Pais (presidente), por António Machado Santos (vogal) e por Feliciano da Costa (vogal). Foi criada a 8 de dezembro, tendo substituído Afonso Costa e o seu 3.º governo (na altura liderado interinamente por José Norton de Matos), na chefia do governo de Portugal. Seria extinta a 12 de dezembro de 1917, já com Sidónio Pais na chefia do 15.º governo republicano (desde 11 de dezembro) acumulando ele mesmo interinamente a chefia do Estado a partir desse dia. Enquanto ocupou interinamente o poder executivo, a Junta supervisionou todas as pastas ministeriais.</span></p>',
                        ],
                        [
                            'sigla' => 'XV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1917-12-11',
                            'fim' => '1918-05-15',
                            'sinopse' => '<p><span>O 15.º governo da Primeira República Portuguesa, nomeado a 11 de dezembro de 1917 e exonerado a 15 de maio de 1918, foi o primeiro Ministério liderado por Sidónio Pais. Neste período a totalidade do executivo serviu como chefe de Estado após a demissão de Bernardino Machado a 12 de dezembro de 1917. A 27 de dezembro do mesmo ano foram atribuídas as prerrogativas de Presidente da República ao seu presidente, Sidónio Pais. A partir de 9 de maio de 1918, este deixou de ser presidente do Ministério, chefiando o executivo a partir do cargo de Presidente da República efetivo.</span></p>',
                        ],
                        [
                            'sigla' => 'XVI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1918-05-15',
                            'fim' => '1918-12-23',
                            'sinopse' => '<p><span>O 16.º governo da Primeira República Portuguesa, nomeado a 15 de maio de 1918 e exonerado a 23 de dezembro de 1918, foi liderado por Sidónio Pais (na sua capacidade de presidente da República). Neste governo, ao invés do cargo de ministros, os seus membros foram oficialmente designados secretários de Estado. Após o assassinato de Sidónio Pais a 14 de dezembro de 1918, o Ministério investiu-se na totalidade do poder executivo e elegeu para seu novo presidente o até ao momento secretário de Estado da Marinha, João do Canto e Castro, a 15 de dezembro. Entre 14 e 15 de dezembro, a totalidade do Ministério serviu como chefe de Estado e de governo. Entre 15 e 16 de dezembro, Canto e Castro foi chefe de Estado ex officio por inerência do cargo de presidente do Ministério, tendo a 16 sido eleito presidente da República, abandonando o primeiro,[1] não tendo, contudo, sido exonerado do mesmo (tal como havia sucedido com Sidónio Pais quando foi investido no cargo de presidente da República).</span></p>',
                        ],
                        [
                            'sigla' => 'XVII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1918-12-23',
                            'fim' => '1919-01-07',
                            'sinopse' => '<p><span>O 17.º governo da Primeira República Portuguesa, nomeado a 23 de dezembro de 1918 e exonerado a 7 de janeiro de 1919, foi liderado por João Tamagnini Barbosa.</span></p>',
                        ],
                        [
                            'sigla' => 'XVIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1919-01-07',
                            'fim' => '1919-01-27',
                            'sinopse' => '<p><span>O 18.º governo da Primeira República Portuguesa, nomeado a 7 de janeiro de 1919 e exonerado a 27 de janeiro do mesmo ano, foi o segundo governo liderado por João Tamagnini Barbosa.</span></p>',
                        ],
                        [
                            'sigla' => 'XIX',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1919-01-07',
                            'fim' => '1919-03-30',
                            'sinopse' => '<p><span>O 19.º governo da Primeira República Portuguesa, nomeado a 27 de janeiro de 1919 e exonerado a 30 de março de 1919, foi liderado por José Relvas. Por se seguir aos governos sidonistas, ficou conhecido por Governo da Desforra.</span></p>',
                        ],
                        [
                            'sigla' => 'XX',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1919-03-30',
                            'fim' => '1919-06-29',
                            'sinopse' => '<p><span>O 20.º governo da Primeira República Portuguesa, nomeado a 30 de março de 1919 e exonerado a 29 de junho de 1919, foi liderado por Domingos Pereira.</span></p>',
                        ],
                        [
                            'sigla' => 'XXI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1919-06-29',
                            'fim' => '1920-01-21',
                            'sinopse' => '<p><span>O 21.º governo da Primeira República Portuguesa foi nomeado a 29 de junho de 1919 e exonerado a 15 de janeiro de 1920, sendo no mesmo dia reempossado devido à queda do governo de Francisco Fernandes Costa que havia sido nomeado e exonerado nesse dia sem tomar posse. O 21.º governo republicano manteve-se sempre em funções, tendo a sua exoneração de 15 de janeiro sido anulada, sendo apenas efetivamente exonerado a 21 de janeiro de 1920, cinco dias depois. Foi liderado por Alfredo de Sá Cardoso.</span></p>',
                        ],
                        [
                            'sigla' => 'XXII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1920-01-15',
                            'fim' => '1920-01-15',
                            'sinopse' => '<p><span>O 22.º governo da Primeira República Portuguesa, nomeado a 15 de janeiro de 1920 e exonerado no mesmo dia sem tomar posse, foi liderado por Francisco Fernandes Costa. Ficou conhecido como o Governo dos Cinco Minutos.</span></p>
<p><span>O governo não chega a tomar posse, face a uma manifestação de rua, comandada pela ala radical do Partido Democrático, a chamada Formiga Branca, que havia sido organizada pelo antigo governador civil de Lisboa, Daniel Rodrigues. Os nomeados ministros, antes de tomar posse estavam reunidos no edifício da Junta de Crédito Público e foram alvo de uma manifestação hostil. Fernandes Costa logo desistiu. No mesmo dia há uma tentativa de assalto ao jornal A Luta, tendo o indigitado ministro do interior, António Granjo, que defender o jornal de pistola na mão. O mesmo Granjo segue depois para defender o jornal A República.</span></p>
<p><span>Foi imediatamente reconduzido o anterior gabinete de Sá Cardoso.</span></p>',
                        ],
                        [
                            'sigla' => 'XXIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1920-01-21',
                            'fim' => '1920-03-08',
                            'sinopse' => '<p><span>O 23.º governo da Primeira República Portuguesa, nomeado a 21 de janeiro de 1920 e exonerado a 8 de março do mesmo ano, foi liderado por Domingos Pereira.</span></p>',
                        ],
                        [
                            'sigla' => 'XXIV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1920-03-08',
                            'fim' => '1920-06-26',
                            'sinopse' => '<p><span>O 24.º governo da Primeira República Portuguesa, nomeado a 8 de março de 1920 e exonerado a 26 de junho de 1920, foi liderado inicialmente por António Maria Baptista e, após a morte deste, interinamente por José Ramos Preto no dia 6 de junho, e efetivamente por este último de 6 a 26 de junho do mesmo ano.</span></p>',
                        ],
                        [
                            'sigla' => 'XXV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1920-06-26',
                            'fim' => '1920-07-19',
                            'sinopse' => '<p><span>O 25.º governo da Primeira República Portuguesa, nomeado a 26 de junho de 1920 e exonerado a 19 de julho de 1920, foi liderado por António Maria da Silva.</span></p>',
                        ],
                        [
                            'sigla' => 'XXVI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1920-07-19',
                            'fim' => '1920-11-20',
                            'sinopse' => '<p><span>O 26.º governo da Primeira República Portuguesa, nomeado a 19 de julho de 1920 e exonerado a 20 de novembro do mesmo ano, foi liderado por António Granjo.</span></p>',
                        ],
                        [
                            'sigla' => 'XXVII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1920-11-20',
                            'fim' => '1920-11-30',
                            'sinopse' => '<p><span>O 27.º governo da Primeira República Portuguesa, nomeado a 20 de novembro de 1920 e exonerado dez dias depois a 30 de novembro do mesmo ano, foi liderado por Álvaro de Castro.</span></p>',
                        ],
                        [
                            'sigla' => 'XXVIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1920-11-30',
                            'fim' => '1921-03-02',
                            'sinopse' => '<p><span>O 28.º governo da Primeira República Portuguesa, nomeado a 30 de novembro de 1920 e exonerado a 2 de março de 1921, foi liderado por Liberato Pinto.</span></p>',
                        ],
                        [
                            'sigla' => 'XXIX',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1921-03-02',
                            'fim' => '1921-05-23',
                            'sinopse' => '<p><span>O 29.º governo da Primeira República Portuguesa, nomeado a 2 de março de 1921 e exonerado a 23 de maio do mesmo ano, foi liderado por Bernardino Machado.</span></p>',
                        ],
                        [
                            'sigla' => 'XXX',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1921-05-23',
                            'fim' => '1921-08-30',
                            'sinopse' => '<p><span>O 30.º governo da Primeira República Portuguesa nomeado a 23 de maio de 1921 e exonerado a 30 de agosto de 1921, foi liderado por Tomé de Barros Queirós.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1921-08-30',
                            'fim' => '1921-10-19',
                            'sinopse' => '<p><span>O 31.º governo da Primeira República Portuguesa nomeado a 30 de agosto de 1921 e exonerado a 19 de outubro de 1921, foi liderado por António Granjo, tendo este sido assassinado nessa mesma data.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1921-10-19',
                            'fim' => '1921-11-05',
                            'sinopse' => '<p><span>O 32.º governo da Primeira República Portuguesa nomeado a 19 de outubro de 1921 e exonerado a 5 de novembro do mesmo ano, foi liderado por Manuel Maria Coelho.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1921-11-05',
                            'fim' => '1921-12-16',
                            'sinopse' => '<p><span>O 33.º governo da Primeira República Portuguesa nomeado a 5 de novembro de 1921 e exonerado a 16 de dezembro de 1921, foi liderado por Carlos Maia Pinto. Ficou conhecido como Governo Outubrista.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXIV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1921-12-16',
                            'fim' => '1922-02-06',
                            'sinopse' => '<p><span>O 34.º governo da Primeira República Portuguesa nomeado a 16 de dezembro de 1921 e exonerado a 6 de fevereiro de 1922, foi liderado por Francisco Cunha Leal.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1922-02-06',
                            'fim' => '1922-11-30',
                            'sinopse' => '<p><span>O 35.º governo da Primeira República Portuguesa nomeado a 6 de fevereiro de 1922 e exonerado a 30 de novembro do mesmo ano, foi liderado por António Maria da Silva.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXVI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1922-11-30',
                            'fim' => '1922-12-07',
                            'sinopse' => '<p><span>O 36.º governo da Primeira República Portuguesa nomeado a 30 de novembro de 1922 e exonerado a 7 de dezembro do mesmo ano, foi o segundo governo consecutivo liderado por António Maria da Silva.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXVII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1922-12-07',
                            'fim' => '1923-11-15',
                            'sinopse' => '<p><span>O 37.º governo da Primeira República Portuguesa nomeado a 7 de dezembro de 1922 e exonerado a 15 de novembro de 1923, foi o terceiro governo consecutivo liderado por António Maria da Silva.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXVIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1923-11-15',
                            'fim' => '1923-12-18',
                            'sinopse' => '<p><span>O 38.º governo da Primeira República Portuguesa nomeado a 15 de novembro de 1923 e exonerado a 18 de dezembro do mesmo ano, foi liderado por António Ginestal Machado.</span></p>',
                        ],
                        [
                            'sigla' => 'XXXIX',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1923-12-18',
                            'fim' => '1924-07-06',
                            'sinopse' => '<p><span>O 39.º governo da Primeira República Portuguesa nomeado a 18 de dezembro de 1923 e exonerado a 6 de julho de 1924, foi liderado por Álvaro de Castro.</span></p>',
                        ],
                        [
                            'sigla' => 'XL',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1924-07-06',
                            'fim' => '1924-11-22',
                            'sinopse' => '<p><span>O 40.º governo da Primeira República Portuguesa nomeado a 6 de julho de 1924 e exonerado a 22 de novembro do mesmo ano, foi liderado por Alfredo Rodrigues Gaspar.</span></p>',
                        ],
                        [
                            'sigla' => 'XLI',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1924-11-22',
                            'fim' => '1925-02-15',
                            'sinopse' => '<p><span>O 41.º governo da Primeira República Portuguesa nomeado a 22 de novembro de 1924 e exonerado a 15 de fevereiro de 1925, foi liderado por José Domingues dos Santos. Por ser formado por personalidades da fação mais à esquerda ("canhota") do Partido Democrático, ficou para a histórica como Governo Canhoto.</span></p>',
                        ],
                        [
                            'sigla' => 'XLII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1925-02-15',
                            'fim' => '1925-07-01',
                            'sinopse' => '<p><span>O 42.º governo da Primeira República Portuguesa nomeado a 15 de fevereiro de 1925 e exonerado a 1 de julho do mesmo ano, foi liderado por Vitorino Guimarães.</span></p>',
                        ],
                        [
                            'sigla' => 'XLIII',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1925-07-01',
                            'fim' => '1925-08-01',
                            'sinopse' => '<p><span>O 43.º governo da Primeira República Portuguesa nomeado a 1 de julho de 1925 e exonerado a 1 de agosto do mesmo ano, foi liderado por António Maria da Silva. Ficou conhecido como o Governo Bonzo ou dos Bonzos.</span></p>',
                        ],
                        [
                            'sigla' => 'XLIV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1925-08-01',
                            'fim' => '1925-12-17',
                            'sinopse' => '<p><span>O 44.º governo da Primeira República Portuguesa nomeado a 1 de agosto de 1925 e exonerado a 17 de dezembro do mesmo ano, foi liderado por Domingos Pereira.</span></p>',
                        ],
                        [
                            'sigla' => 'XLV',
                            'nome' => 'Governo Republicano',
                            'inicio' => '1925-12-17',
                            'fim' => '1926-05-30',
                            'sinopse' => '<p><span>O 45.º e último governo da Primeira República Portuguesa nomeado a 17 de dezembro de 1925 e exonerado a 30 de maio de 1926, após o golpe militar de 28 de maio de 1926, foi liderado por António Maria da Silva.</span></p>',
                        ],
                    ],
                ],
                [
                    'nome' => 'Ditadura Militar',
                    'inicio' => '1926-05-30',
                    'fim' => '1933-04-11',
                    'sinopse' => '',
                    'image_url' => 'https://pt.wikipedia.org/wiki/Ficheiro:Coat_of_arms_of_Portugal.svg#/media/Ficheiro:Coat_of_arms_of_Portugal.svg',
                    'governos' => [
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo Militar',
                            'inicio' => '1926-05-30',
                            'fim' => '1926-06-17',
                            'sinopse' => '<p><span>O 1.º governo da Ditadura portuguesa, nomeado a 30 de maio de 1926, na sequência do golpe de 28 de maio de 1926, e exonerado a 17 de junho do mesmo ano, foi liderado por José Mendes Cabeçadas. Até 3 de junho, o governo foi constituído por Mendes Cabeçadas, Armando da Gama Ochoa e Manuel Gomes da Costa, sendo depois remodelado.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo Militar',
                            'inicio' => '1926-06-17',
                            'fim' => '1926-07-09',
                            'sinopse' => '<p><span>O 2.º governo da Ditadura portuguesa, nomeado a 17 de junho de 1926 e exonerado a 9 de julho do mesmo ano, foi liderado por Manuel Gomes da Costa. Inicialmente, Gomes da Costa assume todas as pastas; a 18 de junho entra António Claro para a pasta do Interior; a 19 de julho e a 6 de julho ocorrem novas alterações.</span></p>
<p><span>A totalidade do governo serviu como chefe de Estado de Portugal entre 17 e 29 de junho de 1926, na falta de um presidente da República ou de um presidente do Ministério com as prerrogativas de chefe de Estado. Essas prerrogativas seriam atribuídas ao presidente do Ministério Manuel Gomes da Costa a 29 de junho.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo Militar',
                            'inicio' => '1926-07-09',
                            'fim' => '1928-04-18',
                            'sinopse' => '<p><span>O 3.º governo da Ditadura portuguesa, nomeado a 9 de julho de 1926 e exonerado a 18 de abril de 1928, foi liderado por Óscar Carmona.</span></p>
<p><span>Durante este governo é estabelecido o modelo de eleição presidencial por sufrágio universal directo em decreto datado de 24 de fevereiro de 1928. Desta forma, Carmona é eleito presidente da República, no dia 25 de março de 1928. Após a tomada de posse, em 15 de abril, Carmona nomeia o coronel José Vicente de Freitas para presidir ao novo governo, que teria início a 18 de abril.</span></p>
<p><span>Entre 9 de julho e 29 de novembro de 1926, a totalidade do governo serviu como chefe de Estado de Portugal, por falta de um presidente da República ou presidente do Ministério com as prerrogativas de chefe de Estado. Essas prerrogativas seriam atribuídas ao presidente do Ministério Óscar Carmona, sendo este nomeado presidente da República interino por decreto. Em 1928 seria eleito presidente da República efetivo.</span></p>',
                        ],
                        [
                            'sigla' => 'IV',
                            'nome' => 'Governo Militar',
                            'inicio' => '1928-04-18',
                            'fim' => '1928-11-10',
                            'sinopse' => '<p><span>O 4.º governo da Ditadura portuguesa, nomeado a 18 de abril de 1928 e exonerado a 10 de novembro de 1928, foi liderado por José Vicente de Freitas.</span></p>',
                        ],
                        [
                            'sigla' => 'V',
                            'nome' => 'Governo Militar',
                            'inicio' => '1928-11-10',
                            'fim' => '1929-07-08',
                            'sinopse' => '<p><span>O 5.º governo da Ditadura portuguesa, nomeado a 10 de novembro de 1928 e exonerado a 8 de julho de 1929, foi o segundo ministério consecutivo liderado por José Vicente de Freitas.</span></p>',
                        ],
                        [
                            'sigla' => 'VI',
                            'nome' => 'Governo Militar',
                            'inicio' => '1929-07-08',
                            'fim' => '1930-01-21',
                            'sinopse' => '<p><span>O 6.º governo da Ditadura portuguesa, nomeado a 8 de julho de 1929 e exonerado a 21 de janeiro de 1930, foi liderado por Artur Ivens Ferraz.</span></p>',
                        ],
                        [
                            'sigla' => 'VII',
                            'nome' => 'Governo Militar',
                            'inicio' => '1930-01-21',
                            'fim' => '1932-07-05',
                            'sinopse' => '<p><span>O 7.º governo da Ditadura portuguesa, nomeado a 21 de janeiro de 1930 e exonerado a 5 de julho de 1932, foi liderado por Domingos Oliveira.</span></p>',
                        ],
                        [
                            'sigla' => 'VIII',
                            'nome' => 'Governo Militar',
                            'inicio' => '1932-07-05',
                            'fim' => '1933-04-11',
                            'sinopse' => '<p><span>O 8.º governo da Ditadura portuguesa, nomeado a 5 de julho de 1932 e exonerado a 11 de abril de 1933 com a adoção da Constituição de 1933 que instituiu o Estado Novo, foi o primeiro de três governos consecutivos liderados por António de Oliveira Salazar.</span></p>',
                        ],
                    ],
                ],
                [
                    'nome' => 'Segunda República Portuguesa',
                    'inicio' => '1933-04-11',
                    'fim' => '1974-04-25',
                    'sinopse' => '',
                    'image_url' => 'https://pt.wikipedia.org/wiki/Ficheiro:Coat_of_arms_of_Portugal.svg#/media/Ficheiro:Coat_of_arms_of_Portugal.svg',
                    'governos' => [
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo do Estado Novo',
                            'inicio' => '1933-04-11',
                            'fim' => '1936-01-18',
                            'sinopse' => '<p><span>O 1.º governo da Ditadura portuguesa, nomeado a 30 de maio de 1926, na sequência do golpe de 28 de maio de 1926, e exonerado a 17 de junho do mesmo ano, foi liderado por José Mendes Cabeçadas. Até 3 de junho, o governo foi constituído por Mendes Cabeçadas, Armando da Gama Ochoa e Manuel Gomes da Costa, sendo depois remodelado.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo do Estado Novo',
                            'inicio' => '1936-01-18',
                            'fim' => '1968-09-27',
                            'sinopse' => '<p><span>O 2.º governo do Estado Novo e 10.º governo da Ditadura portuguesa, nomeado a 18 de janeiro de 1936 e exonerado a 27 de setembro de 1968, foi o terceiro de três governos consecutivos liderados por António de Oliveira Salazar, e o mais longo governo de sempre em Portugal.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo do Estado Novo',
                            'inicio' => '1968-09-27',
                            'fim' => '1974-04-25',
                            'sinopse' => '<p><span>O 3.º governo do Estado Novo e 11.º governo da Ditadura Portuguesa, nomeado a 27 de setembro de 1968 e exonerado a 25 de abril de 1974, por via da Revolução dos Cravos, foi o primeiro e único governo liderado por Marcelo Caetano.</span></p>',
                        ],
                    ],
                ],
                [
                    'nome' => 'Terceira República',
                    'inicio' => '1974-04-25',
                    'fim' => null,
                    'sinopse' => '<p><span>Atual regime democrático parlamentar de Portugal, iniciado após a Revolução dos Cravos.</span></p>',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                    'governos' => [
                        [
                            'nome' => 'Junta de Salvação Nacional',
                            'inicio' => '1974-04-26',
                            'fim' => '1974-05-16',
                            'sinopse' => '<p><span>A Junta de Salvação Nacional (JSN) foi um grupo de militares designados para sustentar o governo do Estado Português em 25 Abril de 1974, após o golpe de estado que derrubou o Estado Novo. Esta Junta esteve em funcionamento desde o comunicado do presidente António de Spínola, emitido às 01h30 do dia 26 de Abril de 1974, até à tomada de posse do Governo Provisório, ocorrida a 16 de Maio do mesmo ano. Embora com características diferentes, sem poder executivo directo, manteve-se até ser extinta após os acontecimentos de 11 de Março de 1975, sendo substituída pelo Conselho da Revolução instituído a 14 de Março de 1975 pela Assembleia do Movimento das Forças Armadas.</span></p>',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo Provisório',
                            'inicio' => '1974-05-16',
                            'fim' => '1974-07-18',
                            'sinopse' => '<p><span>O I Governo Provisório de Portugal tomou posse a 16 de Maio de 1974, menos de 1 mês após o 25 de Abril de 1974, presidido por um democrata moderado, o advogado Adelino da Palma Carlos. Integrando representantes das principais forças políticas da oposição — da esfera comunista à democrata liberal — mas dominado nas suas pastas-chave, pelos representantes ligados à área socialista, este governo viria a ser presa da sua própria heterogeneidade ideológica, espelho de uma dinâmica que se afirmava de forma crescente no seio da sociedade portuguesa e que viria a precipitar a queda deste governo em Julho de 1974.</span></p>
                            <p><span>O Governo cai menos de dois meses depois, a 11 de Julho de 1974, na sequência de uma proposta apresentada pelo Primeiro-Ministro de realização em Outubro de 1974 das eleições presidenciais e, simultaneamente, de um referendo a uma Constituição Provisória. As presidenciais ocorreriam, portanto, antes das eleições constituintes, relegando estas últimas para finais de 1976. Tal proposta, que viria a ser chamada "Plano Palma Carlos" ou mesmo "Golpe Palma Carlos", contrariava o Programa do MFA e constituía uma forma de reforçar o poder do Presidente da República, António de Spínola.</span></p>',
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo Provisório',
                            'inicio' => '1974-07-18',
                            'fim' => '1974-09-30',
                            'sinopse' => '<p><span>Ainda em estudo o tipo de presidencia, se o francês como defendido por Spinola. Aldelino da Palma Carlos demite-se porque o MFA apresentou desagrado de ser civil de tendencia federalista (conforme o Livro "Portugal e o Futuro" de Spinola). A saída forçada, obriga a nomeação de Vasco Gonçalves, militar definido pelo MFA, começando o PREC.</span></p>
                            <p><span>O II Governo Provisório de Portugal resultou do pedido de demissão do primeiro-ministro Palma Carlos a 9 de Julho de 1974 por, alegadamente, não ter condições políticas para governar, numa clara alusão ao peso da influência do MFA. Com ele solidarizaram-se alguns ministros do seu gabinete, entre eles Francisco Sá Carneiro. A 12 de Julho, Vasco Gonçalves, um homem do MFA, foi indigitado pelo presidente da República, António de Spínola, para o cargo de primeiro-ministro. O II Governo Provisório tomou posse a 18 de Julho e caiu a 30 de Setembro do mesmo ano.</span></p>',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo Provisório',
                            'sinopse' => '<p><span>O III Governo Provisório de Portugal foi chefiado por Vasco Gonçalves, o qual tomou posse a 30 de Setembro de 1974, tendo terminado o seu mandato a 26 de Março de 1975.</span></p>
<p><span>A 12 de Março de 1975 são extintos a Junta de Salvação Nacional e o Conselho de Estado e em sua substituição é criado o Conselho da Revolução. O Governo dá início à execução de um grande plano de nacionalizações (nomeadamente, a Banca, Seguros, e Transportes).</span></p>',
                            'inicio' => '1974-09-30',
                            'fim' => '1975-03-26',
                        ],
                        [
                            'sigla' => 'IV',
                            'nome' => 'Governo Provisório',
                            'sinopse' => '<p><span>O IV Governo Provisório de Portugal foi chefiado por Vasco Gonçalves, cuja tomada de posse se deu a 26 de Março de 1975, tendo o Governo caído a 8 de Agosto de 1975, altura do Verão Quente.</span></p>',
                            'inicio' => '1975-03-26',
                            'fim' => '1975-08-08',
                        ],
                        [
                            'sigla' => 'V',
                            'nome' => 'Governo Provisório',
                            'sinopse' => '<p><span>O V Governo Provisório de Portugal, chefiado por Vasco Gonçalves, cuja tomada de posse se deu a 8 de Agosto de 1975, viria a cair a 19 de Setembro de 1975.</span></p>',
                            'inicio' => '1975-08-08',
                            'fim' => '1975-09-19',
                        ],
                        [
                            'sigla' => 'VI',
                            'nome' => 'Governo Provisório',
                            'sinopse' => '<p><span>O VI Governo Provisório de Portugal (e último dos governos provisórios da Terceira República Portuguesa), foi chefiado por Pinheiro de Azevedo, cuja tomada de posse se deu a 19 de setembro de 1975, e que seria substituído a 23 de junho de 1976, de forma interina, devido a um problema de saúde, por Almeida e Costa. A 23 de julho de 1976 entra em funções o I Governo Constitucional, constituído após a eleição e tomada de posse do Presidente da República António Ramalho Eanes.</span></p>',
                            'inicio' => '1975-09-19',
                            'fim' => '1976-07-23',
                        ],
                        [
                            'sigla' => 'I',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1976-07-23',
                            'fim' => '1978-01-23',
                            'anexos' => [
                                [
                                    'nome' => 'Composição Governo',
                                    'anexo_tipo_id' => 3,
                                    'anexo' => 'https://www.historico.portugal.gov.pt/pt/o-governo/arquivo-historico/governos-constitucionais/gc01/composicao.aspx',
                                ],
                                [
                                    'nome' => 'Programa Governo',
                                    'anexo_tipo_id' => 5,
                                    'anexo' => 'https://www.historico.portugal.gov.pt/media/464012/GC01.pdf',
                                ],
                                [
                                    'nome' => 'Lei Organica',
                                    'anexo_tipo_id' => 3,
                                    'anexo' => 'https://www.historico.portugal.gov.pt/pt/o-governo/arquivo-historico/governos-constitucionais/gc01/lei-organica/lei-organica-i-governo-constitucional.aspx',
                                ],
                            ],
                        ],
                        [
                            'sigla' => 'II',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1978-01-23',
                            'fim' => '1978-08-29',
                        ],
                        [
                            'sigla' => 'III',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1978-08-29',
                            'fim' => '1978-11-22',
                        ],
                        [
                            'sigla' => 'IV',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1978-11-22',
                            'fim' => '1979-07-07',
                        ],
                        [
                            'sigla' => 'V',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1979-08-01',
                            'fim' => '1980-01-03',
                        ],
                        [
                            'sigla' => 'VI',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1980-01-03',
                            'fim' => '1981-01-09',
                        ],
                        [
                            'sigla' => 'VII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1981-01-09',
                            'fim' => '1981-09-04',
                        ],
                        [
                            'sigla' => 'VIII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1981-09-04',
                            'fim' => '1983-07-09',
                        ],
                        [
                            'sigla' => 'IX',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1983-07-09',
                            'fim' => '1985-11-06',
                        ],
                        [
                            'sigla' => 'X',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1985-11-06',
                            'fim' => '1987-08-17',
                        ],
                        [
                            'sigla' => 'XI',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1987-08-17',
                            'fim' => '1991-10-31',
                        ],
                        [
                            'sigla' => 'XII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1991-10-31',
                            'fim' => '1995-10-25',
                        ],
                        [
                            'sigla' => 'XIII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1995-10-28',
                            'fim' => '1999-10-25',
                        ],
                        [
                            'sigla' => 'XIV',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '1999-10-25',
                            'fim' => '2002-04-06',
                        ],
                        [
                            'sigla' => 'XV',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2002-04-06',
                            'fim' => '2004-07-17',
                        ],
                        [
                            'sigla' => 'XVI',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2004-07-17',
                            'fim' => '2005-03-12',
                        ],
                        [
                            'sigla' => 'XVII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2005-03-12',
                            'fim' => '2009-10-26',
                        ],
                        [
                            'sigla' => 'XVIII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2009-10-26',
                            'fim' => '2011-06-20',
                        ],
                        [
                            'sigla' => 'XIX',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2011-06-20',
                            'fim' => '2015-10-30',
                        ],
                        [
                            'sigla' => 'XX',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2015-10-30',
                            'fim' => '2015-11-26',
                        ],
                        [
                            'sigla' => 'XXI',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2015-11-26',
                            'fim' => '2019-10-26',
                        ],
                        [
                            'sigla' => 'XXII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2019-10-26',
                            'fim' => '2022-03-30',
                        ],
                        [
                            'sigla' => 'XXIII',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2022-03-30',
                            'fim' => '2024-04-02',
                        ],
                        [
                            'sigla' => 'XXIV',
                            'nome' => 'Governo Constitucional',
                            'inicio' => '2024-04-02',
                            'fim' => null,
                        ],
                    ],
                ],
            ];

            // Certifique-se de que $anexoTipoWikipedia está definido
            $anexoTipoWikipedia = AnexoTipo::where('tipo', 'profile')->firstOrFail();

            foreach ($republicas as $republicaData) {
                $republica = Republica::firstOrCreate(
                    [
                        'uuid' => Str::uuid(),
                        'nome' => $republicaData['nome'],
                        'inicio' => $republicaData['inicio'],
                        'fim' => $republicaData['fim'],
                        'sinopse' => $republicaData['sinopse'],
                    ]
                );

                RepublicaAnexo::firstOrCreate(
                    [
                        'uuid' => Str::uuid(),
                        'republica_id' => $republica->id,
                        'anexo' => $republicaData['image_url'],
                        'anexo_tipo_id' => $anexoTipoWikipedia->id,
                        'nome' => 'Bandeira da '.$republicaData['nome'],
                        'descricao' => 'Bandeira ou símbolo da '.$republicaData['nome'],
                    ]
                );

                // $this->info(sprintf('Inserted república: %s (%s–%s)', $republicaData['nome'], $republicaData['inicio'], $republicaData['fim']));

                foreach ($republicaData['governos'] as $governoData) {
                    $governo = Governo::firstOrCreate(
                        [
                            'uuid' => Str::uuid(),
                            'sigla' => $governoData['sigla'] ?? null,
                            'nome' => $governoData['nome'],
                            'republica_id' => $republica->id,
                            'formacao' => $governoData['inicio'],
                            'dissolucao' => $governoData['fim'],
                            'sinopse' => $governoData['sinopse'] ?? null,
                        ]
                    );
                    if (isset($governoData['anexos'])) {
                        foreach ($governoData['anexos'] as $anexoData) {
                            $anexo = GovernoAnexo::firstOrCreate(
                                [
                                    'governo_id' => $governo->id,
                                    'anexo' => $anexoData['anexo'],
                                    'uuid' => Str::uuid(),
                                    'anexo_tipo_id' => $anexoTipoWikipedia->id,
                                    'nome' => $anexoData['nome'],
                                    'descricao' => $anexoData['descricao'] ?? null,
                                ]
                            );
                        }
                    }
                }
            }

            // $this->info('Completed scraping repúblicas.');

        } catch (Exception $exception) {
            $this->error('Error occurred: '.$exception->getMessage());
        }

    }
}
