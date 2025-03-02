<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class ConselhoMinistros extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'conselho_ministroses';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'legislatura_id',
        'cargo_id',
        'cidadao_id',
    ];

    /**
     * Get the legislatura that owns the ConselhoMinistros.
     *
     * @return BelongsTo<Legislatura, $this>
     */
    public function legislatura(): BelongsTo
    {
        return $this->belongsTo(Legislatura::class);
    }

    /**
     * Get the cargo that owns the ConselhoMinistros.
     *
     * @return BelongsTo<InstituicaoCargo, $this>
     */
    public function cargo(): BelongsTo
    {
        return $this->belongsTo(InstituicaoCargo::class, 'cargo_id');
    }

    /**
     * Get the cidadao that owns the ConselhoMinistros.
     *
     * @return BelongsTo<Cidadao, $this>
     */
    public function cidadao(): BelongsTo
    {
        return $this->belongsTo(Cidadao::class, 'cidadao_id');
    }
}
