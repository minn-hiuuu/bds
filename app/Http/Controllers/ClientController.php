<?php

namespace App\Http\Controllers;

use App\Models\Property;
use App\Models\PropertyType;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function index()
    {
        // Lấy danh sách loại bất động sản
        $propertyTypes = PropertyType::all();

        // Lấy danh sách bất động sản kèm theo danh sách hình ảnh
        $properties = Property::with('propertyType', 'images')->latest()->take(6)->get();

        return view('dashboard', compact('propertyTypes', 'properties'));
    }

}
