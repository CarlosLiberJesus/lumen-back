<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Instituicao;
use App\Models\InstituicaoComTipo;
use App\Models\InstituicaoDados;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

final class InstituicaoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $instituicoes = [
            // Monarquia Absoluta (1736 – 1822) -> República 1
            [
                'republica_id' => 1,
                'instituicoes' => [
                    ['nome' => 'Secretaria de Estado dos Negócios Interiores do Reino', 'fundacao' => 1736, 'dissolucao' => 1822],
                    ['nome' => 'Secretaria de Estado dos Negócios Estrangeiros e da Guerra', 'fundacao' => 1736, 'dissolucao' => 1822],
                    ['nome' => 'Secretaria de Estado dos Negócios da Marinha e Domínios Ultramarinos', 'fundacao' => 1736, 'dissolucao' => 1822],
                    ['nome' => 'Secretaria de Estado dos Negócios da Fazenda', 'fundacao' => 1801, 'dissolucao' => 1822],
                    ['nome' => 'Secretaria de Estado dos Negócios Eclesiásticos e da Justiça', 'fundacao' => 1821, 'dissolucao' => 1822],
                ],
            ],
            // Monarquia Constitucional (1822 – 1910) -> República 2
            [
                'republica_id' => 2,
                'instituicoes' => [
                    ['nome' => 'Ministério do Reino', 'fundacao' => 1822, 'dissolucao' => 1910],
                    ['nome' => 'Ministério da Marinha e Ultramar', 'fundacao' => 1822, 'dissolucao' => 1910],
                    ['nome' => 'Ministério dos Negócios Estrangeiros', 'fundacao' => 1822, 'dissolucao' => 1910],
                    ['nome' => 'Ministério da Guerra', 'fundacao' => 1822, 'dissolucao' => 1910],
                    ['nome' => 'Ministério dos Negócios Eclesiásticos e da Justiça', 'fundacao' => 1822, 'dissolucao' => 1910],
                    ['nome' => 'Ministério da Fazenda', 'fundacao' => 1822, 'dissolucao' => 1910],
                    ['nome' => 'Ministério das Obras Públicas, Comércio e Indústria', 'fundacao' => 1852, 'dissolucao' => 1910],
                    ['nome' => 'Ministério da Instrução Pública', 'fundacao' => 1870, 'dissolucao' => 1870],
                    ['nome' => 'Ministério da Instrução Pública e Belas Artes', 'fundacao' => 1890, 'dissolucao' => 1898],
                ],
            ],
            // Primeira República (1910 – 1926), Ditadura Militar (1926 – 1928) e Ditadura Nacional (1928 – 1933) -> República 3
            [
                'republica_id' => 3,
                'instituicoes' => [
                    ['nome' => 'Ministério do Interior', 'fundacao' => 1910, 'dissolucao' => 1933],
                    ['nome' => 'Ministério da Marinha e Colónias', 'fundacao' => 1910, 'dissolucao' => 1911],
                    ['nome' => 'Ministério da Marinha', 'fundacao' => 1911, 'dissolucao' => 1933],
                    ['nome' => 'Ministério das Colónias', 'fundacao' => 1911, 'dissolucao' => 1933],
                    ['nome' => 'Ministério dos Negócios Estrangeiros', 'fundacao' => 1910, 'dissolucao' => 1933],
                    ['nome' => 'Ministério da Guerra', 'fundacao' => 1910, 'dissolucao' => 1933],
                    ['nome' => 'Ministério da Justiça', 'fundacao' => 1910, 'dissolucao' => 1914],
                    ['nome' => 'Ministério da Justiça e dos Cultos', 'fundacao' => 1914, 'dissolucao' => 1933],
                    ['nome' => 'Ministério da Fazenda', 'fundacao' => 1910, 'dissolucao' => 1910],
                    ['nome' => 'Ministério das Finanças', 'fundacao' => 1910, 'dissolucao' => 1933],
                    ['nome' => 'Ministério das Obras Públicas, Comércio e Indústria', 'fundacao' => 1910, 'dissolucao' => 1910],
                    ['nome' => 'Ministério do Fomento', 'fundacao' => 1910, 'dissolucao' => 1917],
                    ['nome' => 'Ministério do Comércio', 'fundacao' => 1917, 'dissolucao' => 1919],
                    ['nome' => 'Ministério do Comércio e Comunicações', 'fundacao' => 1919, 'dissolucao' => 1932],
                    ['nome' => 'Ministério da Agricultura', 'fundacao' => 1918, 'dissolucao' => 1932],
                    ['nome' => 'Ministério das Subsistências e Transportes', 'fundacao' => 1918, 'dissolucao' => 1918],
                    ['nome' => 'Ministério dos Abastecimentos', 'fundacao' => 1918, 'dissolucao' => 1919],
                    ['nome' => 'Ministério do Comércio, Indústria e Agricultura', 'fundacao' => 1932, 'dissolucao' => 1933],
                    ['nome' => 'Ministério das Obras Públicas e Comunicações', 'fundacao' => 1932, 'dissolucao' => 1933],
                    ['nome' => 'Ministério da Instrução Pública', 'fundacao' => 1913, 'dissolucao' => 1933],
                    ['nome' => 'Ministério do Trabalho e Previdência Social', 'fundacao' => 1916, 'dissolucao' => 1917],
                    ['nome' => 'Ministério do Trabalho', 'fundacao' => 1917, 'dissolucao' => 1925],
                ],
            ],
            // Estado Novo (Ditadura Política) (1933 – 1974) -> República 4
            [
                'republica_id' => 4,
                'instituicoes' => [
                    ['nome' => 'Presidência do Conselho de Ministros', 'fundacao' => 1933, 'dissolucao' => 1974],
                    ['nome' => 'Ministério do Interior', 'fundacao' => 1933, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Marinha', 'fundacao' => 1933, 'dissolucao' => 1974],
                    ['nome' => 'Ministério das Colónias', 'fundacao' => 1933, 'dissolucao' => 1950],
                    ['nome' => 'Ministério do Ultramar', 'fundacao' => 1950, 'dissolucao' => 1974],
                    ['nome' => 'Ministério dos Negócios Estrangeiros', 'fundacao' => 1933, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Justiça e dos Cultos', 'fundacao' => 1933, 'dissolucao' => 1934],
                    ['nome' => 'Ministério da Justiça', 'fundacao' => 1934, 'dissolucao' => 1934],
                    ['nome' => 'Ministério das Finanças', 'fundacao' => 1933, 'dissolucao' => 1934],
                    ['nome' => 'Ministério das Finanças e da Coordenação Económica', 'fundacao' => 1974, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Guerra', 'fundacao' => 1933, 'dissolucao' => 1950],
                    ['nome' => 'Ministério do Exército', 'fundacao' => 1950, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Defesa Nacional', 'fundacao' => 1950, 'dissolucao' => 1974],
                    ['nome' => 'Ministério do Comércio e Indústria', 'fundacao' => 1933, 'dissolucao' => 1940],
                    ['nome' => 'Ministério da Agricultura', 'fundacao' => 1933, 'dissolucao' => 1940],
                    ['nome' => 'Ministério da Economia', 'fundacao' => 1940, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Agricultura e Comércio', 'fundacao' => 1974, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Indústria e Energia', 'fundacao' => 1974, 'dissolucao' => 1974],
                    ['nome' => 'Ministério das Obras Públicas e Comunicações', 'fundacao' => 1933, 'dissolucao' => 1946],
                    ['nome' => 'Ministério das Obras Públicas', 'fundacao' => 1946, 'dissolucao' => 1974],
                    ['nome' => 'Ministério das Comunicações', 'fundacao' => 1946, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Instrução Pública', 'fundacao' => 1933, 'dissolucao' => 1936],
                    ['nome' => 'Ministério da Educação Nacional', 'fundacao' => 1936, 'dissolucao' => 1974],
                    ['nome' => 'Ministério das Corporações e Previdência Social', 'fundacao' => 1950, 'dissolucao' => 1973],
                    ['nome' => 'Ministério das Corporações e Segurança Social', 'fundacao' => 1973, 'dissolucao' => 1974],
                    ['nome' => 'Ministério da Saúde e Assistência', 'fundacao' => 1961, 'dissolucao' => 1973],
                    ['nome' => 'Ministério da Saúde', 'fundacao' => 1973, 'dissolucao' => 1974],
                ],
            ],
        ];

        DB::transaction(function () use ($instituicoes): void {
            foreach ($instituicoes as $periodo) {
                foreach ($periodo['instituicoes'] as $instituicaoData) {
                    $instituicao = Instituicao::create([
                        'uuid' => Str::uuid(),
                        'republica_id' => $periodo['republica_id'],
                        'nome' => $instituicaoData['nome'],
                        'extinta' => (bool) $instituicaoData['dissolucao'],
                    ]);
                    InstituicaoComTipo::create([
                        'instituicao_id' => $instituicao->id,
                        'instituicao_tipo_id' => 2,
                    ]);
                    InstituicaoDados::create([
                        'instituicao_id' => $instituicao->id,
                        'fundacao' => $instituicaoData['fundacao'] ?? null,
                        'dissolucao' => $instituicaoData['dissolucao'] ?? null,
                    ]);
                }
            }
        });
    }
}
