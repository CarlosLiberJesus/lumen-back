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

        $conselhoMinistros = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Conselho de Ministros']);
        InstituicaoComTipo::create(['instituicao_id' => $governo->id, 'instituicao_tipo_id' => 2]);
        $governo = Governo::create(['uuid' => Str::uuid(), 'code' => '15º', 'nome' => 'Governo da Primeira República Portuguesa', 'republica_id' => 3, 'formacao' => '1917-12-11', 'dissolucao' => '1917-12-27']);
        $cidadaoSidonioPais = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Sidónio Pais', 'nome_completo' => 'Sidónio Bernardino Cardoso da Silva Pais']);
        // Deve ser do Governo Anterior
        // $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente da Junta Revolucionária', 'instituicao_id' => $governoInstituicao->id]);
        // CidadaoCargo::create(['cidadao_id' => $cidadaoSidonioPais->id, 'cargo_id' => $presidente->id, 'inicio' => '08-12-1917', 'fim' => '11-12-1917']);
        $governoInstituicao = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $conselhoMinistros->id, 'governo_id' => $governo->id]);
        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '12-12-1917', 'termino' => '27-12-12-1917', 'sinopse' => '<p><span>De acordo com a Constituição de 1911, na ausência de um presidente da República, a totalidade do governo substitui-o. Governo liderado por Sidónio Pais, militar revoltoso, presidente da Junta Revolucionária de 1917 e presidente do Ministério. Governo de contornos ditatoriais.</span></p>']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'República Nova', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '27-12-1917', 'termino' => '09-05-1918', 'sinopse' => '<p><span>De acordo com a Constituição de 1911, na ausência de um presidente da República, a totalidade do governo substitui-o. Governo liderado por Sidónio Pais, militar revoltoso, presidente da Junta Revolucionária de 1917 e presidente do Ministério. Governo de contornos ditatoriais.</span></p>']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'República Nova', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente do Ministério', 'instituicao_id' => $governoInstituicao->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoSidonioPais->id, 'cargo_id' => $presidente->id, 'inicio' => '27-12-1917', 'fim' => '14-12-1918']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1918-04-28', 'posse' => '09-05-1918', 'termino' => '14-12-1918']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'República Nova', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente do Ministério', 'instituicao_id' => $presidencia->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoSidonioPais->id, 'cargo_id' => $presidente->id, 'inicio' => '05-10-1915', 'fim' => '11-12-1917']);

        $governo = Governo::create(['uuid' => Str::uuid(), 'code' => '16º', 'nome' => 'Governo da Primeira República Portuguesa', 'republica_id' => 3, 'formacao' => '1918-12-14', 'dissolucao' => '1918-12-16']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1918-12-16', 'posse' => '1918-12-16', 'termino' => '05-10-1919']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $presidencia->id]);
        $cidadaoManuelAriaga = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'João do Canto e Castro', 'nome_completo' => 'João do Canto e Castro Silva Antunes Júnior']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelAriaga->id, 'cargo_id' => $presidente->id, 'inicio' => '1918-12-16', 'fim' => '05-10-1919']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1919-08-06', 'posse' => '1910-10-05', 'termino' => '1923-10-05']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $presidencia->id]);
        $cidadaoManuelAriaga = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António José de Almeida', 'nome_completo' => 'António José de Almeida']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelAriaga->id, 'cargo_id' => $presidente->id, 'inicio' => '1910-10-05', 'fim' => '1923-10-05']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1923-08-06', 'posse' => '1923-10-05', 'termino' => '1925-12-11']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $presidencia->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuel Teixeira Gomes', 'nome_completo' => 'Manuel Teixeira Gomes']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $presidente->id, 'inicio' => '1923-10-05', 'fim' => '1925-12-11']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicoes' => '1925-12-11', 'posse' => '1925-12-11', 'termino' => '1926-05-31']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $presidente = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $presidencia->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Bernardino Machado', 'nome_completo' => 'Bernardino Luís Machado Guimarães']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $presidente->id, 'inicio' => '1925-12-11', 'fim' => '1926-05-31']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '1926-05-31', 'termino' => '1926-06-19']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Ditadura Militar', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $governo = Governo::create(['uuid' => Str::uuid(), 'code' => '1º', 'nome' => 'Governo da Ditadura Militar Portuguesa', 'republica_id' => 3, 'formacao' => '1926-05-31', 'dissolucao' => '1926-06-19']);
        $governoInstituicao = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $conselhoMinistros->id, 'governo_id' => $governo->id]);
        $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente do Ministério', 'instituicao_id' => $governoInstituicao->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Mendes Cabeçadas', 'nome_completo' => 'José Mendes Cabeçadas Júnior']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $governoCargo->id, 'inicio' => '1925-12-11', 'fim' => '1926-05-31']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '1926-06-19', 'termino' => '1926-06-29']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Ditadura Militar', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $governo = Governo::create(['uuid' => Str::uuid(), 'code' => '2º', 'nome' => 'Governo da Ditadura Militar Portuguesa', 'republica_id' => 3, 'formacao' => '1926-06-29', 'dissolucao' => '1926-07-09']);
        $governoInstituicao = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $conselhoMinistros->id, 'governo_id' => $governo->id]);
        $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente do Ministério', 'instituicao_id' => $governoInstituicao->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuel Gomes da Costa', 'nome_completo' => 'Manuel de Oliveira Gomes da Costa']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $governoCargo->id, 'inicio' => '1926-06-29', 'fim' => '1926-07-09']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '1926-07-09', 'termino' => '1926-11-29']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Ditadura Militar', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $governo = Governo::create(['uuid' => Str::uuid(), 'code' => '3º', 'nome' => 'Governo da Ditadura Militar Portuguesa', 'republica_id' => 3, 'formacao' => '1926-07-09', 'dissolucao' => '1926-11-29']);
        $governoInstituicao = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $conselhoMinistros->id, 'governo_id' => $governo->id]);
        $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente do Ministério', 'instituicao_id' => $governoInstituicao->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Óscar Carmona', 'nome_completo' => 'António Óscar de Fragoso Carmona']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $governoCargo->id, 'inicio' => '1926-06-29', 'fim' => '1928-04-15']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'eleicao' => '1928-03-25', 'posse' => '1928-04-15', 'termino' => '1933-04-11']);
        $presidencia = InstituicaoPresidencial::create(['nome' => 'Ditadura Militar', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente do Ministério', 'instituicao_id' => $governoInstituicao->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $governoCargo->id, 'inicio' => '1928-04-15', 'fim' => '1928-04-15']);

        $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '1928-04-15', 'termino' => '1933-04-11']);
        InstituicaoPresidencial::create(['nome' => 'Ditadura Militar', 'instituicao_id' => $casaRepublica->id, 'presidencial_id' => $presidencial->id]);
        $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente do Ministério', 'instituicao_id' => $governoInstituicao->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $governoCargo->id, 'inicio' => '1928-04-15', 'fim' => '1933-04-11']);

        $governoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Presidente do Conselho de Ministros', 'instituicao_id' => $governoInstituicao->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António de Oliveira Salazar', 'nome_completo' => 'António de Oliveira Salazar']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $governoCargo->id, 'inicio' => '1935-04-15', 'fim' => '1935-04-26']);

    }
}
