<?php

namespace App\Services\Login\contract;

use App\Models\MSG\MSG;
use App\Models\QA\Tags;
use App\Models\User\AppSetUp;
use App\Models\User\User;
use App\Models\User\UserFollowTags;
use App\Models\User\UserInfo;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redis;

abstract class AbstractLogin
{


    /**
     * 接口返回状态码，接口中统一使用此处状态码
     *
     * @var array
     */
    protected $StatusCode = [
        'success' => 0,      // 成功
        'error' => -1,     // 失败
        'no_authority' => -2, // 无权限
    ];

    /**
     * 创建 token
     *
     * @param $user
     *
     * @return mixed
     */
    public function createToken($user)
    {
        $token = $user->createToken(config('auth.token_name'))->accessToken;
        //token 和 userId绑定写入Redis
        $cacheToken = md5($user->id . $token);
        Redis::set($user->id, $cacheToken);
        //设置缓存token过期时间 30天过期
        Redis::EXPIRE($user->id, 60 * 60 * 24 * 30);

        return $token;
    }

    /**
     * openId 登录
     *
     * @param $type
     * @param $openId
     *
     * @return array|\Illuminate\Http\JsonResponse
     */
    public function authOpenIdLogin($type, $openId)
    {
        $user = User::query()
            ->where($type . "_openid", $openId)
            ->first();

        if (empty($user)) {
            return $this->responseErrorMsg($type, $openId);
        }
        if (!empty($this->UserModelLogin($user))) {
            return $this->responseSuccessMsg($type);
        }
    }

    /**
     * 响应登录成功消息
     *
     * @param $type
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function responseSuccessMsg($type)
    {
        return response()->json([
            'msg' => '登陆成功',
            'code' => $this->StatusCode['success'],
            'Authorization' => $this->createToken(Auth::user()),
            'user' => Auth::user(),
            'type' => $type . 'Login'
        ]);
    }

    /**
     * 响应错误消息
     *
     * @param $type
     * @param $openId
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function responseErrorMsg($type, $openId)
    {
        return response()->json([
            'code' => -3,
            'msg' => '登录失败',
            'type' => $type . 'Login',
            'openId' => $openId,
        ]);
    }

    /**
     * 用户模型登录
     *
     * @param $user
     *
     * @return mixed
     */
    public function UserModelLogin($user)
    {
        return Auth::loginUsingId($user->id);
    }

    /**
     * 根据手机号查询用户是否注册
     *
     * @param $phone
     *
     * @return bool
     */
    public function phoneIsRegister($phone)
    {
        $user = User::query()
            ->where('phone', $phone)
            ->first();
        if (empty($user)) {
            return true;
        }
        return false;
    }

    /**
     * 新增注册用户
     *
     * @param $filedValue
     *
     * @return bool
     */
    public function register($filedValue)
    {
        $data = User::query()
            ->create([
                'username' => $filedValue['username'] ?? "建言用户" . (mb_substr(md5(uniqid().uniqid()), 0, 5)),
                'password' => Hash::make(123),
                'phone' => $filedValue['phone'],
                'sex' => $filedValue['sex'] ?? 1,
                'type' => $filedValue['type'] ?? 1,
                'gid' => $filedValue['gid'],
                'option' => $filedValue['option'] ?? null,
                'avatar' => $filedValue['avatar'] ?? 'https://qudongit.oss-cn-beijing.aliyuncs.com/QQ%E5%9B%BE%E7%89%8720181120143701.jpg',
            ]);
        // app设置里面自动插入一条记录
        AppSetUp::query()->create([
            'user_id' => $data['id']
        ]);
        // 用户信息拓展里面插入一条记录
        UserInfo::query()->create([
            'user_id' => $data['id']
        ]);
        //用户的消息设置插入一条记录
        MSG::query()->create([
            'user_id' => $data['id']
        ]);
        if (isset($filedValue['tags'])) { //选择了标签
            //用户id 数据关联 标签
            $tag = array_map(function ($item) use ($data) {
                $result = [];
                $result['user_id'] = $data['id'];
                $result['tag_id'] = $item;
                //标签的总关注人数 total_follow 自增
                Tags::query()
                    ->where('id', $item)
                    ->increment('total_follow');
                return $result;
            }, $filedValue['tags']);
            UserFollowTags::query()->insert($tag);
        }
        return true;
    }

    abstract function handleLogin();
}