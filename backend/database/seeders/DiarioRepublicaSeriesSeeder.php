<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\DiarioRepublicaSerie;
use Illuminate\Database\Seeder;

final class DiarioRepublicaSeriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DiarioRepublicaSerie::create(
            ['nome' => 'Série I', 'sinopse' => ''],
            ['nome' => 'Série II', 'sinopse' => ''],
            ['nome' => 'Série III', 'sinopse' => ''],
            ['nome' => 'Suplemento', 'sinopse' => '', 'serie_id' => 1],
            ['nome' => 'Suplemento', 'sinopse' => '', 'serie_id' => 2],
            ['nome' => 'Série I-A', 'sinopse' => '', 'serie_id' => 1],
            ['nome' => 'Série II-A', 'sinopse' => 'Textos dos decretos, resoluções e deliberações do Plenário, da Comissão Permanente, da Mesa e da Conferência de Líderes, dos projetos de revisão constitucional, dos projetos e propostas de lei, dos projetos e propostas de resolução e de referendo, assim como dos projetos de deliberação, dos pareceres das comissões parlamentares sobre eles emitidos e textos de substituição, quando existam, ou final, bem como os restantes pareceres solicitados às comissões parlamentares, as convocações da Assembleia pelo Presidente da República, nos termos da Constituição, as mensagens do Presidente da República, o Programa do Governo e as moções de rejeição do Programa do Governo, de censura e de confiança;', 'serie_id' => 2],
            ['nome' => 'Série II-B', 'sinopse' => 'Textos dos votos, interpelações, inquéritos parlamentares e requerimentos de apreciação de decretos-leis, as perguntas formuladas por escrito ao Governo e os requerimentos referidos nas alíneas d) e e) do artigo 156.º da Constituição, bem como as respetivas respostas, cuja reprodução pode ser parcial quando a Mesa assim o entenda por motivo da sua extensão, das audições parlamentares, os textos e relatórios das petições que devam ser publicados nos termos da lei e aqueles a que a comissão parlamentar competente entenda dar publicidade;', 'serie_id' => 2],
            ['nome' => 'Série II-C', 'sinopse' => 'Relatórios da atividade das comissões parlamentares nos termos do Regimento, bem como das delegações da Assembleia da República, atas das comissões parlamentares e das audições parlamentares, quando deliberada a sua publicação, documentos relativos ao mandato de Deputado e aos grupos parlamentares;', 'serie_id' => 2],
            ['nome' => 'Série II-D', 'sinopse' => 'Intervenções feitas por Deputados, em representação da Assembleia da República, em organizações internacionais, designadamente na União Interparlamentar, nas Assembleias Parlamentares do Conselho da Europa, da Organização do Tratado do Atlântico Norte, da União da Europa Ocidental e da Organização para a Segurança e a Cooperação na Europa, e na Conferência dos Órgãos Especializados em Assuntos Comunitários, desde que constem integralmente dos respetivos registos, bem como das delegações da Assembleia e os documentos relativos à constituição e composição dos grupos parlamentares de amizade;', 'serie_id' => 2],
            ['nome' => 'Série II-E', 'sinopse' => 'Despachos do Presidente da Assembleia e dos Vice-Presidentes, orçamento e contas da Assembleia da República, relatórios da atividade da Assembleia e da Auditoria Jurídica, deliberações, recomendações, pareceres e relatórios das entidades administrativas independentes que funcionam junto da Assembleia da República, documentos relativos ao pessoal da Assembleia da República e outros que, nos termos da lei ou do Regimento, devam ser publicados, bem como os que o Presidente entenda mandar publicar.', 'serie_id' => 2],
        );
    }
}
