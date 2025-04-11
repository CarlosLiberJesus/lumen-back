<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class GovernoAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'governo_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'governo_id',
        'anexo_tipo_id',
        'anexo',
        'descricao',
    ];

    /**
     * Get the governo that owns the anexo.
     *
     * @return BelongsTo<Governo, $this>
     */
    public function governo(): BelongsTo
    {
        return $this->belongsTo(Governo::class);
    }

    /**
     * Get the anexo tipo that owns the anexo.
     *
     * @return BelongsTo<AnexoTipo, $this>
     */
    public function anexoTipo(): BelongsTo
    {
        return $this->belongsTo(AnexoTipo::class);
    }
}
