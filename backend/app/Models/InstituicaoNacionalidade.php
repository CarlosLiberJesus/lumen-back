<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoNacionalidade extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_nacionalidades';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'nacionalidade_id',
    ];

    /**
     * Get the instituicao that owns the nacionalidade.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the nacionalidade that owns the instituicao nacionalidade.
     *
     * @return BelongsTo<Nacionalidade, $this>
     */
    public function nacionalidade(): BelongsTo
    {
        return $this->belongsTo(Nacionalidade::class, 'nacionalidade_id');
    }
}
