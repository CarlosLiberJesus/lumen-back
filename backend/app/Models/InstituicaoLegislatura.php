<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

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
        'instituicao_id',
        'legislatura_id',
        'sinopse',
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

    /**
     * InstituicaoLegislatura has many Anexos.
     *
     * @return HasMany<InstituicaoLegislaturaAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(InstituicaoLegislaturaAnexo::class, 'instituicao_legislatura_id');
    }

    /**
     * InstituicaoLei representa direitos e deveres.
     *
     * @return HasMany<InstituicaoLei, $this>
     */
    public function leis(): HasMany
    {
        return $this->hasMany(InstituicaoLei::class, 'instituicao_legislatura_id');
    }

    /**
     * Todo na volta ainda podemos ter melhor refinamento nestas querry
     * Comissao representa a comissões existentes nesta legislatura
     *
     * @return HasMany<Comissao, $this>
     */
    public function parlamentoComissoes(): HasMany
    {
        return $this->hasMany(Comissao::class, 'comissao_id');
    }

    /**
     * Conferencia representa a comissões existentes nesta legislatura
     *
     * @return HasMany<Conferencia, $this>
     */
    public function parlamentoConferencia(): HasMany
    {
        return $this->hasMany(Conferencia::class, 'conferencia_id');
    }
}
