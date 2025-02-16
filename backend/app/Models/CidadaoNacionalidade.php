<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class CidadaoNacionalidade extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadao_nacionalidades';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'cidadao_id',
        'nacionalidade_id',
    ];

    /**
     * Get the cidadao that owns the nacionalidade.
     *
     * @return BelongsTo<Cidadao, $this>
     */
    public function cidadao(): BelongsTo
    {
        return $this->belongsTo(Cidadao::class, 'cidadao_id');
    }

    /**
     * Get the nacionalidade that owns the cidadao nacionalidade.
     *
     * @return BelongsTo<Nacionalidade, $this>
     */
    public function nacionalidade(): BelongsTo
    {
        return $this->belongsTo(Nacionalidade::class, 'nacionalidade_id');
    }
}
