<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class Lei extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'leis';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'codigo',
        'proponente',
        'sumario',
        'texto',
        'path',
        'em_vigor',
        'data_toggle',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'data_toggle' => 'date',
    ];

    /**
     * Get the diario republica publicacao that owns the lei.
     *
     * @return BelongsTo<DiarioRepublicaPublicacaoLei, $this>
     */
    public function diarioRepublicaPublicacao(): BelongsTo
    {
        return $this->belongsTo(DiarioRepublicaPublicacaoLei::class, 'lei_id');
    }

    /**
     * TODO: Pensar se está bem, e a função reversa
     * Get the adendas for the lei.
     *
     * @return HasMany<LeiAdenda, $this>
     */
    public function adendas(): HasMany
    {
        return $this->hasMany(LeiAdenda::class, 'lei_original_id');
    }

    /**
     * Lei has many Medias.
     *
     * @return HasMany<LeiAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(LeiAnexo::class, 'cidadao_id');
    }

    /**
     * Get the lei emissores for the lei.
     *
     * @return HasMany<LeiEmissor, $this>
     */
    public function emissores(): HasMany
    {
        return $this->hasMany(LeiEmissor::class, 'lei_id');
    }
}
