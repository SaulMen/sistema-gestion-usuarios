<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;
use GuzzleHttp\Client;

class adminPrerrequisito extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para añadir prerrequisito");
            $res = $this->peticion();
            return view('adminPrerrequisito', [
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

    public function create(Request $request){
        $client = new Client();

        $res = $client->request('POST', "api-go:8080/addCoursePrerequisite",[
            "json" => [ 
                "course_id" =>$request->course_id,
                "prerequisite_id"=>$request->prerequisite_id
            ]
        ]);
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        Log::info("Se envio el prerrequisito correctamente");

        return redirect()->route('adminHome');

    }
}
