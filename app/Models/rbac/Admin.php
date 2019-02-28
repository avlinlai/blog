<?php

namespace App\Models\rbac;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * 设置操作表
     *
     * @var string
     */
    protected $table = 'admins';

    /**
     * 隐藏字段
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'created_at', 'updated_at',
    ];

    /**
     * 全字段可写
     *
     * @var array
     */
    protected $guarded = [];

    ## region 模型关联
    // 用户拥有的权限
    public function HasAuth()
    {
        return $this->hasManyThrough(RoleAndAuth::class, UserAndRole::class, 'admin_id', 'role_id');
    }

    //用户拥有的角色
    public function Roles()
    {
        return $this->belongsToMany(Role::class, 'user_and_role', 'role_id', 'admin_id');
    }

    ## endregion


    ## region 访问器
    // 添加到序列化中
    protected $appends = ['sex_name'];
    // 数据映射
    private $maps = [
        // 性别
        'sex' => ['女', '男'],
    ];

    public function getSexNameAttribute()
    {
        $attr = 'sex';
        return $this->maps[$attr][$this->attributes[$attr]];
    }

    /**
     * 图片访问器 返回绝对完整路径
     *
     * @param $value
     *
     * @return string
     */
    public function getAvatarAttribute($value)
    {
        return config('filesystems.url') . $value;
    }

    /**
     * 图片头像修改器 去掉前缀留下相对路径
     *
     * @param $value
     *
     * @return mixed
     */
    public function setAvatarAttribute($value)
    {
        $this->attributes['avatar'] = str_replace(config('filesystems.url'),'',$value);
    }
}
