<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoCargoAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_cargo_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'instituicao_cargo_id',
        'anexo_tipo_id',
        'anexo',
    ];

    /**
     * Get the instituicao cargo that owns the anexo.
     *
     * @return BelongsTo<InstituicaoCargo, $this>
     */
    public function instituicaoCargo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoCargo::class, 'instituicao_cargo_id');
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
