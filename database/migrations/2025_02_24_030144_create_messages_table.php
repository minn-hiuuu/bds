<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sender_id')->constrained('users');       // Tham chiếu đến người gửi
            $table->foreignId('receiver_id')->constrained('users');     // Tham chiếu đến người nhận
            $table->foreignId('property_id')->constrained('properties'); // Tham chiếu đến bất động sản
            $table->text('message');
            $table->enum('status', ['sent', 'read', 'archived'])->default('sent');
            $table->timestamps();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('messages');
    }
};
