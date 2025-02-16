<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class DiarioRepublicaSerie extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'diario_republica_series';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'nome',
        'sinopse',
        'serie_id',
    ];

    /**
     * Get the parent serie that owns the serie.
     *
     * @return BelongsTo<DiarioRepublicaSerie, $this>
     */
    public function parentSerie(): BelongsTo
    {
        return $this->belongsTo(self::class, 'serie_id');
    }
}
