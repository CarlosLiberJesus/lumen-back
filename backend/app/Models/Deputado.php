<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOneThrough;

final class Deputado extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'deputados';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'deputado_id',
        'parlamento_id',
        'partido_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the institution cargo that this deputado belongs to.
     *
     * @return BelongsTo<InstituicaoCargo, $this>
     */
    public function cargo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoCargo::class, 'deputado_id');
    }

    /**
     * Get the parliament (legislatura) this deputy belongs to.
     *
     * @return BelongsTo<InstituicaoLegislatura, $this>
     */
    public function parlamento(): BelongsTo
    {
        return $this->belongsTo(InstituicaoLegislatura::class, 'parlamento_id');
    }

    /**
     * Get the political party this deputy represents.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function partido(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'partido_id');
    }

    /**
     * Get the citizen information through the cargo.
     *
     * @return HasOneThrough<Cidadao, CidadaoCargo, $this>
     */
    public function cidadao(): HasOneThrough
    {
        return $this->hasOneThrough(
            Cidadao::class,
            CidadaoCargo::class,
            'cargo_id', // Foreign key on cidadao_cargos table
            'id',       // Foreign key on cidadaos table
            'deputado_id', // Local key on deputados table
            'cidadao_id'  // Local key on cidadao_cargos table
        );
    }
}
