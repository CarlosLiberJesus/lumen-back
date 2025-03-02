<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class InstituicaoTipo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_tipos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'codigo',
        'tipo',
        'sinopse',
    ];

    /**
     * Get the instituicoes for the instituicao carater.
     *
     * @return HasMany<Instituicao, $this>
     */
    public function instituicoes(): HasMany
    {
        return $this->hasMany(Instituicao::class, 'instituicao_tipo_id');
    }
}
