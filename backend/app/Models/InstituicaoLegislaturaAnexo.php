<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoLegislaturaAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_legislatura_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'instituicao_legislatura_id',
        'anexo_tipo_id',
        'path',
        'src',
    ];

    /**
     * Get the instituicao legislatura that owns the anexo.
     *
     * @return BelongsTo<InstituicaoLegislatura, $this>
     */
    public function instituicaoLegislatura(): BelongsTo
    {
        return $this->belongsTo(InstituicaoLegislatura::class, 'instituicao_legislatura_id');
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
