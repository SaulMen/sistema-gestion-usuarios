<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use GuzzleHttp\Client;

class adminStudent extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para regitrar estudiantes");
            $res = $this->peticion();
            return view('adminStudent',[
                "res" => $res['success']
            ]);
        }else{
            return view("login");
        }
    }

    public function peticion(){
        $client = new Client();
        
        $res = $client->request('GET', "api-go:8080/getCareer");
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        return $respuesta;

    }

    public function create(Request $request){
        $client = new Client();
        //$res = $client->request('GET', "https://pokeapi.co/api/v2/pokemon/100");

        //"carnet":
        //"names":
        //"lastname":
        //"date":
        //"email":
        //"phone":
        //"direccion":
        //"dpi":
        //"password":



        $res = $client->request('POST', "localhost:8080/createStudent",[
            "json" => [ 
                "carnet" =>$request->carnet,
                "names"=>$request->names,
                "lastname"=> $request->lastname,
                'date' => date("d-m-Y", strtotime($request->date)),
                'email' => $request->email,
                'phone' => $request->phone,
                'direccion' => $request->direccion,
                'dpi' => $request->dpi,
                'career' => $request->career,
                'password' => $request->password
            ]
        ]);
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        Log::info("Se envio la estudiante correctamente");

        return redirect()->route('adminHome');

    }
}
