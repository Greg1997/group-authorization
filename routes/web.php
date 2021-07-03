<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return redirect(\route('home'));
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/create-user', [App\Http\Controllers\HomeController::class, 'createUser'])->name('create.user');
Route::post('/save-user', [App\Http\Controllers\HomeController::class, 'saveUser'])->name('save.user');
Route::get('/export-pdf', [App\Http\Controllers\HomeController::class, 'exportPdf'])->name('export.pdf');
