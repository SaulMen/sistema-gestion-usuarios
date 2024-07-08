<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\studentGetCurriculum;
use App\Http\Controllers\studentProfile;
use App\Http\Controllers\studentDeassignCourse;


class studentAssignCourse extends Controller
{
    public function index(){
        $profileController = new studentProfile;
        $studentD = $profileController->getStudent();

        $authCourses = $this->getCourses();
        

        if($authCourses['error'] == null && $studentD['error'] == null){
            return view('studentAssignCourse',['courses' => $authCourses['success'], 'cycles'=>config('global.cycles'), 'sections'=>config('global.sections'), 'actuals'=>$studentD['success']['career']]);
        }else{
            return ('studentHome');    
        }
    }

    public function getCourses(){
        $client = new Client();
        
        $response = $client->request('GET', 'http://api-go:8080/getCourse');

        $response = $client->request('GET', 'http://api-go:8080/getCourse');

        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);
        return $data;
    }

    public function postCourseAssignment(Request $request){
        Session::put('alert', null);
        
        $course = explode(" - ", $request->course);

        $career = explode(" - ", $request->actual);

        //$career = explode(" - ", $request->actual);

        $searcher = new studentDeassignCourse;


        $client = new Client();
        $response = $client->request('POST', 'http://api-go:8080/courseAssignment', [
        $response = $client->request('POST', 'http://api-go:8080/courseAssignment', [
            "json" => [
                'course_id' => $course[0],
                'semester' => $request->cycle,
                'course_section' => $request->section,
                'student_id' => Session::get('username'),
                'career_id' => $career[0],//$searcher->searchCareerId($request->actual),
                'career_id' => $searcher->searchCareerId($request->actual),
            ]

        ]);

        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);

        if($data['error'] == null){
            Session::put('alert', $data['success']);
        }else{
            Session::put('alert', $data['error']);
        }
        
        return $this->index();
        
    }

}
