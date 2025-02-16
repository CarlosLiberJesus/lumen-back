<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoCargoLei extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_cargo_leis';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'instituicao_cargo_id',
        'lei_id',
    ];

    /**
     * Get the instituicao cargo that owns the lei.
     *
     * @return BelongsTo<InstituicaoCargo, $this>
     */
    public function instituicaoCargo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoCargo::class, 'instituicao_cargo_id');
    }

    /**
     * Get the lei that owns the instituicao cargo lei.
     *
     * @return BelongsTo<Lei, $this>
     */
    public function lei(): BelongsTo
    {
        return $this->belongsTo(Lei::class, 'lei_id');
    }
}
