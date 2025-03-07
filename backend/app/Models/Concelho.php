<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class Concelho extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'concelhos';

    protected $fillable = [
        'uuid', 'sinopse', 'nome', 'distrito_id',
    ];

    /**
     * Concelho belongs to Distrito.
     *
     * @return BelongsTo<Distrito, $this>
     */
    public function distrito(): BelongsTo
    {
        return $this->belongsTo(Distrito::class, 'distrito_id');
    }

    /**
     * Concelhos has many Freguesias.
     *
     * @return HasMany<Freguesia, $this>
     */
    public function freguesias(): HasMany
    {
        return $this->hasMany(Freguesia::class, 'concelho_id');
    }

    /**
     * Concelho has many Anexos.
     *
     * @return HasMany<ConcelhoAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(ConcelhoAnexo::class, 'concelho_id');
    }
}
