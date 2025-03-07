<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Cidadao;
use App\Models\InstituicaoCargo;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;

final class CidadaoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return array<string, mixed>
     */
    public function index(Request $request): array
    {
        $perPage = filter_var($request->input('perPage', 10), FILTER_VALIDATE_INT) ?: 10;
        $search = filter_var($request->input('text', ''), FILTER_SANITIZE_STRING) ?: '';
        $page = filter_var($request->input('page', 1), FILTER_VALIDATE_INT) ?: 1;

        $query = Cidadao::query();

        if ($search !== '') { // Verifica string não vazia
            $query->where(function ($q) use ($search): void {
                $q->where('nome', 'like', sprintf('%%%s%%', $search))
                    ->orWhere('nome_completo', 'like', sprintf('%%%s%%', $search));
            });
        }

        $cidadaos = $query->paginate($perPage, ['*'], 'page', $page);

        return [
            'cidadaos' => $cidadaos->items(),
            'pagination' => [
                'page' => $cidadaos->currentPage(),
                'perPage' => $cidadaos->perPage(),
                'total' => $cidadaos->total(),
            ],
        ];
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): void
    {
        //
    }

    /**
     * Display the specified resource
     *
     * @return array<string, mixed>
     */
    public function show(string $uuid): array
    {
        /** @var Cidadao $cidadao */
        $cidadao = Cidadao::with(['cargos.cargo' => function (Builder $query): void {
            $query->join('instituicao_governos', 'instituicao_cargos.instituicao_id', '=', 'instituicao_governos.id')
                ->join('instituicoes', 'instituicao_governos.instituicao_id', '=', 'instituicoes.id')
                ->join('governos', 'instituicao_governos.governo_id', '=', 'governos.id')
                ->select('instituicao_cargos.*',
                    'instituicoes.nome as instituicao_nome',
                    'instituicoes.uuid as instituicao_uuid',
                    'governos.uuid as governo_uuid',
                    'governos.sigla',
                    'governos.nome as governo_nome');
        }])->where('uuid', $uuid)->firstOrFail();

        $cargos = [];
        foreach ($cidadao->cargos->sortBy('inicio') as $cargo) {
            $cargoRel = $cargo->cargo ?? new InstituicaoCargo;
            $cargos[] = [
                'nome' => $cargoRel->cargo,
                'instituicao' => [
                    'uuid' => $cargoRel->instituicao_uuid,
                    'nome' => $cargoRel->instituicao_nome,
                ],
                'governo' => [
                    'uuid' => $cargoRel->governo_uuid,
                    'sigla' => $cargoRel->sigla,
                    'nome' => $cargoRel->governo_nome,
                ],
                'inicio' => $cargo->inicio?->toDateString(),
                'fim' => $cargo->fim?->toDateString(),
                'sinopse' => $cargo->sinopse,
            ];
        }

        return [
            'uuid' => $cidadao->uuid,
            'nome' => $cidadao->nome,
            'cargos' => $cargos,
        ];
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Cidadao $cidadao): void
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cidadao $cidadao): void
    {
        //
    }
}
