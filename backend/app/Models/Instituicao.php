<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

final class Instituicao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicoes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'instituicao_ramo_id',
        'republica_id',
        'nome',
        'sigla',
        'sinopse',
        'responde_instituicao_id',
        'entidade_juridicas_id',
    ];

    /**
     * Get the instituicao carater that owns the instituicao.
     *
     * @return BelongsTo<InstituicaoRamo, $this>
     */
    public function instituicaoRamo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoRamo::class, 'instituicao_ramo_id');
    }

    /**
     * Get the instituicao that this instituicao responds to.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function respondeInstituicao(): BelongsTo
    {
        return $this->belongsTo(self::class, 'responde_instituicao_id');
    }

    /**
     * Get the legislaturas for the instituicao.
     *
     * @return BelongsToMany<Legislatura, $this>
     */
    public function legislaturas(): BelongsToMany
    {
        return $this->belongsToMany(Legislatura::class, 'instituicao_legislaturas', 'instituicao_id', 'legislatura_id');
    }

    /**
     * Instituicao has many Medias.
     *
     * @return HasMany<InstituicaoAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(InstituicaoAnexo::class, 'instituicao_id');
    }

    /**
     * Instituicao has many Moradas.
     *
     * @return HasMany<InstituicaoMorada, $this>
     */
    public function moradas(): HasMany
    {
        return $this->hasMany(InstituicaoMorada::class, 'instituicao_id');
    }

    /**
     * Instituicao has one Dados.
     *
     * @return HasOne<InstituicaoDados, $this>
     */
    public function dados(): HasOne
    {
        return $this->hasOne(InstituicaoDados::class, 'instituicao_id');
    }

    /**
     * Instituicao has many Contactos.
     *
     * @return HasMany<InstituicaoContacto, $this>
     */
    public function contactos(): HasMany
    {
        return $this->hasMany(InstituicaoContacto::class, 'instituicao_id');
    }

    /**
     * Instituicao HasOne EntidadeJuridica.
     *
     * @return HasOne<EntidadeJuridica, $this>
     */
    public function entidadeJuridica(): HasOne
    {
        return $this->hasOne(EntidadeJuridica::class, 'id', 'entidade_juridicas_id');
    }

    /**
     * Instituicao BelongsTo Republica.
     *
     * @return BelongsTo<Republica, $this>
     */
    public function republica(): BelongsTo
    {
        return $this->belongsTo(Republica::class, 'republica_id');
    }

    /**
     * Instituicao has many InstituicaoRamos.
     *
     * @return HasMany<InstituicaoComRamo, $this>
     */
    public function ramos(): HasMany
    {
        return $this->hasMany(InstituicaoComRamo::class, 'instituicao_id');
    }
}
