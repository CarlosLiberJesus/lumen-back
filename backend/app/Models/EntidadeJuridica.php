<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

final class EntidadeJuridica extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'entidade_juridicas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'nome',
        'sinopse',
        'params',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'params' => 'array',
    ];

    /**
     * Get the instituicoes for the entidade juridica.
     *
     * @return BelongsToMany<Instituicao, $this>
     */
    public function instituicoes(): BelongsToMany
    {
        return $this->belongsToMany(Instituicao::class, 'instituicao_entidade_juridicas', 'entidade_juridica_id', 'instituicao_id');
    }
}
