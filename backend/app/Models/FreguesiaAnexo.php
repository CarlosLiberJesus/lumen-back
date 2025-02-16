<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class FreguesiaAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'freguesia_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'freguesia_id',
        'anexo_tipo_id',
        'path',
        'src',
    ];

    /**
     * Get the freguesia that owns the anexo.
     *
     * @return BelongsTo<Freguesia, $this>
     */
    public function freguesia(): BelongsTo
    {
        return $this->belongsTo(Freguesia::class, 'freguesia_id');
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
