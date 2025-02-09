<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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
        'url',
        'publicacao',
        'diario_republica_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'publicacao' => 'date',
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
}
