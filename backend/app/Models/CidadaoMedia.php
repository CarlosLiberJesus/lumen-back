<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class CidadaoMedia extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadao_medias';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'cidadao_id',
        'uuid',
        'name',
        'media_type_id',
        'path',
        'src',
    ];

    /**
     * Get the cidadao that owns the media.
     *
     * @return BelongsTo<Cidadao, $this>
     */
    public function cidadao(): BelongsTo
    {
        return $this->belongsTo(Cidadao::class, 'cidadao_id');
    }

    /**
     * Get the media type that owns the media.
     *
     * @return BelongsTo<MediaType, $this>
     */
    public function mediaType(): BelongsTo
    {
        return $this->belongsTo(MediaType::class, 'media_type_id');
    }
}
