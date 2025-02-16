<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoRelacao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_relacoes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'com_instituicao_id',
        'com_cidadao_id',
        'relacao_tipo_id',
    ];

    /**
     * Get the instituicao that owns the relacao.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the related instituicao.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function comInstituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'com_instituicao_id');
    }

    /**
     * Get the related cidadao.
     *
     * @return BelongsTo<Cidadao, $this>
     */
    public function comCidadao(): BelongsTo
    {
        return $this->belongsTo(Cidadao::class, 'com_cidadao_id');
    }

    /**
     * Get the relacao tipo that owns the relacao.
     *
     * @return BelongsTo<RelacaoTipo, $this>
     */
    public function relacaoTipo(): BelongsTo
    {
        return $this->belongsTo(RelacaoTipo::class, 'relacao_tipo_id');
    }
}
