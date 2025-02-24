<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('property_images', function (Blueprint $table) {
            $table->id();
            $table->foreignId('property_id')->constrained('properties'); // Tham chiếu đến bảng properties
            $table->string('image_path');  // Đường dẫn đến ảnh
            $table->timestamps();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('property_images');
    }    
};
