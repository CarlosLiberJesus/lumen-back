<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class Role extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'roles';

    protected $fillable = ['uuid', 'code', 'name', 'params', 'description'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'params' => 'array',
    ];

    /**
     * Get the possible cargos for the role.
     *
     * @return HasMany<RoleCargo, $this>
     */
    public function cargos(): HasMany
    {
        return $this->hasMany(RoleCargo::class, 'role_id');
    }
}
