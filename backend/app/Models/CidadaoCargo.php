<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class CidadaoCargo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadao_cargos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'cidadao_id',
        'cargo_id',
        'inicio',
        'fim',
        'src',
        'sinopse',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'inicio' => 'date',
        'fim' => 'date',
    ];

    /**
     * Get the cidadao that owns the cargo.
     *
     * @return BelongsTo<Cidadao, $this>
     */
    public function cidadao(): BelongsTo
    {
        return $this->belongsTo(Cidadao::class, 'cidadao_id');
    }

    /**
     * Get the cargo that owns the cidadao cargo.
     *
     * @return BelongsTo<InstituicaoCargo, $this>
     */
    public function cargo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoCargo::class, 'cargo_id');
    }

    /**
     * CidadaoCargo has many Anexos.
     *
     * @return HasMany<CidadaoCargoAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(CidadaoCargoAnexo::class, 'cidadao_id');
    }
}
