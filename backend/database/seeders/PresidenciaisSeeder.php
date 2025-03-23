<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Instituicao;
use App\Models\InstituicaoCargo;
use App\Models\InstituicaoComTipo;
use App\Models\InstituicaoDados;
use App\Models\InstituicaoPresidencial;
use App\Models\Presidencial;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class PresidenciaisSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // https://pt.wikipedia.org/wiki/Lista_de_presidentes_da_Rep%C3%BAblica_Portuguesa
        // https://www.presidencia.pt/presidente-da-republica/a-presidencia/antigos-presidentes/
        $casaRepublica = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Presidência da República']);
        InstituicaoComTipo::create(['instituicao_id' => $casaRepublica->id, 'instituicao_tipo_id' => 1]);
        InstituicaoDados::create(['instituicao_id' => $casaRepublica->id, 'fundacao' => 1911]);
        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '05-10-1910', 'termino' => '24-08-1911']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Governo Provisório', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id, 'sinopse' => '<p><span>Primeiro chefe de Estado do regime republicano (acumulando com a chefia do governo), numa capacidade provisória até à eleição do primeiro presidente da República. Dissolução dos partidos monárquicos. Eleições para a Assembleia Nacional Constituinte de 1911. Constituição de 1911. Lei da Separação do Estado das Igrejas. Teófilo Braga continuará como presidente do Governo Provisório até 3 de setembro de 1911.</span></p>']);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente do Governo Provisório', 'instituicao_id' => $presidencia->id]);
        $cidadaoTeofiloBraga = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Teófilo Braga', 'nome_completo' => 'Joaquim Teófilo Fernandes Braga']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoTeofiloBraga->id, 'cargo_id' => $presidente->id, 'inicio' => '05-10-1910', 'fim' => '24-08-1911']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1911-08-24', 'posse' => '24-08-1911', 'termino' => '29-05-1915']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $presidencia->id]);
        $cidadaoManuelAriaga = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuel de Arriaga', 'nome_completo' => 'Manuel José de Arriaga Brum da Silveira e Peyrelongue']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelAriaga->id, 'cargo_id' => $presidente->id, 'inicio' => '24-08-1911', 'fim' => '29-05-1915']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1915-05-29', 'posse' => '1915-05-29', 'termino' => '05-10-1915']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $presidencia->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoTeofiloBraga->id, 'cargo_id' => $presidente->id, 'inicio' => '1915-05-29', 'fim' => '05-10-1915']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1915-08-06', 'posse' => '05-10-1915', 'termino' => '11-12-1917']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $presidencia->id]);
        $cidadaoManuelAriaga = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Bernardino Machado', 'nome_completo' => 'Bernardino Luís Machado Guimarães']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelAriaga->id, 'cargo_id' => $presidente->id, 'inicio' => '05-10-1915', 'fim' => '11-12-1917']);

        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Conselho de Ministros']);
        InstituicaoComTipo::create(['instituicao_id' => $governo->id, 'instituicao_tipo_id' => 2]);
        Governo::create(['uuid' => Str::uuid(), 'code' => '15º', 'nome' => 'Governo da Primeira República Portuguesa', 'republica_id' => 3, 'formacao' => '1917-12-11', 'dissolucao' => '1917-12-27']);
        Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Sidónio Pais', 'nome_completo' => 'Sidónio Bernardino Cardoso da Silva Pais']);
        // Deve ser do Governo Anterior
        // $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente da Junta Revolucionária', 'instituicao_id' => $governoInstituicao->id]);
        // CidadaoCargo::create(['cidadao_id' => $cidadaoSidonioPais->id, 'cargo_id' => $presidente->id, 'inicio' => '08-12-1917', 'fim' => '11-12-1917'])
    }
}
