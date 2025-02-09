<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoMorada extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_moradas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'morada',
        'codigo_postal',
        'localidade',
        'concelho_id',
    ];

    /**
     * Get the instituicao that owns the morada.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the concelho that owns the morada.
     *
     * @return BelongsTo<Concelho, $this>
     */
    public function concelho(): BelongsTo
    {
        return $this->belongsTo(Concelho::class, 'concelho_id');
    }
}
