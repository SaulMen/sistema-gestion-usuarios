<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use GuzzleHttp\Client;

class adminCurso extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para regitrar estudiantes");
            $res = $this->peticion();
            return view('adminCurso',[
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

        $res = $client->request('POST', "api-go:8080/createCourse",[
            "json" => [ 
                "id"=>$request->id,
                "name"=>$request->name,
                "required_credits"=>$request->required_credits,
                "completed_credits"=>$request->completed_credits,
                "career_id"=>$request->career_id,
                "is_mandatory"=>$request->is_mandatory
            ]
        ]);
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        Log::info("Se envio el curso correctamente");

        return redirect()->route('adminHome');

    }
}
