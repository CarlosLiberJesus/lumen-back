<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoDados extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_dados';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'nif',
        'certidao_permanente',
        'instituicao_id',
        'sinopse',
        'fundacao',
        'dissolução',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'fundacao' => 'date',
        'dissolução' => 'date',
    ];

    /**
     * Get the instituicao that owns the dado.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }
}
