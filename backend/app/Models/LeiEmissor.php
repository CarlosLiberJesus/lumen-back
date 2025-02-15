<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class LeiEmissor extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'lei_emissores';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'lei_id',
        'emissor_tipo',
        'emissor_id',
    ];

    /**
     * Get the lei that owns the emissor.
     *
     * @return BelongsTo<Lei, $this>
     */
    public function lei(): BelongsTo
    {
        return $this->belongsTo(Lei::class, 'lei_id');
    }
}
