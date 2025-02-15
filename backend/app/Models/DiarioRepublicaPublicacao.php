<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class DiarioRepublicaPublicacao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'diario_republica_publicacoes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'src',
        'publicacao',
        'diario_republica_id',
    ];

    /**
     * Get the diario republica that owns the publicacao.
     *
     * @return BelongsTo<DiarioRepublica, $this>
     */
    public function diarioRepublica(): BelongsTo
    {
        return $this->belongsTo(DiarioRepublica::class, 'diario_republica_id');
    }

    /**
     * Get the leis for the diario republica publicacao.
     *
     * @return HasMany<DiarioRepublicaPublicacaoLei, $this>
     */
    public function leis(): HasMany
    {
        return $this->hasMany(DiarioRepublicaPublicacaoLei::class, 'diario_republica_publicacao_id');
    }
}
