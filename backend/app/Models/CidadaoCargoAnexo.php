<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class CidadaoCargoAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadao_cargo_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'cidadao_cargo_id',
        'anexo_tipo_id',
        'anexo',
        'descricao',
    ];

    /**
     * Get the cidadao cargo that owns the anexo.
     *
     * @return BelongsTo<CidadaoCargo, $this>
     */
    public function cidadaoCargo(): BelongsTo
    {
        return $this->belongsTo(CidadaoCargo::class, 'cidadao_cargo_id');
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
