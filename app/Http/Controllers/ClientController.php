<?php

namespace App\Http\Controllers;

use App\Models\Property;
use App\Models\PropertyType;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function index(Request $request)
    {
        // Lấy danh sách loại bất động sản
        $propertyTypes = PropertyType::all();
    
        // Lấy giá trị từ form tìm kiếm
        $selectedType = $request->input('type', ''); // Loại bất động sản
        $searchKeyword = $request->input('search', ''); // Từ khóa tìm kiếm
    
        // Xây dựng truy vấn cơ sở dữ liệu cho bất động sản
        $query = Property::query();
    
        // Nếu có loại bất động sản được chọn, thêm điều kiện lọc theo loại
        if ($selectedType) {
            $query->whereHas('propertyType', function ($q) use ($selectedType) {
                $q->where('slug', $selectedType);
            });
        }
    
        // Nếu có từ khóa tìm kiếm, thêm điều kiện lọc theo title và location
        if ($searchKeyword) {
            $query->where(function ($q) use ($searchKeyword) {
                $q->where('title', 'like', "%{$searchKeyword}%")
                  ->orWhere('location', 'like', "%{$searchKeyword}%");
            });
        }
    
        // Lấy danh sách bất động sản (kèm hình ảnh và loại bất động sản) và phân trang
        $properties = $query->with('propertyType', 'images')->latest()->paginate(12);
    
        // Truyền dữ liệu ra view
        return view('dashboard', compact('propertyTypes', 'properties', 'selectedType', 'searchKeyword'));
    }
    
}
