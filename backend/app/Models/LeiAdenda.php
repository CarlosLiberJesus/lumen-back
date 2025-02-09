<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class LeiAdenda extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'lei_adendas';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'lei_original_id',
        'lei_adenda_id',
    ];

    /**
     * Get the original lei that owns the adenda.
     *
     * @return BelongsTo<Lei, $this>
     */
    public function originalLei(): BelongsTo
    {
        return $this->belongsTo(Lei::class, 'lei_original_id');
    }

    /**
     * Get the adenda lei that owns the adenda.
     *
     * @return BelongsTo<Lei, $this>
     */
    public function adendaLei(): BelongsTo
    {
        return $this->belongsTo(Lei::class, 'lei_adenda_id');
    }
}
