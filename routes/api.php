<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::namespace('User')->group(function () {
    Route::post('login', 'LoginController@login');
    Route::group(['middleware' => 'auth:api'], function () {
        Route::get('user', 'UserController@getUserInfo');
        Route::get('logout', function () {
            \Illuminate\Support\Facades\Auth::logout();
        });
    });
});


Route::group(['middleware' => ['auth:api', 'auth.check']], function () {
    // 用户管理
    require_once base_path('routes/api/user.php');
    //系统管理
    require_once base_path('routes/api/system.php');
    //内容管理
    require_once base_path('routes/api/article.php');
    //文件上传
    Route::post('upload', 'Admin\System\UploadController@upload');
});
