<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/1/16
 * Time: 14:38
 */

namespace App\Services\Login;


use App\Services\Login\Drive\NormalLogin;
use App\Services\Login\Drive\QQLogin;
use App\Services\Login\Drive\WbLogin;
use App\Services\Login\Drive\WxLogin;

class Login
{
    public function handleLogin($type)
    {
        if ($type == 'normal') {
            return (new NormalLogin)->handleLogin();
        }
        if ($type == 'wx') {
            return (new WxLogin)->handleLogin();
        }
        if ($type == 'wb') {
            return (new WbLogin)->handleLogin();
        }
        if ($type == 'qq') {
            return (new QQLogin)->handleLogin();
        }

    }
}