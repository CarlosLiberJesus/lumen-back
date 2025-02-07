<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Cidadao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadaos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'data_nascimento',
        'nif',
        'cc',
        'cc_aux',
        'seg_social',
        'n_saude',
        'freguesia_id',
    ];

    /**
     * Cidadao Belong to Freguesia.
     *
     * @return BelongsTo<Freguesia, $this>
     */
    public function freguesia(): BelongsTo
    {
        return $this->belongsTo(Freguesia::class, 'freguesia_id');
    }
}
