<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Log extends Model
{
    protected $fillable = ['user_id', 'code', 'time', 'url', 'reply', 'params'];

    /**
     * Cidadao Belong to Freguesia.
     *
     * @return BelongsTo<User, $this>
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
