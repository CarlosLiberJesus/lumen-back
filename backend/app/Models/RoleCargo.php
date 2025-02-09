<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class RoleCargo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'role_cargos';

    protected $fillable = ['uuid', 'code', 'name', 'params', 'description', 'role_id'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'params' => 'array',
    ];

    /**
     * Get the adenda lei that owns the adenda.
     *
     * @return BelongsTo<Role, $this>
     */
    public function role(): BelongsTo
    {
        return $this->belongsTo(Role::class, 'role_id');
    }
}
