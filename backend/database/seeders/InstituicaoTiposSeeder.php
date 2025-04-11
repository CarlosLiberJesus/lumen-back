<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\InstituicaoTipo;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class InstituicaoTiposSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Presidencial', 'sinopse' => 'O Presidente da República é o chefe de Estado e representa a República Portuguesa mas é apenas um cargo atribuido a um cidadão. Já a Presidência da República que é o máximo e outras instituições/orgãos, como o concelho de estado']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Executivo', 'sinopse' => 'Devido ao sistema eleitoral, o governo é que executa grande parte das funções do estado, sendo o primeiro ministro o lider do governo. Depois o conselho de ministros, secretários de estado, Ministérios, etc.']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Legislativo', 'sinopse' => 'A Assembleia da República é o órgão legislativo de Portugal, sendo a câmara baixa do parlamento português. Depois parlamento e mesa da assembleia, e outros orgãos como equipas de trabalho, comissões, etc']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Judicial', 'sinopse' => 'Agrega orgãos independentes e autónomos que compõem o sistema judicial. Ex: Tribunais, Comarcas...']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Independente', 'sinopse' => 'São estabelecidas para operar autonomamente do governo e da Assembleia da República. Têm funções de fiscalização, regulação ou supervisão, garantindo imparcialidade e objetividade']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Externo', 'sinopse' => 'São organizações que interagem com a Assembleia da República, mas que não fazem parte da sua estrutura interna. Incluem agências governamentais, instituições públicas (como universidades) e organizações internacionais.']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Partido', 'sinopse' => 'Outros de estatuto especial (in)controlado']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Ministério', 'codigo' => 'MIN', 'sinopse' => 'Órgão governamental responsável por uma área específica da administração pública']);

        // Tirado do INE
        // Lista de entidades que integram as Administrações Públicas
        // (Sistema Europeu de Contas de 2010) para efeitos do Orçamento do Estado de 2022
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P001', 'tipo' => 'Órgãos de Soberania']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P002', 'tipo' => 'Governação']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P003', 'tipo' => 'Representação Externa']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P004', 'tipo' => 'Defesa']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P005', 'tipo' => 'Segurança Interna']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P006', 'tipo' => 'Justiça']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P007', 'tipo' => 'Finanças']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P008', 'tipo' => 'Gestão da Dívida Pública']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P009', 'tipo' => 'Economia e Mar']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P010', 'tipo' => 'Cultura']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P011', 'tipo' => 'Ciência, Tecnologia e Ensino Superior']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P012', 'tipo' => 'Ensino Básico e Secundário e Administração Escolar']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P013', 'tipo' => 'Trabalho, Solidariedade e Segurança Social']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P014', 'tipo' => 'Saúde']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P015', 'tipo' => 'Ambiente e Ação Climática']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P016', 'tipo' => 'Infraestruturas e Habitação']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'codigo' => 'P017', 'tipo' => 'Agricultura e Alimentação']);
        InstituicaoTipo::create(['uuid' => Str::uuid(), 'tipo' => 'Segurança Social']);

    }
}
