<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/manage', function () {
    return view('manage');
});

Route::get('tt', function (\Illuminate\Http\Request $request){
    dd($request->header('authorization'));
});
