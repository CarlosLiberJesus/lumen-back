<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\EntidadeJuridica;
use Illuminate\Database\Seeder;

final class EntidadeJuridicasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        EntidadeJuridica::create(['nome' => 'Organismos da Administração Pública']);
        EntidadeJuridica::create(['nome' => 'Entidades públicas empresariais']);
        EntidadeJuridica::create(['nome' => 'Entidades públicas municipais, intermunicipais e regionais']);
        EntidadeJuridica::create(['nome' => 'Empresas públicas']);
        EntidadeJuridica::create(['nome' => 'Pessoas coletivas de direito público - N.E.']);

        EntidadeJuridica::create(['nome' => 'Sociedade anónima']);
        EntidadeJuridica::create(['nome' => 'Sociedade por quotas']);
        EntidadeJuridica::create(['nome' => 'Sociedade em nome coletivo']);

        EntidadeJuridica::create(['nome' => 'Agrup. complementares de empresas']);
        EntidadeJuridica::create(['nome' => 'Cooperativas']);
        EntidadeJuridica::create(['nome' => 'Cooperativas 2º grau']);
        EntidadeJuridica::create(['nome' => 'Entidades equiparadas a pessoas coletivas']);

        EntidadeJuridica::create(['nome' => 'Fundações']);
        EntidadeJuridica::create(['nome' => 'EIRL']);
        EntidadeJuridica::create(['nome' => 'Trusts']);

        EntidadeJuridica::create(['nome' => 'Sociedade Unipessoal']);
        EntidadeJuridica::create(['nome' => 'Empresário em nome individual']);
        EntidadeJuridica::create(['nome' => 'Comerciantes individuais']);

        EntidadeJuridica::create(['nome' => 'Soc. civil com personalidade jurídica']);
        EntidadeJuridica::create(['nome' => 'Soc. civis']);
        EntidadeJuridica::create(['nome' => 'Soc. irregulares']);
        EntidadeJuridica::create(['nome' => 'Soc. em comandita']);
        EntidadeJuridica::create(['nome' => 'Soc. anónimas desportivas']);
        EntidadeJuridica::create(['nome' => 'Associações']);

        EntidadeJuridica::create(['nome' => 'Representação permanente de entidade não Sujeita a registo']);
        EntidadeJuridica::create(['nome' => 'Representação permanente']);

        EntidadeJuridica::create(['nome' => 'Pessoas coletivas religiosas']);
        EntidadeJuridica::create(['nome' => 'Pessoas coletivas religiosas católicas']);
        EntidadeJuridica::create(['nome' => 'Pessoas coletivas religiosas não católicas']);

        EntidadeJuridica::create(['nome' => 'Pessoas coletivas internacionais']);
        EntidadeJuridica::create(['nome' => 'Pessoas coletivas estrangeiras']);
        EntidadeJuridica::create(['nome' => 'Entidades equiparadas estrangeiras - identificação']);
        EntidadeJuridica::create(['nome' => 'Soc. civis estrangeiras']);
        EntidadeJuridica::create(['nome' => 'Soc. anónimas europeias']);
        EntidadeJuridica::create(['nome' => 'Agrup. europeus interesse económico']);
        EntidadeJuridica::create(['nome' => 'Sucursais financeiras exteriores']);

    }
}
