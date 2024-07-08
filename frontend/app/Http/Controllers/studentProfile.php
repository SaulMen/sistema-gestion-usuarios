<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;

class studentProfile extends Controller
{
    //
    public function index(){
        $studentD = $this->getStudent();
        if($studentD['error'] == null){
            $data = $studentD['success'];
            $career = implode(' - ', $data['career']);
            Session::put('fullname', $data['fullname']);
            Session::put('date_birth', $data['date_birth']);
            Session::put('email', $data['email']);
            Session::put('phone_number', $data['phone_number']);
            Session::put('address', $data['address']);
            Session::put('dpi', $data['dpi']);
            Session::put('career', $career);
            Session::put('completed_credits', $data['completed_credits']);
        }

        return view('studentProfile');
    }


    public function getStudent(){
        // DATOS DE PRUEBA
        

        $client = new Client();
        $url = "http://api-go:8080/getStudent?studentId=".Session::get('username');
        $client = new Client();
        $url = "http://api-go:8080/getStudent?studentId=".Session::get('username');

        $response = $client->request('GET', $url);
        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);
        return $data;
        //dd(Session::get('carnet'));
    }
}
