<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use GuzzleHttp\Client;

global $username,$password;

class login extends Controller
{
    public function index(){
        Log::info("Este es un mensaje el login");
        return view("login"); // Devuelve a la vista 'adminHome' (está en resourcer/views/.)
    }

    public function authenticate(Request $request) {
        $username = $request->input('user');
        $password = $request->input('password');
        $rol = $request->input('rol');
        Session::put('username', $username);
        Session::put('password', $password);
        Session::put('rol', $rol); 

        $client = new Client();

        $res = $client->request('POST', "api-go:8080/login",[
            "json" => [ 
                "user" =>$request->user,
                "password"=>$request->password,
                "rol"=> $request->rol
            ]
        ]);
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        

        if ($respuesta['success']) {
            if($rol == "0"){
                return redirect()->route('student.home');
               
            }else if($rol == "1"){
                return redirect()->route('professor.home');
            }else{
                return redirect()->route('adminHome');
            }
            
        }

        //if ($username === 'admin' and $password === 'admin' and $profile=='2') {
        //    // Credenciales válidas, redirigir al usuario a la vista adminHome
        //    return redirect()->route('adminHome');
        //} else {
        //    // Credenciales incorrectas, redirigir de vuelta al formulario de login con un mensaje de error
        //    return redirect()->route('login')->with('error', 'Usuario o contraseña incorrectos.');
        //}
    }

}
