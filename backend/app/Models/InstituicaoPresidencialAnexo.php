<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoPresidencialAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_presidencial_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'instituicao_presidencial_id',
        'anexo_tipo_id',
        'path',
        'src',
    ];

    /**
     * Get the instituicao presidencial that owns the anexo.
     *
     * @return BelongsTo<InstituicaoPresidencial, $this>
     */
    public function instituicaoPresidencial(): BelongsTo
    {
        return $this->belongsTo(InstituicaoPresidencial::class, 'instituicao_presidencial_id');
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
