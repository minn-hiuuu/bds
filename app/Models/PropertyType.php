<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyType extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'slug', 'icon'];

    public function properties()
    {
        return $this->hasMany(Property::class);  // Mối quan hệ 1:N với bảng properties
    }
}
