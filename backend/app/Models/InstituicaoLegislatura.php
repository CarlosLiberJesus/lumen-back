<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoLegislatura extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_legislaturas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'instituicao_id',
        'legislatura_id',
        'data_inicio',
        'data_fim',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'data_inicio' => 'date',
        'data_fim' => 'date',
    ];

    /**
     * Get the instituicao that owns the instituicao legislatura.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the legislatura that owns the instituicao legislatura.
     *
     * @return BelongsTo<Legislatura, $this>
     */
    public function legislatura(): BelongsTo
    {
        return $this->belongsTo(Legislatura::class, 'legislatura_id');
    }
}
