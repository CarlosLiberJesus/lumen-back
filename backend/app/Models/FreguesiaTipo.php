<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

final class FreguesiaTipo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'freguesia_tipos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'tipo',
        'descricao',
    ];
}
