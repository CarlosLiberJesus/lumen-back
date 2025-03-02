<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

final class AnexoTipo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'anexo_tipos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'tipo',
        'descricao',
        'params',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'params' => 'array',
    ];
}
