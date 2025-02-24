<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserFavorite extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'property_id'];

    public function user()
    {
        return $this->belongsTo(User::class);  // Mối quan hệ N:1 với bảng users
    }

    public function property()
    {
        return $this->belongsTo(Property::class);  // Mối quan hệ N:1 với bảng properties
    }
}
