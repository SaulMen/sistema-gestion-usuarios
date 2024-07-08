<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use GuzzleHttp\Client;

class adminCarrera extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para regitrar estudiantes");
            return view('adminCarrera');
        }else{
            return view("login");
        }
    }

    public function create(Request $request){
        $client = new Client();

        $res = $client->request('POST', "api-go:8080/createCarreer",[
            "json" => [ 
                "name"=>$request->name
            ]
        ]);
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        Log::info("Se envio la carrera correctamente");

        return redirect()->route('adminHome');

    }
}
