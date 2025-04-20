<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class Comissao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'comissoes';

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'uuid',
        'sigla',
        'nome',
        'descricao',
        'comissao_tipo_id',
        'instituicao_id',
        'idOrgao',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'idOrgao' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the commission type that this commission belongs to.
     *
     * @return BelongsTo<ComissaoTipo, $this>
     */
    public function tipo()
    {
        return $this->belongsTo(ComissaoTipo::class, 'comissao_tipo_id');
    }

    /**
     * TODO mais uma vez os casos de uso do controller, entrando em uuid posso não ter de fazer nada
     * Get the institution legislature that this commission belongs to.
     *
     * @return BelongsTo<InstituicaoLegislatura, $this>
     */
    public function legislatura()
    {
        return $this->belongsTo(InstituicaoLegislatura::class, 'instituicao_id');
    }
}
