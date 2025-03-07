<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Log extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'logs';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = ['user_id', 'aplicacao_id', 'method', 'message', 'code', 'time', 'url', 'reply', 'params'];

    public function setAplicacaoIdAttribute(string $value): void
    {
        $aplicacao = Aplicacao::where('uuid', $value)->first();
        $this->attributes['aplicacao_id'] = $aplicacao ? $aplicacao->id : null;
    }

    /**
     * Log Pertence a utilizador.
     *
     * @return BelongsTo<User, $this>
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Log Pertence a aplicacao.
     *
     * @return BelongsTo<Aplicacao, $this>
     */
    public function aplicacao(): BelongsTo
    {
        return $this->belongsTo(Aplicacao::class, 'aplicacao_id');
    }
}
