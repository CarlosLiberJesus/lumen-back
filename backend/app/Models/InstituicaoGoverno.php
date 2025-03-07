<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoGoverno extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_governos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'instituicao_id',
        'governo_id',
        'sinopse',
    ];

    /**
     * Get the instituicao that owns the governo.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class);
    }

    /**
     * Get the governo that owns the instituicao governo.
     *
     * @return BelongsTo<Governo, $this>
     */
    public function governo(): BelongsTo
    {
        return $this->belongsTo(Governo::class);
    }
}
