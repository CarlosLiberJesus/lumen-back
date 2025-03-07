<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class DiarioRepublicaPublicacaoAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'diario_republica_publicacao_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'diario_republica_publicacao_id',
        'anexo_tipo_id',
        'anexo',
        'descricao',
    ];

    /**
     * Get the diario republica publicacao that owns the anexo.
     *
     * @return BelongsTo<DiarioRepublicaPublicacao, $this>
     */
    public function diarioRepublicaPublicacao(): BelongsTo
    {
        return $this->belongsTo(DiarioRepublicaPublicacao::class, 'diario_republica_publicacao_id');
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
