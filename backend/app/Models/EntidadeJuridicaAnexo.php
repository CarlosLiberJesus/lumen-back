<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class EntidadeJuridicaAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'entidades_juridica_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'entidades_juridica_id',
        'anexo_tipo_id',
        'anexo',
    ];

    /**
     * Get the entidade juridica that owns the anexo.
     *
     * @return BelongsTo<EntidadeJuridica, $this>
     */
    public function entidadeJuridica(): BelongsTo
    {
        return $this->belongsTo(EntidadeJuridica::class, 'entidades_juridica_id');
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
