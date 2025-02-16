<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class Legislatura extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'legislaturas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'code',
        'republica_id',
        'eleicoes',
        'formacao',
        'dissolucao',
        'sinopse',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'eleicoes' => 'date',
        'formacao' => 'date',
        'dissolucao' => 'date',
    ];

    /**
     * Legislatura Belong to Republica.
     *
     * @return BelongsTo<Republica, $this>
     */
    public function republica(): BelongsTo
    {
        return $this->belongsTo(Republica::class, 'republica_id');
    }

    /**
     * Legislatura has many Anexos.
     *
     * @return HasMany<InstituicaoAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(InstituicaoAnexo::class, 'legislatura_id');
    }
}
