<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;


class professorConsultStudents extends Controller
{
    public function index(){
        $assignController = new studentAssignCourse;
        
        $authCourses = $assignController->getCourses();
        if($authCourses['error'] == null){
            return view('professorConsultStudents',['courses' => $authCourses['success'], 'cycles'=>config('global.cycles'), 'sections'=>config('global.sections'), 'years'=>config('global.years'), 'cols'=>config('global.consultStudentsTableColumns'),'rows'=>Session::get('rows')]);
        }
        return view('professorHome');
    }


    public function getStudents(Request $request){
        $client = new Client();
        $courseId = explode(' - ', $request->course);
        $querys = '?courseId='.$courseId[0].'&semester='.$request->cycle.'&year='.$request->year.'&section='.$request->section;


        $url = 'http://api-go:8080/getAssignments'.$querys;

        $url = 'http://api-go:8080/getAssignments'.$querys;

        $response = $client->request('GET', $url);
        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);

        if($data['error'] == null){
            Session::put('rows', $data['success']);
            $dataSel = ['course'=>$courseId[0], 'cycle'=>$request->cycle, 'section'=>$request->section];
            Session::put('selectedData', $dataSel);
        }else{
            Session::put('rows', null);
            Session::put('selectedData', null);
        }

        return redirect()->back()->withInput();
    }

}
