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
            ['entre' => 'cidadaos', 'nome' => 'Pai'],
            ['entre' => 'cidadaos', 'nome' => 'Mãe'],
            ['entre' => 'cidadaos', 'nome' => 'Filho'],
            ['entre' => 'cidadaos', 'nome' => 'Filha'],
            ['entre' => 'cidadaos', 'nome' => 'Irmão'],
            ['entre' => 'cidadaos', 'nome' => 'Irmã'],
            ['entre' => 'cidadaos', 'nome' => 'Avô'],
            ['entre' => 'cidadaos', 'nome' => 'Avó'],
            ['entre' => 'cidadaos', 'nome' => 'Neto'],
            ['entre' => 'cidadaos', 'nome' => 'Neta'],
            ['entre' => 'cidadaos', 'nome' => 'Tio'],
            ['entre' => 'cidadaos', 'nome' => 'Tia'],
            ['entre' => 'cidadaos', 'nome' => 'Primo'],
            ['entre' => 'cidadaos', 'nome' => 'Prima'],
            ['entre' => 'cidadaos', 'nome' => 'Sobrinho'],
            ['entre' => 'cidadaos', 'nome' => 'Sobrinha'],
            ['entre' => 'cidadaos', 'nome' => 'Padrinho Casamento'],
            ['entre' => 'cidadaos', 'nome' => 'Madrinha Casamento'],
            ['entre' => 'cidadaos', 'nome' => 'Padrinho Batizado'],
            ['entre' => 'cidadaos', 'nome' => 'Madrinha Batizado'],
            ['entre' => 'cidadaos', 'nome' => 'Padrinho Crisma'],
            ['entre' => 'cidadaos', 'nome' => 'Madrinha Crisma'],
            ['entre' => 'cidadaos', 'nome' => 'Amigo'],
            ['entre' => 'cidadaos', 'nome' => 'Amiga'],
            ['entre' => 'cidadaos', 'nome' => 'Colega'],
            ['entre' => 'cidadaos', 'nome' => 'Colega de Trabalho'],
            ['entre' => 'cidadaos', 'nome' => 'Vizinho'],
            ['entre' => 'cidadaos', 'nome' => 'Vizinha'],
            ['entre' => 'cidadaos', 'nome' => 'Marido'],
            ['entre' => 'cidadaos', 'nome' => 'Esposa'],
            ['entre' => 'instituicoes', 'nome' => 'Financiado'],
            ['entre' => 'instituicoes', 'nome' => 'Fornecedor'],
            ['entre' => 'instituicoes', 'nome' => 'Cliente'],
            ['entre' => 'instituicoes', 'nome' => 'Parceiro'],
            ['entre' => 'instituicoes', 'nome' => 'Concorrente'],
            ['entre' => 'instituicoes', 'nome' => 'Nomeações'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Financiado'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Cliente'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Parceiro'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Concorrente'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Nomeado'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Sócio'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Acionista'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Administração'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Fiscalização'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Membro'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Colaborador'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Voluntário'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Estagiário'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Estudante'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Professor'],
            ['entre' => 'instituicao_cidadao', 'nome' => 'Patrocinador'],
        );

    }
}
