<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

final class Presidencial extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'presidenciais';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'republica_id',
        'eleicao_id',
        'posse',
        'termino',
        'sinopse',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'posse' => 'date',
        'termino' => 'date',
    ];

    /**
     * Get the republica that owns the presidencial.
     *
     * @return BelongsTo<Republica, $this>
     */
    public function republica(): BelongsTo
    {
        return $this->belongsTo(Republica::class, 'republica_id');
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
     * Presidencial anexos.
     *
     * @return HasMany<PresidencialAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(PresidencialAnexo::class, 'presidencial_id');
    }
}
