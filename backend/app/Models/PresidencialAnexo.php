<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class PresidencialAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'presidenciais_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'presidencial_id',
        'anexo_tipo_id',
        'anexo',
    ];

    /**
     * Get the presidencial that owns the anexo.
     *
     * @return BelongsTo<Presidencial, $this>
     */
    public function presidencial(): BelongsTo
    {
        return $this->belongsTo(Presidencial::class, 'presidencial_id');
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
