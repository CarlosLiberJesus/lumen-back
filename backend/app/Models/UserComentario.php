<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;

final class UserComentario extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_comentarios';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'em',
        'comentario_id',
        'comentario',
        'user_id',
    ];

    /**
     * Get the user that owns the comentario.
     *
     * @return BelongsTo<User, $this>
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Get the em ['users', 'instituicoes', 'cidadaos', 'cidadao_cargos', 'instituicao_legislaturas', 'instituicao_presidenciais'] houve comentarios.
     * onde_id é o id da "instituicao"
     *
     * @return MorphTo<Model, $this>
     */
    public function em(): MorphTo
    {
        return $this->morphTo();
    }
}
