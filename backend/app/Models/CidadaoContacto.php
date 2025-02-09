<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class CidadaoContacto extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cidadao_contactos';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = ['cidadao_id', 'contacto_tipo_id', 'contacto'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'params' => 'array',
    ];

    /**
     * Contacto Belong to Tipo.
     *
     * @return BelongsTo<ContactoTipo, $this>
     */
    public function contacto_tipo(): BelongsTo
    {
        return $this->belongsTo(ContactoTipo::class, 'contacto_tipo_id');
    }
}
