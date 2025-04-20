<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Reuniao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'reunioes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'descricao',
        'tipo',
        'instituicao_id',
        'reunioes_tipo_id',
        'reuId',
        'inicio',
        'termino',
        'parlamento_comissao_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'reuId' => 'integer',
        'inicio' => 'datetime',
        'termino' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the meeting type that this meeting belongs to.
     *
     * @return BelongsTo<ReuniaoTipo, $this>
     */
    public function tipo(): BelongsTo
    {
        return $this->belongsTo(ReuniaoTipo::class, 'reunioes_tipo_id');
    }

    /**
     * Get the institution that this meeting belongs to.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the commission that this meeting belongs to.
     *
     * @return BelongsTo<Comissao, $this>
     */
    public function comissao(): BelongsTo
    {
        return $this->belongsTo(Comissao::class, 'parlamento_comissao_id');
    }

    /**
     * Get the duration of the meeting in minutes.
     */
    public function getDuracaoAttribute(): ?float
    {
        if (!$this->termino) {
            return null;
        }

        return $this->inicio->diffInMinutes($this->termino);
    }
}
