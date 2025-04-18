<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

final class Governo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'governos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'sigla',
        'republica_id',
        'eleicao_id',
        'formacao',
        'dissolucao',
        'sinopse',
    ];

    protected $casts = [
        'formacao' => 'date',
        'dissolucao' => 'date',
    ];

    /**
     * Get the republica that owns the governo.
     *
     * @return BelongsTo<Republica, $this>
     */
    public function republica(): BelongsTo
    {
        return $this->belongsTo(Republica::class);
    }

    /**
     * Get the republica that owns the governo.
     *
     * @return HasOne<Eleicao, $this>
     */
    public function eleicao(): HasOne
    {
        return $this->hasOne(Eleicao::class);
    }

    /**
     * Governo has many InstituicaoGoverno.
     *
     * @return HasMany<InstituicaoGoverno, $this>
     */
    public function instituicoes(): HasMany
    {
        return $this->hasMany(InstituicaoGoverno::class, 'governo_id');
    }

    /**
     * Governo has many GovernoAnexos.
     *
     * @return HasMany<GovernoAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(GovernoAnexo::class, 'governo_id');
    }
}
