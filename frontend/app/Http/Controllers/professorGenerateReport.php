<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\studentAssignCourse;

class professorGenerateReport extends Controller
{
    public function index(){
        $assignController = new studentAssignCourse;
        $authCourses = $assignController->getCourses();
        if($authCourses['error'] == null){
            return view('professorGenerateReport',['cycles'=>config('global.cycles'), 'courses' => $authCourses['success'], 'sections'=>config('global.sections')]);
        }
        
        return view('professorHome');
    }

    public function postGenReport(Request $request){
        Session::put('alert', null);
        
        $courseSelected = explode(' - ', $request->course);

        $client = new Client();
        
        $response = $client->request('POST', 'http://api-go:8080/genActa', [

        $response = $client->request('POST', 'http://api-go:8080/genActa', [

            "json" => [
                "codigo" => $courseSelected[0],
                "section" => $request->section,
                "ciclo" => $request->cycle,
            ]
            ]);

        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);

        if($data['error'] == null){
            Session::put('alert', $data['success']);
        }else{
            Session::put('alert', $data['error']);
        }

        return redirect()->back()->withInput();
    }
}
