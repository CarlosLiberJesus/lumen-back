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
        'instituicao_legislatura_id',
        'instituicao_id',
        'proponente',
        'sumario',
        'texto',
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
     * Get the instituicao legislatura that owns the lei.
     *
     * @return BelongsTo<InstituicaoLegislatura, $this>
     */
    public function instituicaoLegislatura(): BelongsTo
    {
        return $this->belongsTo(InstituicaoLegislatura::class, 'instituicao_legislatura_id');
    }

    /**
     * Get the instituicao legislatura that owns the lei.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
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
     * @return HasMany<LeiMedia, $this>
     */
    public function medias(): HasMany
    {
        return $this->hasMany(LeiMedia::class, 'cidadao_id');
    }
}
