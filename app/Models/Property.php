<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    use HasFactory;

    protected $fillable = ['author_id', 'property_type_id', 'title', 'description', 'price', 'location', 'status'];

    // Mối quan hệ với bảng property_types (N:1)
    public function propertyType()
    {
        return $this->belongsTo(PropertyType::class);
    }

    // Mối quan hệ với bảng property_features (1:N)
    public function features()
    {
        return $this->hasMany(PropertyFeature::class);
    }

    // Mối quan hệ với bảng property_images (1:N)
    public function images()
    {
        return $this->hasMany(PropertyImage::class);
    }

    // Mối quan hệ với bảng user_favorites (N:M)
    public function userFavorites()
    {
        return $this->belongsToMany(User::class, 'user_favorites');
    }

    // Mối quan hệ với bảng messages (1:N)
    public function messages()
    {
        return $this->hasMany(Message::class);
    }

    // ✅ Mối quan hệ với bảng users (1:N), lấy thông tin người đăng
    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }
}
