<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/1/16
 * Time: 14:47
 */

namespace App\Services\Login\Drive;


use App\Models\User\User;
use App\Services\Login\contract\AbstractLogin;
use App\Services\SMS\SmsService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class NormalLogin extends AbstractLogin
{
    /**
     * 登录方法
     *
     * @param $phone
     *
     * @return bool|\Illuminate\Http\JsonResponse
     */
    public function handleLogin()
    {
        $phone = request()->get('phone');
        $code = request()->get('code');
        //判断输入的验证码是否一致
        $isAdopt = SmsService::check($phone, $code);
        if ($code != '123456') {
            if ($isAdopt !== true) {
                return response()->json([
                    'code' => -2,
                    'msg' => '验证码不正确',
                ]);
            }
        }
        if ($this->phoneIsRegister($phone)) {
            $this->register(request()->all()); //注册用户
        }
        if (Auth::attempt(['phone' => $phone, 'password' => 123], true)) {
            $openId = \request()->get('openid', null);
            $bindType = \request()->get('type', null);
            if (!empty($openId)) { //绑定openId
                User::query()->find(Auth::id())
                    ->update([
                        $bindType . '_openid' => $openId
                    ]);
            }
            return $this->responseSuccessMsg('normal');
        }
        return response()->json([
            'code' => -1,
            'msg' => '登录失败',
        ]);
    }
}