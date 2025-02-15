<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class LeiAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'lei_medias';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'name',
        'lei_id',
        'anexo_tipo_id',
        'path',
        'url',
    ];

    /**
     * Get the lei that owns the media.
     *
     * @return BelongsTo<Lei, $this>
     */
    public function lei(): BelongsTo
    {
        return $this->belongsTo(Lei::class, 'lei_id');
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
