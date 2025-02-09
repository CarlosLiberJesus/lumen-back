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
        'instituicao_carater_id',
        'nome',
        'sigla',
        'link',
        'descricao',
        'responde_instituicao_id',
    ];

    /**
     * Get the instituicao carater that owns the instituicao.
     *
     * @return BelongsTo<InstituicaoCarater, $this>
     */
    public function instituicaoCarater(): BelongsTo
    {
        return $this->belongsTo(InstituicaoCarater::class, 'instituicao_carater_id');
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
     * @return HasMany<InstituicaoMedia, $this>
     */
    public function medias(): HasMany
    {
        return $this->hasMany(InstituicaoMedia::class, 'instituicao_id');
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
     * Instituicao has many Dados.
     *
     * @return HasOne<InstituicaoDados, $this>
     */
    public function dados(): HasOne
    {
        return $this->hasOne(InstituicaoDados::class, 'instituicao_id');
    }
}
