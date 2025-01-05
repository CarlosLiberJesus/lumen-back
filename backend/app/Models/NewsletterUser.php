<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewsletterUser extends Model
{
    protected $table = 'newsletter_users';

    protected $fillable = ['name', 'email', 'phone', 'hash'];
}
