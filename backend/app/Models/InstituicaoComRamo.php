<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoComRamo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_com_ramos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'instituicao_ramo_id',
    ];

    /**
     * Get the instituicao that owns the instituicao com ramo.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the instituicao ramo that owns the instituicao com ramo.
     *
     * @return BelongsTo<InstituicaoRamo, $this>
     */
    public function instituicaoRamo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoRamo::class, 'instituicao_ramo_id');
    }
}
