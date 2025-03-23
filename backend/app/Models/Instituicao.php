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
        'nome',
        'sigla',
        'sinopse',
        'nacional',
        'extinta',
        'responde_instituicao_id',
        'params',
    ];

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
     * Instituicao has many Anexos.
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
     * Get the entidade juridicas for the instituicao.
     *
     * @return BelongsToMany<EntidadeJuridica, $this>
     */
    public function entidadeJuridicas(): BelongsToMany
    {
        return $this->belongsToMany(EntidadeJuridica::class, 'instituicao_entidade_juridicas', 'instituicao_id', 'entidade_juridica_id');
    }

    /**
     * Get the instituicao tipos for the instituicao.
     *
     * @return BelongsToMany<InstituicaoTipo, $this>
     */
    public function tipos(): BelongsToMany
    {
        return $this->belongsToMany(InstituicaoTipo::class, 'instituicao_com_tipos', 'instituicao_id', 'instituicao_tipo_id');
    }

    /**
     * Instituicao has many Nacionalidades.
     *
     * @return HasMany<InstituicaoNacionalidade, $this>
     */
    public function nacionalidades(): HasMany
    {
        return $this->hasMany(InstituicaoNacionalidade::class, 'instituicao_id');
    }

    /**
     * Instituicao has many Leis.
     * Direitos e deveres da instituicao.
     *
     * @return HasMany<InstituicaoLei, $this>
     */
    public function leis(): HasMany
    {
        return $this->hasMany(InstituicaoLei::class, 'instituicao_id');
    }

    /**
     * Instituicao has many Cargos.
     * Vai gerar cargos para a instituicao.
     *
     * @return HasMany<InstituicaoCargo, $this>
     */
    public function cargos(): HasMany
    {
        return $this->hasMany(InstituicaoCargo::class, 'instituicao_id');
    }

    /**
     * Instituicao has many Relações.
     *
     * @return HasMany<InstituicaoRelacao, $this>
     */
    public function relacoesInstitucionais(): HasMany
    {
        return $this->hasMany(InstituicaoRelacao::class, 'instituicao_id');
    }

    /**
     * Instituicao has many Relações.
     *
     * @return HasMany<InstituicaoRelacao, $this>
     */
    public function relacoesCidadao(): HasMany
    {
        return $this->hasMany(InstituicaoRelacao::class, 'com_cidadao_id');
    }
}
