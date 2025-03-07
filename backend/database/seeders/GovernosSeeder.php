<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Governo;
use App\Models\GovernoAnexo;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class GovernosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Governo::create(['uuid' => Str::uuid(), 'code' => 'I', 'nome' => 'Governo Provisório', 'republica_id' => 5, 'legislatura_id' => 1, 'formacao' => '1974-05-16', 'dissolucao' => '1974-07-18', 'sinopse' => '<p><span>O Governo Provisório foi o primeiro governo português após a Revolução dos Cravos, que derrubou o regime do Estado Novo. Foi formado a 15 de maio de 1974, com o objetivo de preparar o país para a realização de eleições livres e democráticas. O seu primeiro Presidente do Conselho de Ministros foi o general António de Spínola, que foi substituído por Adelino da Palma Carlos a 18 de julho de 1974. O Governo Provisório foi dissolvido a 18 de julho de 1974, após a realização das eleições para a Assembleia Constituinte.</span></p>']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'II', 'nome' => 'Governo Provisório', 'republica_id' => 5, 'legislatura_id' => 2, 'formacao' => '1974-07-18', 'dissolucao' => '1974-09-30', 'sinopse' => '<p><span>Ainda em estudo o tipo de presidencia, se o francês como defendido por Spinola. Aldelino da Palma Carlos demite-se porque o MFA apresentou desagrado de ser civil de tendencia federalista (conforme o Livro "Portugal e o Futuro" de Spinola). A saída forçada, obriga a nomeação de Vasco Gonçalves, militar definido pelo MFA, começando o PREC.</span></p>']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'III', 'nome' => 'Governo Provisório', 'republica_id' => 5, 'legislatura_id' => 2, 'formacao' => '1974-09-30', 'dissolucao' => '1975-03-26']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'IV', 'nome' => 'Governo Provisório', 'republica_id' => 5, 'legislatura_id' => 3, 'formacao' => '1975-03-26', 'dissolucao' => '1975-08-08']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'V', 'nome' => 'Governo Provisório', 'republica_id' => 5, 'legislatura_id' => 3, 'formacao' => '1975-08-08', 'dissolucao' => '1975-09-19']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'VI', 'nome' => 'Governo Provisório', 'republica_id' => 5, 'legislatura_id' => 3, 'formacao' => '1975-09-19', 'dissolucao' => '1976-07-23']);

        Governo::create(['uuid' => Str::uuid(), 'code' => 'I', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 4, 'formacao' => '1976-07-23', 'dissolucao' => '1978-01-23']);
        GovernoAnexo::create(['uuid' => Str::uuid(), 'nome' => 'Composição Governo', 'governo_id' => 7, 'anexo_tipo_id' => 3, 'anexo' => 'https://www.historico.portugal.gov.pt/pt/o-governo/arquivo-historico/governos-constitucionais/gc01/composicao.aspx']);
        GovernoAnexo::create(['uuid' => Str::uuid(), 'nome' => 'Programa Governo', 'governo_id' => 7, 'anexo_tipo_id' => 5, 'anexo' => 'https://www.historico.portugal.gov.pt/media/464012/GC01.pdf']);
        GovernoAnexo::create(['uuid' => Str::uuid(), 'nome' => 'Composição Governo', 'governo_id' => 7, 'anexo_tipo_id' => 3, 'anexo' => 'https://www.historico.portugal.gov.pt/pt/o-governo/arquivo-historico/governos-constitucionais/gc01/lei-organica/lei-organica-i-governo-constitucional.aspx']);

        Governo::create(['uuid' => Str::uuid(), 'code' => 'II', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 4, 'formacao' => '1978-01-23', 'dissolucao' => '1978-08-29']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'III', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 4, 'formacao' => '1978-08-29', 'dissolucao' => '1978-11-22']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'IV', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 4, 'formacao' => '1978-11-22', 'dissolucao' => '1979-07-07']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'V', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 4, 'formacao' => '1979-08-01', 'dissolucao' => '1980-01-03']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'VI', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 5, 'formacao' => '1980-01-03', 'dissolucao' => '1981-01-09']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'VII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 5, 'formacao' => '1981-01-09', 'dissolucao' => '1981-09-04']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'VIII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 5, 'formacao' => '1981-09-04', 'dissolucao' => '1983-07-09']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'IX', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 6, 'formacao' => '1983-07-09', 'dissolucao' => '1985-11-06']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'X', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 7, 'formacao' => '1985-11-06', 'dissolucao' => '1987-08-17']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XI', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 8, 'formacao' => '1987-08-17', 'dissolucao' => '1991-10-31']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 9, 'formacao' => '1991-10-31', 'dissolucao' => '1995-10-25']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XIII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 10, 'formacao' => '1995-10-28', 'dissolucao' => '1999-10-25']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XIV', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 11, 'formacao' => '1999-10-25', 'dissolucao' => '2002-04-06']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XV', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 12, 'formacao' => '2002-04-06', 'dissolucao' => '2004-07-17']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XVI', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 12, 'formacao' => '2004-07-17', 'dissolucao' => '2005-03-12']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XVII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 13, 'formacao' => '2005-03-12', 'dissolucao' => '2009-10-26']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XVIII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 14, 'formacao' => '2009-10-26', 'dissolucao' => '2011-06-20']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XIX', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 15, 'formacao' => '2011-06-20', 'dissolucao' => '2015-10-30']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XX', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 16, 'formacao' => '2015-10-30', 'dissolucao' => '2015-11-26']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XXI', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 16, 'formacao' => '2015-11-26', 'dissolucao' => '2019-10-26']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XXII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 17, 'formacao' => '2019-10-26', 'dissolucao' => '2022-03-30']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XXIII', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 18, 'formacao' => '2022-03-30', 'dissolucao' => '2024-04-02']);
        Governo::create(['uuid' => Str::uuid(), 'code' => 'XXIV', 'nome' => 'Governo Constitucional', 'republica_id' => 5, 'legislatura_id' => 19, 'formacao' => '2024-04-02']);

    }
}
