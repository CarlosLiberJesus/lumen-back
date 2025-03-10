<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Cidadao;
use App\Models\CidadaoCargo;
use App\Models\ConselhoMinistros;
use App\Models\Instituicao;
use App\Models\InstituicaoCargo;
use App\Models\InstituicaoComTipo;
use App\Models\InstituicaoDados;
use App\Models\InstituicaoGoverno;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

final class GovernoDemoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $governo = Instituicao::where('nome', 'Conselho de Ministros')->firstOfFail();

        $assembleia = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Assembleia da República']);
        InstituicaoComTipo::create(['instituicao_id' => $assembleia->id, 'instituicao_tipo_id' => 3]);

        $instituicao = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Mesa Assembleia da República', 'responde_instituicao_id' => $assembleia->id]);
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 3]);

        $instituicao = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Parlamento', 'responde_instituicao_id' => $assembleia->id]);
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 3]);

        foreach (range(1, 6) as $governoId) {
            InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => $governoId]);
        }

        $cidadaoAntonioBarreto = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Barreto']);
        $cidadaoManuelAlegre = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuel Alegre']);
        $cidadaoCarlosMelancia = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Carlos Melancia']);
        $cidadaoManuelaMorgado = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuela Morgado']);
        $cidadaoMarioSoares = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Mário Soares', 'nome_completo' => 'Mário Alberto Nobre Lopes Soares', 'data_nascimento' => '1924-12-07', 'data_falecimento' => '2017-01-07']);
        // Ex: Governo Constitucional I (O Mário Soares ainda vem de antes)
        $governoInstituicao = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 7]);
        $primeiroMinistro = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Primeiro-Ministro', 'instituicao_id' => $governoInstituicao->id]);
        $instituicaoCargo = $primeiroMinistro;
        CidadaoCargo::create(['cidadao_id' => $cidadaoMarioSoares->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadaoMarioSoares->id]);

        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado Adjunto do Primeiro-Ministro', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Vitor Cunha Rego']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1977-03-26']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado Adjunto do Primeiro-Ministro', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $cidadaoAnteroMonteiroDinis = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Antero Monteiro Dinis']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAnteroMonteiroDinis->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1977-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado Adjunto do Primeiro-Ministro para os Assuntos Administrativos', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAnteroMonteiroDinis->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-25', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado Adjunto do Primeiro-Ministro para os Assuntos Políticos', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelAlegre->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-25', 'fim' => '1978-01-23']);

        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro de Estado', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Henrique de Barros']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);

        $minSemPasta = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro sem Pasta', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $minSemPasta;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Jorge Campinos']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Comunicação Social', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $minSemPasta->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelAlegre->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1977-03-25']);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Roque Lino']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-25', 'fim' => '1977-11-16']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado da Comunicação Social', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $instituicaoCargo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'João Soares Louro']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Ambiente', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $minSemPasta->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuel Gomes Guerreiro']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Cultura', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $minSemPasta->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'David Mourão Ferreira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado para a População e Emprego', 'instituicao_id' => $governoInstituicao->id, 'cargo_responde_id' => $minSemPasta->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuel Tito de Morais']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);

        $minDefesaNacional = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério da Defesa Nacional', 'responde_instituicao_id' => $governo->id]);
        $instituicao = $minDefesaNacional;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minDefesaNacional->id, 'governo_id' => 7]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro da Defesa Nacional', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Mário Firmino Miguel']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);

        $minPlanoCoordenacaoEcon = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério do Plano e Coordenação Económica', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minPlanoCoordenacaoEcon;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974, 'dissolucao' => 1978]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minPlanoCoordenacaoEcon->id, 'governo_id' => 7]);
        $ministroPlanoCoordenacaoEcon = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro do Plano e Coordenação Económica', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroPlanoCoordenacaoEcon;
        $cidadaoAntonioSousaGomes = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Sousa Gomes']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioSousaGomes->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadaoAntonioSousaGomes->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Coordenação Económica', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroPlanoCoordenacaoEcon->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Carlos Oliveira Cruz']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Planeamento', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroPlanoCoordenacaoEcon->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuela Silva']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-09-09']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Coordenação Económica', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroPlanoCoordenacaoEcon->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoCarlosMelancia->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-25', 'fim' => '1978-01-23']);
        $minAdminInterna = Instituicao::create(['uuid' => Str::uuid(), 'sigla' => 'MAI', 'nome' => 'Ministério da Administração Interna', 'responde_instituicao_id' => $governo->id, 'sinopse' => '<p><span>O Ministério da Administração Interna (MAI) é o departamento do Governo de Portugal, responsável pela execução das políticas de segurança pública, de proteção e socorro, de imigração e asilo, de prevenção e segurança rodoviária e pela administração dos assuntos eleitorais. Criado em 1736, como Secretaria de Estado dos Negócios Interiores do Reino é o ministério português mais antigo continuamente em existência. No século XIX, passou a ser conhecido por Ministério do Reino e após a implantação da república em 1910 teve a sua designação oficial alterada para Ministério do Interior que manteve até 1974.</span></p>']);
        $instituicao = $minAdminInterna;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minAdminInterna->id, 'governo_id' => 7]);

        $ministroAdminInterna = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro da Administração Interna', 'instituicao_id' => $instituicaoGoverno->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Manuel da Costa Brás']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $ministroAdminInterna->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $ministroAdminInterna->id, 'cidadao_id' => $cidadao->id]);
        $cargos = [
            ['cargo' => 'Subsecretário de Estado da Administração Interna', 'nome' => 'Hugo Gonçalves Rocha', 'inicio' => '1976-07-28', 'fim' => '1977-06-06'],
            ['cargo' => 'Secretário de Estado da Administração Pública', 'nome' => 'Mário de Aguiar', 'inicio' => '1976-07-28', 'fim' => '1977-03-25'],
            ['cargo' => 'Secretário de Estado da Administração Regional e Local', 'nome' => 'Manuel Ferreira Lima', 'inicio' => '1976-07-28', 'fim' => '1978-01-23'],
            ['cargo' => 'Secretário de Estado da Integração Administrativa', 'nome' => 'João Cristóvão Moreira', 'inicio' => '1976-07-28', 'fim' => '1978-01-23'],
        ];

        DB::transaction(function () use ($cargos, $instituicaoGoverno, $ministroAdminInterna): void {
            foreach ($cargos as $data) {
                $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => $data['cargo'], 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAdminInterna->id]);
                $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => $data['nome']]);
                CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => $data['inicio'], 'fim' => $data['fim']]);
            }
        });

        $minJustica = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério da Justiça', 'responde_instituicao_id' => $governo->id]);
        $instituicao = $minJustica;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minJustica->id, 'governo_id' => 7]);
        $ministroJustica = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro da Justiça', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroJustica;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António de Almeida Santos']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Justiça', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroJustica->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Santos Pais']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);

        $minFinancas = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério das Finanças', 'responde_instituicao_id' => $governo->id]);
        $instituicao = $minFinancas;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minFinancas->id, 'governo_id' => 7]);
        $ministroFinancas = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro das Finanças', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroFinancas;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Henrique Medina Carreira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Tesouro', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroFinancas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Palmeiro Ribeiro']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelaMorgado->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado do Tesouro', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $instituicaoCargo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Achando Cabral']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Eduardo Consiglieri Pedroso']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1977-09-06']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado das Finanças', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroFinancas->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoManuelaMorgado->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado das Finanças', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $instituicaoCargo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Eurico Ferreira Nunes']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Orçamento', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroFinancas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Alberto Ramalheira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado do Orçamento', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $instituicaoCargo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Ludovico Cândido']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-25', 'fim' => '1978-01-23']);
        $minNegEstrangeiros = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério dos Negócios Estrangeiros', 'responde_instituicao_id' => $governo->id]);
        $instituicao = $minNegEstrangeiros;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minNegEstrangeiros->id, 'governo_id' => 7]);
        $ministroNegEstrangeiros = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro dos Negócios Estrangeiros', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroNegEstrangeiros;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Medeiros Ferreira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1977-10-10']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoMarioSoares->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-10-12', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Emigração', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroNegEstrangeiros->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'João Vieira de Lima']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $minAgriculturaPescas = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério da Agricultura e Pescas', 'responde_instituicao_id' => $governo->id]);
        $instituicao = $minAgriculturaPescas;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1975]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minAgriculturaPescas->id, 'governo_id' => 7]);
        $ministroAgriculturaPescas = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro da Agricultura e Pescas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroAgriculturaPescas;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Lopes Cardoso']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1976-11-05']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioBarreto->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-11-05', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadaoAntonioBarreto->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado das Florestas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAgriculturaPescas->id]);
        $cidadaoAntonioAzevedoGomes = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Azevedo Gomes']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioAzevedoGomes->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1976-11-05']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Comércio e Indústrias Agrícolas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAgriculturaPescas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Carlos Antunes Filipe']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Estruturação Agrária', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAgriculturaPescas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Joaquim Castro Guerra']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1976-11-05']);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Carlos Martins Portas']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-11-06', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado das Florestas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAgriculturaPescas->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioAzevedoGomes->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-11-06', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Fomento Agrário', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAgriculturaPescas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Reinaldo Vital Rodrigues']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1976-11-05']);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Campos']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-11-06', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado das Pescas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAgriculturaPescas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Pedro Coelho']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $minIndustriaTecnologia = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério da Indústria e Tecnologia', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minIndustriaTecnologia;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1975, 'dissolucao' => 1979]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minIndustriaTecnologia->id, 'governo_id' => 7]);
        $ministroIndustriaTecnologia = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro da Indústria e Tecnologia', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroIndustriaTecnologia;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Walter Rosa']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1977-01-07']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioSousaGomes->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-01-08', 'fim' => '1977-03-25']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadaoAntonioSousaGomes->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Alfredo Nobre da Costa']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Energia e Minas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroIndustriaTecnologia->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Joaquim Rocha Cabral']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Ricardo Bayão Horta']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Indústria Ligeira', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroIndustriaTecnologia->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Rabaça']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-01-07']);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Trigo de Morais']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-01-08', 'fim' => '1977-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Indústria Pesada', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroIndustriaTecnologia->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoCarlosMelancia->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Indústria Ligeira e Pesada', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroIndustriaTecnologia->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Fernando Santos Martins']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        $minComercioTurismo = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério do Comércio e Turismo', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minComercioTurismo;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1976, 'dissolucao' => 1995]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minComercioTurismo->id, 'governo_id' => 7]);
        $ministerioComercioTurismo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro do Comércio e Turismo', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministerioComercioTurismo;
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioBarreto->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1977-03-25']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadaoAntonioBarreto->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Carlos Mota Pinto']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Comércio Externo', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministerioComercioTurismo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Celeste']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Comércio Interno', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministerioComercioTurismo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Escaja Gonçalves']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Turismo', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministerioComercioTurismo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Luís Filipe Madeira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $minTrabalho = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério do Trabalho', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minTrabalho;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974, 'dissolucao' => 1983]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minTrabalho->id, 'governo_id' => 7]);
        $ministroTrabalho = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro do Trabalho', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroTrabalho;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Francisco Marcelo Curto']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1977-03-25']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $cidadaoAntonioMaldonadoGonelha = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Maldonado Gonelha']);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioMaldonadoGonelha->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadaoAntonioMaldonadoGonelha->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Trabalho', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroTrabalho->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadaoAntonioMaldonadoGonelha->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado do Trabalho', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $instituicaoCargo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Custódio Simões']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Trabalho', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $instituicaoCargo->id]);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-03-26', 'fim' => '1978-01-23']);
        $minEdInvCien = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério da Educação e Investigação Científica', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minEdInvCien;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1975, 'dissolucao' => 1979]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minEdInvCien->id, 'governo_id' => 7]);
        $ministroEdInvCien = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro da Educação e Investigação Científica', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroEdInvCien;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Mário Sottomayor Cardia']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Administração e Equipamento Escolar', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroEdInvCien->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Almerindo Marques']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado do Ensino Superior', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroEdInvCien->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Joaquim Cruz e Silva']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Investigação Científica', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroEdInvCien->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'José Tiago Oliveira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Juventude e Desportos', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroEdInvCien->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Joaquim Barros de Sousa']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Orientação Pedagógica', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroEdInvCien->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Joaquim Romero de Magalhães']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $minAssuntosSociais = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério dos Assuntos Sociais', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minAssuntosSociais;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1974, 'dissolucao' => 1983]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minAssuntosSociais->id, 'governo_id' => 7]);
        $ministroAssuntosSociais = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro dos Assuntos Sociais', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroAssuntosSociais;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Armando Bacelar']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Segurança Social', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAssuntosSociais->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Vítor Vasques']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Saúde', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroAssuntosSociais->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Paulo Mendo']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-06-06']);
        $minTransportesComunicacao = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério dos Transportes e Comunicações', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minTransportesComunicacao;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1975, 'dissolucao' => 1981]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minTransportesComunicacao->id, 'governo_id' => 7]);
        $ministroTransportesComunicacao = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro dos Transportes e Comunicações', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroTransportesComunicacao;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Emílio Rui Vilar']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado dos Transportes e Comunicações', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroTransportesComunicacao->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Machado Rodrigues']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Marinha Mercante', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroTransportesComunicacao->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Crisóstomo Teixeira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $minHabitacaoUrbConst = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério da Habitação, Urbanismo e Construção', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minHabitacaoUrbConst;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1975, 'dissolucao' => 1978]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minHabitacaoUrbConst->id, 'governo_id' => 7]);
        $ministroHabitacaoUrbConst = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro da Habitação, Urbanismo e Construção', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroHabitacaoUrbConst;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Eduardo Pereira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Construção Civil', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroHabitacaoUrbConst->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Armando Esteves Pereira']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado da Habitação e Urbanismo', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroHabitacaoUrbConst->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Álvaro Pinto Correia']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1977-03-25']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Subsecretário de Estado da Habitação, Urbanismo e Construção', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $instituicaoCargo->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Albérico Santos Machado']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1977-03-26', 'fim' => '1978-01-23']);
        $minObrasPublicas = Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Ministério das Obras Públicas', 'responde_instituicao_id' => $governo->id, 'extinta' => true]);
        $instituicao = $minObrasPublicas;
        InstituicaoComTipo::create(['instituicao_id' => $instituicao->id, 'instituicao_tipo_id' => 2]);
        InstituicaoDados::create(['instituicao_id' => $instituicao->id, 'fundacao' => 1975, 'dissolucao' => 1978]);
        $instituicaoGoverno = InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $minObrasPublicas->id, 'governo_id' => 7]);
        $ministroObrasPublicas = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Ministro das Obras Públicas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $primeiroMinistro->id]);
        $instituicaoCargo = $ministroObrasPublicas;
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'João Almeida Pina']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-23', 'fim' => '1978-01-23']);
        ConselhoMinistros::create(['instituicao_governo_id' => 7, 'cargo_id' => $instituicaoCargo->id, 'cidadao_id' => $cidadao->id]);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado das Obras Públicas', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroObrasPublicas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Mário de Azevedo']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);
        $instituicaoCargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_governo', 'cargo' => 'Secretário de Estado das Recursos Hídricos e Saneamento Básico', 'instituicao_id' => $instituicaoGoverno->id, 'cargo_responde_id' => $ministroObrasPublicas->id]);
        $cidadao = Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Baltazar Morais Barroco']);
        CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $instituicaoCargo->id, 'inicio' => '1976-07-28', 'fim' => '1978-01-23']);

        // TODO: Continuar com cada governo
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 8]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 9]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 10]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 11]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 12]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 13]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 14]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 15]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 16]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 17]);
        // InstituicaoGoverno::create(['uuid' => Str::uuid(), 'instituicao_id' => $governo->id, 'governo_id' => 18]);
    }
}
