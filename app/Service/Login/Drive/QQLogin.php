<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/1/16
 * Time: 14:37
 */

namespace App\Services\Login\Drive;


use App\Services\Login\contract\AbstractLogin;
use Illuminate\Support\Facades\Log;
use QL\QueryList;

class QQLogin extends AbstractLogin
{
    public function handleLogin()
    {
        $accessToken = request()->get('access_token');
        $openId = request()->get('openid');
        $appId = config('auth.oauth.qq.appId');
        $requestURL = "https://graph.qq.com/user/get_user_info?openid={$openId}&access_token={$accessToken}&oauth_consumer_key={$appId}";
        $response = QueryList::getInstance()
            ->get($requestURL)
            ->getHtml();
        $responseArray = json_decode($response, true);

        if ($responseArray['ret'] != 0) {
            return response()->json([
                'code' => -1,
                'msg' => '登录错误:'.$responseArray['msg'],
                'loginErrorCode' => 'OAuth错误代码:'.$responseArray['ret'],
            ]);
        }
        return $this->authOpenIdLogin('qq', $openId);
    }
}