<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoGovernoAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_governo_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'instituicao_governo_id',
        'anexo_tipo_id',
        'anexo',
        'descricao',
    ];

    /**
     * Get the instituicao presidencial that owns the anexo.
     *
     * @return BelongsTo<InstituicaoGoverno, $this>
     */
    public function instituicaoGovernamental(): BelongsTo
    {
        return $this->belongsTo(InstituicaoGoverno::class, 'instituicao_governo_id');
    }

    /**
     * Get the anexo tipo that owns the anexo.
     *
     * @return BelongsTo<AnexoTipo, $this>
     */
    public function anexoTipo(): BelongsTo
    {
        return $this->belongsTo(AnexoTipo::class, 'anexo_tipo_id');
    }
}
