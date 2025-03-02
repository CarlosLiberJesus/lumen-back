<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Freguesia extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'freguesias';

    protected $fillable = [
        'uuid', 'sinopse', 'name',
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
}
