<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/2/22
 * Time: 16:49
 */

namespace App\JM;


class Auth
{
    /**
     * 用户对象
     *
     * @var
     */
    public $user;

    /**
     * 授权token
     *
     * @var array|null|string
     */
    private $token;

    /**
     * 获得用户信息
     *
     * Auth constructor.
     *
     * @param $type
     */
    public function __construct($type)
    {
        $this->token = request()->header('authorization');
        if ($type == 'home') { //前端客户信息
            $this->home();
        }
        if ($type == 'admin') { //后端客户信息
            $this->admin();
        }
    }

    /**
     * 返回用户信息
     *
     * @return mixed
     */
    public function user()
    {
        return $this->user;
    }

    /**
     * 返回用户ID
     *
     * @return mixed
     */
    public function id()
    {
        return $this->user->id;
    }

    /**
     * 获得当前后端登录用户信息
     */
    private function admin()
    {
        //todo 获取用户信息
        $this->user = '';
    }

    /**
     * 获得当前前端登录用户信息
     */
    private function home()
    {
        //todo 获取用户信息
        $this->user = '';
    }

    public function createToken()
    {
        //todo 生成token
        /*
         * 1个用户只能有一个 token,  token 定期删除
         */
        return '123token';
    }

    /**
     * 检查token
     */
    public function checkToken()
    {
        //todo 用户表中是否存在token
    }

    /**
     * 默认返回本体
     *
     * @return $this
     */
    public function back()
    {
        return $this;
    }
}