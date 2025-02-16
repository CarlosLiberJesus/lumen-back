<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class Republica extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'republicas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'ano_inicio',
        'ano_fim',
        'sinopse',
    ];

    /**
     * Republica has many Legislaturas.
     *
     * @return HasMany<Legislatura, $this>
     */
    public function legislaturas(): HasMany
    {
        return $this->hasMany(Legislatura::class, 'republica_id');
    }

    /**
     * Republica has many Instituicoes.
     *
     * @return HasMany<Instituicao, $this>
     */
    public function instituicoes(): HasMany
    {
        return $this->hasMany(Instituicao::class, 'republica_id');
    }

    /**
     * Republica has many Anexos.
     *
     * @return HasMany<RepublicaAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(RepublicaAnexo::class, 'republica_id');
    }
}
