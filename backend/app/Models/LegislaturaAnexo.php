<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class LegislaturaAnexo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'legislatura_anexos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'nome',
        'legislatura_id',
        'anexo_tipo_id',
        'path',
        'src',
    ];

    /**
     * Get the legislatura that owns the anexo.
     *
     * @return BelongsTo<Legislatura, $this>
     */
    public function legislatura(): BelongsTo
    {
        return $this->belongsTo(Legislatura::class, 'legislatura_id');
    }

    /**
     * Get the anexo tipo that owns the anexo.
     *
     * @return BelongsTo<AnexoTipo, $this>
     */
    public function anexoTipo(): BelongsTo
    {
        return $this->belongsTo(AnexoTipo::class, 'anexo_tipo_id');
    }
}
