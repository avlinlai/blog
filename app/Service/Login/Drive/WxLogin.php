<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/1/16
 * Time: 14:36
 */

namespace App\Services\Login\Drive;


use App\Services\Login\contract\AbstractLogin;
use Illuminate\Support\Facades\Log;
use QL\QueryList;

class WxLogin extends AbstractLogin
{
    /**
     * 登录方法
     *
     * @param $code
     *
     * @return array|\Illuminate\Http\JsonResponse
     */
    public function handleLogin()
    {
        $accessToken = request()->get('access_token');
        $openId = request()->get('openid');
        $requestUrl = "https://api.weixin.qq.com/sns/userinfo?access_token={$accessToken}&openid={$openId}&lang=zh_CN";
        $response = QueryList::getInstance()
            ->get($requestUrl)
            ->getHtml();
        $jsonObj = json_decode($response);

        if (!isset($jsonObj->openid) && ($jsonObj->openid != $openId)) {
            return response()->json([
                'code' => -4,
                'msg' => '非法访问'
            ]);
        }
        return $this->authOpenIdLogin('wx', $openId);
    }
}