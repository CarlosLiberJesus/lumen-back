<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class EntidadeJuridicaLei extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'entidades_juridica_leis';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'entidades_juridica_id',
        'lei_id',
    ];

    /**
     * Get the entidade juridica that owns the lei.
     *
     * @return BelongsTo<EntidadeJuridica, $this>
     */
    public function entidadeJuridica(): BelongsTo
    {
        return $this->belongsTo(EntidadeJuridica::class, 'entidades_juridica_id');
    }

    /**
     * Get the lei that owns the entidade juridica lei.
     *
     * @return BelongsTo<Lei, $this>
     */
    public function lei(): BelongsTo
    {
        return $this->belongsTo(Lei::class, 'lei_id');
    }
}
