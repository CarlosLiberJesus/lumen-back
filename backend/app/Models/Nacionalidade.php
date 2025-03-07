<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

final class Nacionalidade extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'nacionalidades';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'nacionalidade',
        'pais',
        'params',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'params' => 'array',
    ];

    // TODO: get instituicao cidadao por nacionalidade
}
