<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class LeiParte extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'lei_partes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'codigo',
        'parte',
        'sinopse',
    ];

    /**
     * Get the leis for the lei carater.
     *
     * @return HasMany<Lei, $this>
     */
    public function leis(): HasMany
    {
        return $this->hasMany(Lei::class, 'lei_parte_id');
    }
}
