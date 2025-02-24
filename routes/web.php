<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\PropertyController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('dashboard');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', [ClientController::class, 'index'])->name('dashboard');
    
    Route::get('/introduce', function () {
        return view('client.introduce');
    });

    Route::get('/product-detail/{id}', [PropertyController::class, 'show'])->name('product.detail');

    Route::get('/post-property', [PropertyController::class, 'create'])->name('post-property');
    Route::post('/post-property', [PropertyController::class, 'store'])->name('property.store');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
