<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'uuid',
        'nome',
        'anexo_tipo_id',
        'anexo',
        'descricao',
    ];

    /**
     * Get the instituicao that owns the media.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the media that owns the lei media.
     *
     * @return BelongsTo<AnexoTipo, $this>
     */
    public function anexoTipo(): BelongsTo
    {
        return $this->belongsTo(AnexoTipo::class, 'anexo_tipo_id');
    }
}
