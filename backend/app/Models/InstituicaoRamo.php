<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class InstituicaoRamo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_ramos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'tipo',
        'descricao',
    ];

    /**
     * Get the instituicoes for the instituicao carater.
     *
     * @return HasMany<Instituicao, $this>
     */
    public function instituicoes(): HasMany
    {
        return $this->hasMany(Instituicao::class, 'instituicao_ramo_id');
    }
}
