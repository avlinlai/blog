<?php

namespace App\Http\Controllers\User;

use App\Models\user\User;
use App\Services\Login\Login;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
     * 用户登录
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
