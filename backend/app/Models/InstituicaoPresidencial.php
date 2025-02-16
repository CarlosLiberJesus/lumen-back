<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class InstituicaoPresidencial extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_presidenciais';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'instituicao_id',
        'presidencial_id',
        'data_inicio',
        'data_fim',
        'sinopse',
    ];

    /**
     * Get the instituicao that owns the presidencial.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the presidencial that owns the instituicao presidencial.
     *
     * @return BelongsTo<Presidencial, $this>
     */
    public function presidencial(): BelongsTo
    {
        return $this->belongsTo(Presidencial::class, 'presidencial_id');
    }

    /**
     * InstituicaoPresidencial has many Medias.
     *
     * @return HasMany<InstituicaoPresidencialAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(InstituicaoPresidencialAnexo::class, 'instituicao_id');
    }
}
