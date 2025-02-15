<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\InstituicaoRamo;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class InstituicaoRamosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        InstituicaoRamo::create(['uuid' => Str::uuid(), 'tipo' => 'Presidencial', 'descricao' => 'O Presidente da República é o chefe de Estado e representa a República Portuguesa mas é apenas um cargo atribuido a um cidadão. Já a Presidência da República que é o máximo e outras intituições/orgãos, como o concelho de estado']);
        InstituicaoRamo::create(['uuid' => Str::uuid(), 'tipo' => 'Legislativo', 'descricao' => 'A Assembleia da República é o órgão legislativo de Portugal, sendo a câmara baixa do parlamento português. Depois parlamento e mesa da assembleia, e outros orgãos como equipas de trabalho, comissões, etc']);
        InstituicaoRamo::create(['uuid' => Str::uuid(), 'tipo' => 'Executivo', 'descricao' => 'Devido ao sistema eleitural, o governo é que executa grande parte das funções do estado, sendo o primeiro ministro o lider do governo. Depois o conselho de ministros, secretários de estado, Ministérios, etc.']);
        InstituicaoRamo::create(['uuid' => Str::uuid(), 'tipo' => 'Judicial', 'descricao' => 'Agrega orgãos independentes e autónomos que compõem o sistema judicial. Ex: Tribunais, Comarcas...']);
        InstituicaoRamo::create(['uuid' => Str::uuid(), 'tipo' => 'Independente', 'descricao' => 'São estabelecidas para operar autonomamente do governo e da Assembleia da República. Têm funções de fiscalização, regulação ou supervisão, garantindo imparcialidade e objetividade']);
        InstituicaoRamo::create(['uuid' => Str::uuid(), 'tipo' => 'Externo', 'descricao' => 'São organizações que interagem com a Assembleia da República, mas que não fazem parte da sua estrutura interna. Incluem agências governamentais, instituições públicas (como universidades) e organizações internacionais.']);
        InstituicaoRamo::create(['uuid' => Str::uuid(), 'tipo' => 'Partido', 'descricao' => 'Outros de estatudo especial (in)controlado']);
    }
}
