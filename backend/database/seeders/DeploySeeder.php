<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\User;
use App\Models\UserRole;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

final class DeploySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->call(AplicacoesSeeder::class);
        $this->call(FreguesiaTiposSeeder::class);
        $this->call(GeografiaSeeder::class);
        $this->call(NacionalidadesSeeder::class);
        $this->call(StatusSeeder::class);
        $this->call(RoleSeeder::class);
        $this->call(AnexoTiposSeeder::class);
        $this->call(ContactoTiposSeeder::class);
        $this->call(EntidadeJuridicasSeeder::class);
        $this->call(RelacaoTiposSeeder::class);

        User::create(['uuid' => Str::uuid(), 'name' => 'Operadores AI', 'status_id' => 1, 'rgpd' => true, 'email' => 'deployuser@bewhy.org', 'password' => Hash::make('1234')]);
        UserRole::create(['user_id' => 1, 'role_id' => 1]);

        $this->call(InstituicaoTiposSeeder::class);
        $this->call(LeiTiposSeeder::class);
        $this->call(LeiPartesSeeder::class);
        $this->call(DiarioRepublicaSeriesSeeder::class);

        $this->call(EleicoesSeeder::class);
        $this->call(RepublicasGovernosSeeder::class);
        $this->call(InstituicoesSeeder::class);
        $this->call(GovernosInstituicoesCargosSeeder::class);
        $this->call(PresidencialSeeder::class);
        $this->call(GovernosPosAbrilSeeder::class);
        $this->call(PartidosSeeder::class);
        $this->call(LegislaturaSeeder::class);
        $this->call(ParlamentoOrgaosIISeeder::class);
        $this->call(ParlamentoOrgaosIIISeeder::class);
        $this->call(ParlamentoOrgaosVSeeder::class);

        /*
         $this->call(DiarioRepublicaGlossariosSeeder::class);
         $this->call(LeisSeeder::class);
        */
    }
}
