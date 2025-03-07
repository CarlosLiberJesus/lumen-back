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
        'uuid', 'sinopse', 'nome',
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

    /**
     * Districto has many Freguesias.
     *
     * @return HasMany<Freguesia, $this>
     */
    public function freguesias(): HasMany
    {
        return $this->hasMany(Freguesia::class);
    }

    /**
     * Distrito has Many DistritoAnexos.
     *
     * @return HasMany<DistritoAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(DistritoAnexo::class, 'distrito_id');
    }
}
