<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class Distrito extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'distritos';

    protected $fillable = [
        'uuid', 'descriptions', 'name',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'descriptions' => 'array',
    ];

    /**
     * Districto has many Concelhos.
     *
     * @return HasMany<Concelho, $this>
     */
    public function concelhos(): HasMany
    {
        return $this->hasMany(Concelho::class);
    }
}
