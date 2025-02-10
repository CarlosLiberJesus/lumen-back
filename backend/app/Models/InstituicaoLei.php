<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class InstituicaoLei extends Model
{
    protected $table = 'instituicao_leis';

    protected $fillable = [
        'instituicao_id',
        'lei_id',
    ];

    /**
     * Get the instituicao that owns the instituicao legislatura.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao()
    {
        return $this->belongsTo(Instituicao::class);
    }

    /**
     * Instituição sobre legislação.
     *
     * @return HasMany<Instituicao, $this>
     */
    public function lei(): HasMany
    {
        return $this->hasMany(Lei::class);
    }
}
