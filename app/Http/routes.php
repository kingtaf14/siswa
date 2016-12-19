<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/




/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    Route::get('/', 'PagesController@homepage');
    Route::get('about', 'PagesController@about');

    $this->get('login', 'Auth\AuthController@showLoginForm');
    $this->post('login', 'Auth\AuthController@login');
    $this->get('logout', 'Auth\AuthController@logout');
    Route::get('register', function() {
        return redirect('/');
    });

    Route::get('siswa/cari', 'SiswaController@cari');
    Route::resource('siswa', 'SiswaController');
    Route::resource('kelas', 'KelasController');
    Route::resource('hobi', 'HobiController');
    Route::resource('user', 'UserController');
});