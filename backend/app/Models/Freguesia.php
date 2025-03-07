<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class Freguesia extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'freguesias';

    protected $fillable = [
        'uuid', 'sinopse', 'nome', 'distrito_id', 'concelho_id', 'freguesia_tipo_id',
    ];

    /**
     * Freguesia belongs to Distrito.
     *
     * @return BelongsTo<Distrito, $this>
     */
    public function distrito(): BelongsTo
    {
        return $this->belongsTo(Distrito::class, 'distrito_id');
    }

    /**
     * Freguesia belongs to Concelho.
     *
     * @return BelongsTo<Concelho, $this>
     */
    public function concelho(): BelongsTo
    {
        return $this->belongsTo(Concelho::class, 'concelho_id');
    }

    /**
     * Freguesia belongs to FreguesiaTipo.
     *
     * @return BelongsTo<FreguesiaTipo, $this>
     */
    public function freguesiaTipo(): BelongsTo
    {
        return $this->belongsTo(FreguesiaTipo::class, 'freguesia_tipo_id');
    }

    /**
     * Concelho has many Anexos.
     *
     * @return HasMany<FreguesiaAnexo, $this>
     */
    public function anexos(): HasMany
    {
        return $this->hasMany(FreguesiaAnexo::class, 'freguesia_id');
    }
}
