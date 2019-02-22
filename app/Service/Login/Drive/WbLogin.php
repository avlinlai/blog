<?php
/**
 * Created by PhpStorm.
 * User: ALG
 * Date: 2019/1/16
 * Time: 14:29
 */

namespace App\Services\Login\Drive;


use App\Services\Login\contract\AbstractLogin;
use QL\QueryList;

class WbLogin extends AbstractLogin
{
    public function handleLogin()
    {
        $openId = request()->get('openid');
        $accessToken = request()->get('access_token');
        $uId = request()->get('uid');

        $html = QueryList::getInstance()
            ->post('https://api.weibo.com/oauth2/get_token_info', [
            'access_token' => $accessToken,
        ])->getHtml();
         $response = json_decode($html);

        if ($uId == $response->uid) {  //token请求获取到的uId和前端获取的uId一致
            return $this->authOpenIdLogin('wb', $openId);
        }
        return response()->json([
            'code'=>-1,
            'msg'=>'登录失败'
        ]);
    }
}