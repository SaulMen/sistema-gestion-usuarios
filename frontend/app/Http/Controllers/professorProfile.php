<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;

class professorProfile extends Controller
{
    public function index(){
        $professorD = $this->getProfessor();
        if($professorD['error'] == null){
            $data = $professorD['success'];
            Session::put('fullname', $data['fullname']);
            Session::put('date_birth', $data['date_birth']);
            Session::put('email', $data['email']);
            Session::put('phone_number', $data['phone_number']);
            Session::put('address', $data['address']);
            Session::put('dpi', $data['dpi']);
            
        }
        return view('professorProfile');
    }

    public function getProfessor(){
        $client = new Client();
        
        $url = "http://api-go:8080/getProfessor?professorId=".Session::get('siif');
        
        $url = "http://api-go:8080/getProfessor?professorId=".Session::get('siif');

        $response = $client->request('GET', $url);
        
        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);
        return $data;
    }
}
