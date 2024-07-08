<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;
use GuzzleHttp\Client;

class adminCargar extends Controller
{
    public function index() {
        $username = Session::get('username');
        $password = Session::get('password');
        $rol = Session::get('rol');
        
        if (($username=='admin' and $password =='admin') and $rol=='2') {
            Log::info("desde ADMIN para cargar CSV");
            return view('adminCargar');
        }else{
            return view("login");
        }
    }

    public function create(Request $request){
        $file = $request->file('archivo');

        $client = new Client();

        $res = $client->request('POST', "api-go:8080/uploadfile", [
            'multipart' => [
                [
                    'name'     => 'archivo',
                    'contents' => fopen($file->getPathname(), 'r'),
                    'filename' => $file->getClientOriginalName()
                ]
            ]
        ]);
    
        $respuesta = json_decode($res->getBody());
        $respuesta = json_decode(json_encode($respuesta),true);

        Log::info("Se envio el archivo csv correctamente");

        return redirect()->route('adminHome');

    }

    
}
