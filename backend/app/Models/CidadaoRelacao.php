<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;

final class CidadaoRelacao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadao_relacoes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'cidadao_id',
        'com_cidadao_id',
        'relacao_tipo_id',
        'onde',
        'onde_id',
    ];

    /**
     * Get the cidadao that owns the relacao.
     *
     * @return BelongsTo<Cidadao, $this>
     */
    public function cidadao(): BelongsTo
    {
        return $this->belongsTo(Cidadao::class, 'cidadao_id');
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

    /**
     * Get the onde ['instituicoes', 'instituicao_legislatura', 'instituicao_presidenciais'] houve relacoes.
     * onde_id é o id da "instituicao"
     *
     * @return MorphTo<Model, $this>
     */
    public function onde(): MorphTo
    {
        return $this->morphTo();
    }
}
