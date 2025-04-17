<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Eleicao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'eleicoes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'eleicao_tipo_id',
        'data',
        'data_desconhecida',
        'sinopse',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'data' => 'date',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the eleições for that tipo
     *
     * @return BelongsTo<EleicaoTipo, $this>
     */
    public function tipo(): BelongsTo
    {
        return $this->belongsTo(EleicaoTipo::class, 'eleicao_tipo_id');
    }

    /**
     * Get the formatted date or unknown date description.
     *
     * @return string
     */
    public function getDataFormatadaAttribute()
    {
        if (! empty($this->data)) {
            return $this->data->format('Y-m-d');
        }

        return $this->data_desconhecida ?: 'Data desconhecida';
    }
}
