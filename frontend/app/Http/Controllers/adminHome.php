<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class adminHome extends Controller
{


    public function index(){
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("Este es un mensaje desde el home del ADMIN");
            return view("adminHome", compact('username', 'password','rol'));
        }else{
            return view("login");
        }// Devuelve a la vista 'adminHome'
    }

    public function logout() {
        Session::put('username', '');
        Session::put('password', '');
        Session::put('profile', ''); 

        return redirect()->route('login');
    }

}
