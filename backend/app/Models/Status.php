<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

final class Status extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'statuses';

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'color' => 'array',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'name',
        'type',
        'color',
        'description',
    ];
}
