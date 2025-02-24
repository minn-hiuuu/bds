<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $fillable = ['sender_id', 'receiver_id', 'property_id', 'message', 'status'];

    public function sender()
    {
        return $this->belongsTo(User::class, 'sender_id');  // Mối quan hệ N:1 với bảng users
    }

    public function receiver()
    {
        return $this->belongsTo(User::class, 'receiver_id');  // Mối quan hệ N:1 với bảng users
    }

    public function property()
    {
        return $this->belongsTo(Property::class);  // Mối quan hệ N:1 với bảng properties
    }
}
