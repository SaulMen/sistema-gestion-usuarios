<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;
use GuzzleHttp\Client;

class adminHabilitar extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para regitrar estudiantes");
            return view('adminHabilitar');
        }else{
            return view("login");
        }
    }

    public function create(Request $request){
        $client = new Client();

        $res = $client->request('POST', "api-go:8080/addCourse",[
            "json" => [ 
                "course_id" =>$request->course_id,
                "semester"=>$request->semester,
                "professor_id"=> $request->professor_id,
                'enrollment_capacity' => $request->enrollment_capacity,
                'course_section' => $request->course_section
            ]
        ]);
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        Log::info("Se envio la info de habilitar curso correctamente");

        return redirect()->route('adminHome');

    }
}
