<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/1/16
 * Time: 14:47
 */

namespace App\Services\Login\Drive;

use App\Services\Login\contract\AbstractLogin;
use App\Services\SMS\SmsService;

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
        $user = $this->userModel::query()
            ->where('phone', $phone)
            ->first();
        if (is_null($user)) {
            return response()->json([
                'code' => -1,
                'msg' => '登录失败',
            ]);
        } else {
            $openId = \request()->get('openid', null);
            $bindType = \request()->get('type', null);
            if (!empty($openId)) { //绑定openId
                $this->userModel::query()->where('phone', $phone)
                    ->update([
                        $bindType . '_openid' => $openId
                    ]);
            }
            $this->UserModelLogin($user);
            return $this->responseSuccessMsg('normal');
        }

    }
}