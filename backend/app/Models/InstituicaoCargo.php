<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property string $instituicao_uuid
 * @property string $instituicao_nome
 * @property string $governo_uuid
 * @property string $sigla
 * @property string $governo_nome
 */
final class InstituicaoCargo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_cargos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'cargo',
        'tipo',
        'instituicao_id',
        'cargo_responde_id',
        'sinopse',
        'params',
    ];

    /**
     * Cargo que responde a este cargo
     *
     * @return BelongsTo<InstituicaoCargo, $this>
     */
    public function cargoResponde(): BelongsTo
    {
        return $this->belongsTo(self::class, 'cargo_responde_id');
    }
}
