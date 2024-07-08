<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;

class studentGetCurriculum extends Controller
{
    //
    public function index(){
        
        $careers = $this->getCareers();
        
        if($careers['error'] == null){
            return view('studentGetCurriculum',['cols'=>config('global.curriculumTableColumns'), 'careers'=>$careers['success'], 'rows'=> Session::get('rows')]);
        }else{
            return view('studentHome');
        }
        
    }

    public function getCareers(){
        $client = new Client();
        $response = $client->request('GET', 'http://api-go:8080/getCareer');

        $response = $client->request('GET', 'http://api-go:8080/getCareer');
        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);
        return $data;
    }

    public function getCurriculum(Request $request){
        $career = explode(" - ", $request->career);
        
        
        $url = 'http://api-go:8080/getPensum?careerId='.$career[0];
        $url = 'http://api-go:8080/getPensum?careerId='.$career[0];
        $client = new Client();
        $response = $client->request('GET', $url);

        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);
        if($data['error'] == null){
            Session::put('rows', $data['success']);
            Session::put('selected', $career[1]);
        }else{
            Session::put('rows', null);
            Session::put('selected', null);
        }
        
        return $this->index();
    }

}
