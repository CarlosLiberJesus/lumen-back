<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\DiarioRepublica;
use App\Models\DiarioRepublicaPublicacao;
use App\Models\DiarioRepublicaPublicacaoLei;
use App\Models\Lei;
use App\Models\LeiAdenda;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class LeisSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        /* constituição inicial */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 86/1976', 'publicacao' => '1976-04-10']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => 'Série I de 1976-04-10', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/86-1976-78796', 'diario_republica_id' => 1]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Decreto de Aprovação da Constituição, de 10 de abril', 'codigo' => 'Decreto de Aprovação da Constituição',
            'instituicao_id' => 1, 'sumario' => 'Aprova a Constituição da República Portuguesa', 'texto' => 'leis/decreto-de-aprovacao-da-constituicao.txt', 'data_toggle' => '1976-04-10']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 1,
            'lei_id' => 1,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/decreto-aprovacao-constituicao/1976-502635',
            'paginas' => '738 - 775',
        ]);

        /* constituição v1 */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 227/1982', 'publicacao' => '1982-09-30']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => 'Série I de 1982-09-30', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/86-1976-78796', 'diario_republica_id' => 2]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Lei Constitucional n.º 1/82, de 30 de setembro', 'codigo' => 'Lei Constitucional n.º 1/82',
            'instituicao_legislatura_id' => 2, 'sumario' => 'Primeira revisão da Constituição', 'texto' => 'leis/lei-constitucional-182.txt', 'data_toggle' => '1982-09-30']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 2,
            'lei_id' => 2,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/lei-constitucional/1-1982-375254',
            'paginas' => '3135 - 3206',
        ]);
        LeiAdenda::create(['lei_original_id' => 1, 'lei_adenda_id' => 2]);

        /* constituição v2 */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 155/1989', 'publicacao' => '1989-07-08']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => '1º Suplemento, Série I de 1989-07-08', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/155-1989-94756', 'diario_republica_id' => 3]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Lei Constitucional n.º 1/89, de 8 de julho', 'codigo' => 'Lei Constitucional n.º 1/89',
            'instituicao_legislatura_id' => 5, 'sumario' => 'Segunda revisão da Constituição', 'texto' => 'leis/lei-constitucional-182.txt', 'data_toggle' => '1989-07-08']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 3,
            'lei_id' => 3,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/lei-constitucional/1-1989-496551',
            'paginas' => '3135 - 3206',
        ]);
        LeiAdenda::create(['lei_original_id' => 2, 'lei_adenda_id' => 3]);

        /* constituição v3 */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 273/1992', 'publicacao' => '1992-11-25']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => '1º Suplemento, Série I-A de 1992-11-25', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/273-1992-99564', 'diario_republica_id' => 4]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Lei Constitucional n.º 1/92, de 25 de novembro', 'codigo' => 'Lei Constitucional n.º 1/92',
            'instituicao_legislatura_id' => 6, 'sumario' => 'Terceira revisão constitucional', 'texto' => 'leis/lei-constitucional-192.txt', 'data_toggle' => '1992-11-25']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 4,
            'lei_id' => 4,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/lei-constitucional/1-174316',
            'paginas' => '5444-(2) a 5444-(45)',
        ]);
        LeiAdenda::create(['lei_original_id' => 3, 'lei_adenda_id' => 4]);

        /* constituição v4 */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 218/1997', 'publicacao' => '1997-09-20']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => 'Série I-A de 1997-09-20', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/218-1997-107291', 'diario_republica_id' => 5]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Lei Constitucional n.º 1/97, de 20 de setembro', 'codigo' => 'Lei Constitucional n.º 1/97',
            'instituicao_legislatura_id' => 7, 'sumario' => 'Quarta revisão constitucional', 'texto' => 'leis/lei-constitucional-197.txt', 'data_toggle' => '1997-09-20']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 5,
            'lei_id' => 5,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/lei-constitucional/1-1997-653562',
            'paginas' => '5130 - 5196',
        ]);
        LeiAdenda::create(['lei_original_id' => 4, 'lei_adenda_id' => 5]);

        /* constituição v5 */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 286/2001', 'publicacao' => '2001-12-12']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => 'Série I-A de 2001-12-12', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/286-2001-116978', 'diario_republica_id' => 6]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Lei Constitucional n.º 1/2001, de 12 de dezembro', 'codigo' => 'Lei Constitucional n.º 1/2001',
            'instituicao_legislatura_id' => 8, 'sumario' => 'Quinta revisão constitucional', 'texto' => 'leis/lei-constitucional-12001.txt', 'data_toggle' => '2001-12-12']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 6,
            'lei_id' => 6,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/lei-constitucional/1-2001-577358',
            'paginas' => '8172 - 8217',
        ]);
        LeiAdenda::create(['lei_original_id' => 5, 'lei_adenda_id' => 6]);

        /* constituição v6 */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 173/2004', 'publicacao' => '2004-07-24']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => 'Série I-A de 2004-07-24', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/173-2004-121824', 'diario_republica_id' => 7]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Lei Constitucional n.º 1/2004, de 24 de julho', 'codigo' => 'Lei Constitucional n.º 1/2004',
            'instituicao_legislatura_id' => 9, 'sumario' => 'Sexta revisão constitucional', 'texto' => 'leis/lei-constitucional-12004.txt', 'data_toggle' => '2004-07-24']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 7,
            'lei_id' => 7,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/lei-constitucional/1-2004-506783',
            'paginas' => '4642 - 4693',
        ]);
        LeiAdenda::create(['lei_original_id' => 6, 'lei_adenda_id' => 7]);

        /* constituição v7 */
        DiarioRepublica::create(['uuid' => Str::uuid(), 'nome' => 'Diário da República n.º 155/2005', 'publicacao' => '2005-08-12']);
        DiarioRepublicaPublicacao::create(['uuid' => Str::uuid(), 'nome' => 'Série I-A de 2005-08-12', 'url' => 'https://diariodarepublica.pt/dr/detalhe/diario-republica/155-2005-123425', 'diario_republica_id' => 8]);
        Lei::create(['uuid' => Str::uuid(), 'nome_completo' => 'Lei Constitucional n.º 1/2005, de 12 de agosto', 'codigo' => 'Lei Constitucional n.º 1/2005',
            'instituicao_legislatura_id' => 10, 'sumario' => 'Sexta revisão constitucional', 'texto' => 'leis/lei-constitucional-12005.txt', 'data_toggle' => '2005-08-12']);
        DiarioRepublicaPublicacaoLei::create([
            'dr_publicacao_id' => 8,
            'lei_id' => 8,
            'url' => 'https://diariodarepublica.pt/dr/detalhe/lei-constitucional/1-2005-243729',
            'paginas' => '4642 - 4693',
        ]);
        LeiAdenda::create(['lei_original_id' => 7, 'lei_adenda_id' => 8]);
    }
}
