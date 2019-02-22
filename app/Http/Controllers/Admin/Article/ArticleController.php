<?php

namespace App\Http\Controllers\Admin\Article;

use App\Http\Controllers\Base\AdminController;

use App\Models\Article\Article;
use App\Models\Article\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class ArticleController extends AdminController
{
    /**
     * 控制器模型
     *
     * @var string
     */
    protected $model = Article::class;

    /**
     * 添加文章
     *
     * @param \Illuminate\Http\Request $request 请求体
     *
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\FromVerif
     */
    public function add(Request $request)
    {
        //验证表单字段
        $article = $this->formVerif($request, [
            'title' => 'required', //文章标题
            'content' => 'required', //文章内容
            'photo' => 'nullable', //文章封面
            'description' => 'nullable', //文章描述
            'is_jump' => 'nullable', //随机跳转
            'is_wechat' => 'nullable', //是否检测微信
            'arrow' => 'nullable',    //文章箭头返回地址
            'physics' => 'nullable', //物理按键返回地址
            'url' => 'nullable', //文章访问地址
            'music' => 'nullable',    //背景音乐
            'appid' => 'nullable',    //微信appId
            'key' => 'nullable',  //微信密匙
            'right_now' => 'nullable',    //文章立即跳转
            'cnzz' => 'nullable', //第三方流量统计
            'is_encryption' => 'nullable', //页面加密
            'iframe' => 'nullable', //嵌套网页
            'source_check' => 'nullable', //来源检测
        ]);

        $article['publish_time'] = date('Y-m-d H:i:s'); //发布时间默认当前时间
        $article['author'] = \Illuminate\Support\Facades\Auth::user()->username; //作者默认当前登录人员
        $article['user_id'] = \Illuminate\Support\Facades\Auth::id(); //用户默认当前用户Id
        $res = Article::query()->create($article);
        return $this->returnMsg($res);
    }

    /**
     * 获得文章详细
     *
     * @param integer $id 文章id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function get($id)
    {
        $data = $this->model::find($id);
        //临时隐藏一些字段方便后续调用
        return $this->returnData($data->makeHidden(['status', 'other'])->toArray());
    }

    public function getPid($id)
    {
        $pid = Category::query()
            ->where('id', $id)
            ->first(['id', 'pid'])
            ->toArray();
        //如果不是最顶级
        if ($pid['pid'] != 0) {
            return $this->getPid($pid['pid']);
        }
        return $pid['id'];
    }

    public function getList(Request $request)
    {
        $query = $this->model::orderBy('publish_time', 'desc');
        $data = $this->filter($query,  $request, 'array');
        return response()->json($data);
    }

    /**
     * 修改文章
     *
     * @param  integer                 $id      文章id
     * @param \Illuminate\Http\Request $request 请求体
     *
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\FromVerif
     */
    public function edit($id, Request $request)
    {
        //验证表单字段
        $filedValue = $this->formVerif($request, [
            'title' => 'required', //文章标题
            'content' => 'required', //文章内容
            'photo' => 'nullable', //文章封面
            'description' => 'nullable', //文章描述
            'is_jump' => 'nullable', //随机跳转
            'is_wechat' => 'nullable', //是否检测微信
            'arrow' => 'nullable',    //文章箭头返回地址
            'physics' => 'nullable', //物理按键返回地址
            'url' => 'nullable', //文章访问地址
            'music' => 'nullable',    //背景音乐
            'appid' => 'nullable',    //微信appId
            'key' => 'nullable',  //微信密匙
            'right_now' => 'nullable',    //文章立即跳转
            'cnzz' => 'nullable', //第三方流量统计
            'is_encryption' => 'nullable', //页面加密
            'iframe' => 'nullable', //嵌套网页
            'source_check' => 'nullable', //来源检测
        ]);
        $res = Article::query()->find($id)->update($filedValue);
        return $this->returnMsg($res);
    }

    /**
     * 清除缓存
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function clean()
    {
        $cache_prefix = 'OA:'; //Redis缓存前缀
        $cache_arr = Redis::keys($cache_prefix . "*");
        foreach ($cache_arr as $item) {
            Redis::del($item);
        }
        return $this->returnMsg(true);
    }
}
