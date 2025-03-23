<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoComTipo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_com_tipos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'instituicao_tipo_id',
    ];

    /**
     * Get the instituicao that owns the instituicao com tipo.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the instituicao tipo that owns the instituicao com tipo.
     *
     * @return BelongsTo<InstituicaoTipo, $this>
     */
    public function instituicaoTipo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoTipo::class, 'instituicao_tipo_id');
    }
}
