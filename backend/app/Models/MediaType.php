<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

final class MediaType extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'media_types';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'type',
        'description',
    ];
}
