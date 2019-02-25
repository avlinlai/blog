<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/2/25
 * Time: 11:22
 */

namespace App\Http\Controllers\Admin\User;


use App\Http\Controllers\Base\AdminController;
use App\Services\Login\Login;
use Illuminate\Http\Request;

class LoginController extends AdminController
{
    /**
     * 登录方法
     *
     * @param \Illuminate\Http\Request  $request
     * @param \App\Services\Login\Login $login
     *
     * @return array|bool|\Illuminate\Http\JsonResponse
     */
    public function login(Request $request, Login $login)
    {
        $type = $request->get('type', 'normal');
        return $login->handleLogin($type);
    }

}