<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use GuzzleHttp\Client;

class adminAgregar extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para regitrar estudiantes");
            $res = $this->peticion();
            return view('adminAgregar', [
                "res" => $res['success']
            ]);
        }else{
            return view("login");
        }
    }

    public function peticion(){
        $client = new Client();
        
        $res = $client->request('GET', "api-go:8080/getCourse");
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        return $respuesta;

    }

    // Aquí falta el POST, pero este aún no está en el back
}
