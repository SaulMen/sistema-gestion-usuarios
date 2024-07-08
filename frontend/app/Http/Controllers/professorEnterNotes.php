<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\studentAssignCourse;
use App\Http\Controllers\studentDeassignCourse;
use App\Http\Controllers\professorConsultStudents;

class professorEnterNotes extends Controller
{
    //
    public function index(){
        $assignController = new studentAssignCourse;
        
        $authCourses = $assignController->getCourses();
        if($authCourses['error'] == null){
            return view('professorEnterNotes',['courses' => $authCourses['success'], 'cycles'=>config('global.cycles'), 'sections'=>config('global.sections'), 'years'=>config('global.years'), 'cols'=>config('global.enterNotesTableColumns'),'rows'=>Session::get('rows')]);
        }
        return view('professorHome');

    }

    public function postNote(Request $request){
        Session::put('alert', null);

        $dataSelec  = Session::get('selectedData');
        $searcher = new studentDeassignCourse;
        
        $careerId = explode(' - ', $request->Carrera);
        
        
        $client = new Client();
        $response = $client->request('POST','http://api-go:8080/studentScore', [

        $careerId = $searcher->searchCareerId($request->Carrera);
        
        $client = new Client();
        $response = $client->request('POST','http://api-go:8080/studentScore', [

            "json" => [
                "course_id" =>  $dataSelec['course'],
                "semester" => $dataSelec['cycle'],
                "course_section" => $dataSelec['section'],
                "student_id" => $request->Carnet,
                "score" => $request->Nota,

                "career_id" => $careerId[0],

                "career_id" => $careerId,

            ]
        ]);

        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);

        if($data['error'] == null){
            Session::put('alert', $data['success']);
            Session::put('rows', $this->filterId($request->Carnet)); 

        }else{
           Session::put('alert', $data['error']);
        }
        
        return redirect()->back()->withInput();
    }


    public function filterId($carnet){
        $rows = Session::get('rows');
   
        foreach($rows as $index => $row){
            if($row['student_id'] == $carnet){
                unset($rows[$index]);
                return $rows;
            }
        }

        return null;

        
    }
}   
