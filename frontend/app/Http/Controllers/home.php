<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class home extends Controller
{
    public function index(){
        Log::info("Este es un mensaje desde el home principal");
        return view("home"); // 
    }
}
