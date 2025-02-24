<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\PropertyImage;
use App\Models\PropertyFeature;
use Illuminate\Support\Facades\Auth;

class PropertyController extends Controller
{
    /**
     * Hiển thị form đăng bất động sản
     */
    public function create()
    {
        return view('client.post_property');
    }

    /**
     * Xử lý lưu bất động sản
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'price' => 'required|numeric',
            'location' => 'required|string',
            'property_type_id' => 'required|exists:property_types,id',
            'images.*' => 'image|mimes:jpg,jpeg,png,gif|max:2048',
            'features' => 'nullable|array',
            'features.*' => 'string|max:255',
        ]);

        // Lưu thông tin bất động sản
        $property = Property::create([
            'author_id' => Auth::id(),
            'property_type_id' => $request->property_type_id,
            'title' => $request->title,
            'description' => $request->description,
            'price' => $request->price,
            'location' => $request->location,
            'status' => 'available',
        ]);

        // Xử lý upload hình ảnh
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('properties', 'public'); // Lưu vào storage/app/public/properties
                PropertyImage::create([
                    'property_id' => $property->id,
                    'image_path' => 'storage/' . $path, // Lưu vào DB với đường dẫn chính xác
                ]);
            }
        }

        // Lưu tiện ích (features)
        if ($request->features) {
            foreach ($request->features as $feature) {
                PropertyFeature::create([
                    'property_id' => $property->id,
                    'feature' => $feature,
                ]);
            }
        }

        return redirect()->route('dashboard')->with('success', 'Bất động sản đã được đăng thành công!');
    }

    public function show($id)
    {
        $property = Property::with(['images', 'features', 'propertyType', 'author'])
                            ->find($id);

        return view('client.product_detail', compact('property'));
    }
}
