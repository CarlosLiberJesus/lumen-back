<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class DiarioRepublica extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'diario_republicas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'publicacao',
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
     * Get the publicacoes for the diario republica.
     *
     * @return HasMany<DiarioRepublicaPublicacao, $this>
     */
    public function publicacoes(): HasMany
    {
        return $this->hasMany(DiarioRepublicaPublicacao::class, 'diario_republica_id');
    }
}
