<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('property_features', function (Blueprint $table) {
            $table->id();
            $table->foreignId('property_id')->constrained('properties');
            $table->string('feature');  // Tên tính năng, ví dụ: "Sân vườn", "Hồ bơi"
            $table->timestamps();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('property_features');
    }
};
