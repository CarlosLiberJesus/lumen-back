<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class DiarioRepublicaPublicacaoLei extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'diario_republica_publicacao_leis';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'diario_republica_publicacao_id',
        'lei_id',
        'url',
        'paginas',
    ];

    /**
     * Get the diario republica publicacao that owns the lei.
     *
     * @return BelongsTo<DiarioRepublicaPublicacao, $this>
     */
    public function diarioRepublicaPublicacao(): BelongsTo
    {
        return $this->belongsTo(DiarioRepublicaPublicacao::class, 'diario_republica_publicacao_id');
    }

    /**
     * Get the lei that owns the diario republica publicacao lei.
     *
     * @return BelongsTo<Lei, $this>
     */
    public function lei(): BelongsTo
    {
        return $this->belongsTo(Lei::class, 'lei_id');
    }
}
