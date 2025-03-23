<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoEntidadeJuridica extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_entidade_juridicas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'entidade_juridica_id',
    ];

    /**
     * Get the instituicao that owns the instituicao entidade juridica.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the entidade juridica that owns the instituicao entidade juridica.
     *
     * @return BelongsTo<EntidadeJuridica, $this>
     */
    public function entidadeJuridica(): BelongsTo
    {
        return $this->belongsTo(EntidadeJuridica::class, 'entidade_juridica_id');
    }
}
