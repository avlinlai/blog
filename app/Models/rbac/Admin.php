<?php

namespace App\Models\rbac;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    use HasApiTokens, Notifiable;
    /*
     * 置操作表
     */
    protected $table = 'admins';

    /*
     * 全字段可写
     */
    protected $guarded = [];

}
