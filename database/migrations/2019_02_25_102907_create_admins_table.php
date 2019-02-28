<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->increments('id');
            $table->string('username')->unique()->comment('用户名');
            $table->string('password')->comment('用户密码');
            $table->string('phone')->unique()->nullable()->comment('手机号码');
            $table->string('email')->nullable()->comment('邮箱');
            $table->string('avatar')->default('https://qudongit.oss-cn-beijing.aliyuncs.com/QQ%E5%9B%BE%E7%89%8720181120143701.jpg')->comment('头像');
            $table->tinyInteger('sex')->default(0)->comment('性别{0是女 1是男}');
            $table->tinyInteger('state')->default(1)->comment('性别{0是禁用 1是正常}');
            $table->text('option')->nullable()->comment('个人选项');
            $table->rememberToken()->comment('记住密码');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins');
    }
}
