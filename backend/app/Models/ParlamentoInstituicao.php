<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class ParlamentoInstituicao extends Model
{
    use HasFactory;

    protected $table = 'parlamento_instituicoes';

    protected $fillable = [
        'instituicao_id',
        'legislatura_id',
    ];

    public function instituicao()
    {
        return $this->belongsTo(Instituicao::class);
    }

    public function legislatura()
    {
        return $this->belongsTo(Legislatura::class);
    }
}
