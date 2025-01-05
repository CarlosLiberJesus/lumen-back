<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'statuses';

    protected $casts = ['color' => 'array'];

    protected $fillable = ['uuid', 'name', 'color', 'description'];
}
