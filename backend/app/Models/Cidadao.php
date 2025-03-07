<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

/**
 * @property string $uuid
 * @property string $nome
 * @property \Illuminate\Database\Eloquent\Collection<int, CidadaoCargo> $cargos
 */
final class Cidadao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadaos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'nome_completo',
        'data_nascimento',
        'data_falecimento',
        'genero',
        'freguesia_id',
        'nacional',
        'sinopse',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'nacional' => 'boolean',
    ];

    /**
     * Cidadao has personal Data.
     *
     * @return HasOne<CidadaoDados, $this>
     */
    public function pessoal(): HasOne
    {
        return $this->hasOne(CidadaoDados::class, 'cidadao_id');
    }

    /**
     * Cidadao Belong to Freguesia.
     *
     * @return BelongsTo<Freguesia, $this>
     */
    public function freguesia(): BelongsTo
    {
        return $this->belongsTo(Freguesia::class, 'freguesia_id');
    }

    /**
     * Cidadao has many Contactos.
     *
     * @return HasMany<CidadaoContacto, $this>
     */
    public function contactos(): HasMany
    {
        return $this->hasMany(CidadaoContacto::class, 'cidadao_id');
    }

    /**
     * Cidadao has many Moradas.
     *
     * @return HasMany<CidadaoMorada, $this>
     */
    public function moradas(): HasMany
    {
        return $this->hasMany(CidadaoMorada::class, 'cidadao_id');
    }

    /**
     * Cidadao has many Anexos.
     *
     * @return HasMany<CidadaoAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(CidadaoAnexo::class, 'cidadao_id');
    }

    /**
     * Cidadao has many Cargos.
     *
     * @return HasMany<CidadaoCargo, $this>
     */
    public function cargos(): HasMany
    {
        return $this->hasMany(CidadaoCargo::class, 'cidadao_id');
    }

    /**
     * Cidadao has many Relacoes Pessoais.
     *
     * @return HasMany<CidadaoRelacao, $this>
     */
    public function relacoesPessoais(): HasMany
    {
        return $this->hasMany(CidadaoRelacao::class, 'cidadao_id');
    }

    /**
     * Cidadao has many Relacoes Profissionais.
     *
     * @return HasMany<InstituicaoRelacao, $this>
     */
    public function relacoesProfissionais(): HasMany
    {
        return $this->hasMany(InstituicaoRelacao::class, 'com_cidadao_id');
    }

    /**
     * Cidadao can have nacional:true - only portuguese - or many.
     *
     * @return HasMany<Nacionalidade, $this>
     */
    public function nacionalidades(): HasMany
    {
        return $this->hasMany(Nacionalidade::class, 'cidadao_id');
    }
}
