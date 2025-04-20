<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Conferencia extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'conferencias';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'sigla',
        'nome',
        'descricao',
        'instituicao_id',
        'conferencia_tipo_id',
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
     * Get the conference type that this conference belongs to.
     *
     * @return BelongsTo<ConferenciaTipo, $this>
     */
    public function tipo()
    {
        return $this->belongsTo(ConferenciaTipo::class, 'conferencia_tipo_id');
    }

    /**
     * Get the institution legislature that this conference belongs to.
     *
     * @return BelongsTo<InstituicaoLegislatura, $this>
     */
    public function legislatura()
    {
        return $this->belongsTo(InstituicaoLegislatura::class, 'instituicao_id');
    }
}
