<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class InstituicaoContacto extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'instituicao_contactos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'instituicao_id',
        'contacto_tipo_id',
        'contacto',
    ];

    /**
     * Get the instituicao that owns the contacto.
     *
     * @return BelongsTo<Instituicao, $this>
     */
    public function instituicao(): BelongsTo
    {
        return $this->belongsTo(Instituicao::class, 'instituicao_id');
    }

    /**
     * Get the contacto tipo that owns the contacto.
     *
     * @return BelongsTo<ContactoTipo, $this>
     */
    public function contactoTipo(): BelongsTo
    {
        return $this->belongsTo(ContactoTipo::class, 'contacto_tipo_id');
    }
}
