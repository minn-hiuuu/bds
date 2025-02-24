<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyFeature extends Model
{
    use HasFactory;

    protected $fillable = ['property_id', 'feature'];

    public function property()
    {
        return $this->belongsTo(Property::class);  // Mối quan hệ N:1 với bảng properties
    }
}
