<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

    /**
     * FreguesiaTipo has many Freguesia.
     *
     * @return HasMany<Freguesia, $this>
     */
    public function freguesias(): HasMany
    {
        return $this->hasMany(Freguesia::class, 'freguesia_tipo_id');
    }
}
