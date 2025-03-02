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
        'uuid', 'sinopse', 'name',
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
