<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

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
        'data_nascimento',
        'freguesia_id',
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
     * Cidadao has many Medias.
     *
     * @return HasMany<CidadaoMedia, $this>
     */
    public function medias(): HasMany
    {
        return $this->hasMany(CidadaoMedia::class, 'cidadao_id');
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
}
