<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoMedia extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_medias';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'uuid',
        'name',
        'media_type_id',
        'path',
        'src',
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
     * Get the media type that owns the media.
     *
     * @return BelongsTo<MediaType, $this>
     */
    public function mediaType(): BelongsTo
    {
        return $this->belongsTo(MediaType::class, 'media_type_id');
    }
}
