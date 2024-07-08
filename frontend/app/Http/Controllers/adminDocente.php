<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use GuzzleHttp\Client;

class adminDocente extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para regitrar estudiantes");
            return view('adminDocente');
        }else{
            return view("login");
        }
    }

    public function peticion(){
        $client = new Client();
        //$res = $client->request('GET', "https://pokeapi.co/api/v2/pokemon/50");
        $res = $client->request('GET', "api-go:3000/getrooms");
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        return $respuesta;

    }

    public function create(Request $request){
        $client = new Client();

        $res = $client->request('POST', "api-go:8080/createDoc",[
            "json" => [ 
                "siif" =>$request->siif,
                "name"=>$request->name,
                "lastname"=> $request->lastname,
                'date' => date("d-m-Y", strtotime($request->date)),
                'email' => $request->email,
                'phone' => $request->phone,
                'direct' => $request->direct,
                'dpi' => $request->dpi,
                'passwrod' => $request->passwrod
            ]
        ]);
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        Log::info("Se envio la info de docente correctamente");

        return redirect()->route('adminHome');

    }
}
