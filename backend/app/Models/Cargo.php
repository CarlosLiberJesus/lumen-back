<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

final class Cargo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cargos';

    protected $fillable = ['uuid', 'code', 'name', 'params', 'description'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'params' => 'array',
    ];
}
