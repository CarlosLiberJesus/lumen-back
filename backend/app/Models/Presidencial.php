<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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
        'eleicoes',
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
        'eleicoes' => 'date',
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
}
