<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('user_favorites', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');        // Tham chiếu đến bảng users
            $table->foreignId('property_id')->constrained('properties');  // Tham chiếu đến bảng properties
            $table->timestamps();
    
            // Đảm bảo mỗi người dùng chỉ có thể yêu thích một bất động sản một lần
            $table->unique(['user_id', 'property_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('user_favorites');
    }
    
};
