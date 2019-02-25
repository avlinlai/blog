<?php

namespace App\Http\Controllers\Admin\System;

use App\Http\Controllers\Base\AdminController;
use App\Models\system\VisitLog;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class VisitLogController extends AdminController
{
    /*
     * 置模型
     */
    protected $model = VisitLog::class;
}
