<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\LeiTipo;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class LeiTiposSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Acórdão']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Acordo']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Acta']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Alvará']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Alvará-Extracto']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Anúncio']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Assento']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Autorização']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Aviso']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Aviso-Extracto']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Carta de Confirmação e Ratificação de Convenção Internacional']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Carta de Lei']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Comunicação de Renúncia']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Conta']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Contrato']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Contrato-Extrato']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Convénio']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Declaração']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Declaração de Dívida']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Declaração de Rectificação']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Decreto']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Decreto Legislativo Regional']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Decreto Lei']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Decreto Regional']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Decreto Regulamentar']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Decreto Regulamentar Regional']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Deliberação']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Deliberação-Extrato']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho Conjunto']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho-Extrato']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho Ministerial']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho Normativo']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho Orientador']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho Rectificativo']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Despacho Regulador']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Directiva Contabilística']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Edital']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Extrato']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Instrução']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Instruções']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Jurisprudência']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Lei']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Lei Constitucional']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Lei Orgânica']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Listagem']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Lista Rectificativa']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Louvor']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Mapa']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Mapa Oficial']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Moção']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Moção De Confiança']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Não Especificado']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Norma']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Projeto de Lei', 'sinopse' => 'Proposta de lei apresentada por um deputado ou grupo de deputados.']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Proposta Lei', 'sinopse' => 'Apresentada pelo Governos, é uma proposta de lei que é discutida e votada na Assembleia da República.']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Proposta de Resolução', 'sinopse' => 'Proposta de resolução apresentada por um deputado ou grupo de deputados.']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Parecer']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Portaria']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Portaria-Extracto']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Processo']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Protocolo']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Recomendação']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Rectificação']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Regimento']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Regulamento']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Regulamento Interno']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Relatório']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Resolução']);
        LeiTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Resolução da Assembleia Nacional']);

    }
}
