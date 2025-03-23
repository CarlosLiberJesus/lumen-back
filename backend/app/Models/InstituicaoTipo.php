<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

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
     * Get the instituicoes for the instituicao tipo.
     *
     * @return BelongsToMany<Instituicao, $this>
     */
    public function instituicoes(): BelongsToMany
    {
        return $this->belongsToMany(Instituicao::class, 'instituicao_com_tipos', 'instituicao_tipo_id', 'instituicao_id');
    }
}
