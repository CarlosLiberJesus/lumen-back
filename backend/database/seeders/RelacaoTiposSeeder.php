<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\RelacaoTipo;
use Illuminate\Database\Seeder;

final class RelacaoTiposSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        RelacaoTipo::create(
            ['entre' => 'cidadaos', 'tipo' => 'Pai'],
            ['entre' => 'cidadaos', 'tipo' => 'Mãe'],
            ['entre' => 'cidadaos', 'tipo' => 'Filho'],
            ['entre' => 'cidadaos', 'tipo' => 'Filha'],
            ['entre' => 'cidadaos', 'tipo' => 'Irmão'],
            ['entre' => 'cidadaos', 'tipo' => 'Irmã'],
            ['entre' => 'cidadaos', 'tipo' => 'Avô'],
            ['entre' => 'cidadaos', 'tipo' => 'Avó'],
            ['entre' => 'cidadaos', 'tipo' => 'Neto'],
            ['entre' => 'cidadaos', 'tipo' => 'Neta'],
            ['entre' => 'cidadaos', 'tipo' => 'Tio'],
            ['entre' => 'cidadaos', 'tipo' => 'Tia'],
            ['entre' => 'cidadaos', 'tipo' => 'Primo'],
            ['entre' => 'cidadaos', 'tipo' => 'Prima'],
            ['entre' => 'cidadaos', 'tipo' => 'Sobrinho'],
            ['entre' => 'cidadaos', 'tipo' => 'Sobrinha'],
            ['entre' => 'cidadaos', 'tipo' => 'Padrinho Casamento'],
            ['entre' => 'cidadaos', 'tipo' => 'Madrinha Casamento'],
            ['entre' => 'cidadaos', 'tipo' => 'Padrinho Batizado'],
            ['entre' => 'cidadaos', 'tipo' => 'Madrinha Batizado'],
            ['entre' => 'cidadaos', 'tipo' => 'Padrinho Crisma'],
            ['entre' => 'cidadaos', 'tipo' => 'Madrinha Crisma'],
            ['entre' => 'cidadaos', 'tipo' => 'Amigo'],
            ['entre' => 'cidadaos', 'tipo' => 'Amiga'],
            ['entre' => 'cidadaos', 'tipo' => 'Colega'],
            ['entre' => 'cidadaos', 'tipo' => 'Colega de Trabalho'],
            ['entre' => 'cidadaos', 'tipo' => 'Vizinho'],
            ['entre' => 'cidadaos', 'tipo' => 'Vizinha'],
            ['entre' => 'cidadaos', 'tipo' => 'Marido'],
            ['entre' => 'cidadaos', 'tipo' => 'Esposa'],
            ['entre' => 'instituicoes', 'tipo' => 'Financiado'],
            ['entre' => 'instituicoes', 'tipo' => 'Fornecedor'],
            ['entre' => 'instituicoes', 'tipo' => 'Cliente'],
            ['entre' => 'instituicoes', 'tipo' => 'Parceiro'],
            ['entre' => 'instituicoes', 'tipo' => 'Concorrente'],
            ['entre' => 'instituicoes', 'tipo' => 'Nomeações'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Financiado'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Cliente'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Parceiro'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Concorrente'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Nomeado'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Sócio'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Acionista'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Administração'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Fiscalização'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Membro'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Colaborador'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Voluntário'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Estagiário'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Estudante'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Professor'],
            ['entre' => 'instituicao_cidadao', 'tipo' => 'Patrocinador'],
        );

    }
}
