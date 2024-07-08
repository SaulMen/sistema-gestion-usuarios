<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use \GuzzleHttp\Client;
use App\Http\Controllers\studentProfile;
use App\Http\Controllers\studentGetCurriculum;

class studentDeassignCourse extends Controller
{
    //
    public function index(){
        $profileController = new studentProfile;
        $studentD = $profileController->getStudent();

        if($studentD['error'] == null){
            return view('studentDeassignCourse',['cols'=>config('global.deassignTableColumns'),'rows'=>Session::get('rows'), 'cycles' => config('global.cycles'), 'years' => config('global.years'), 'careers'=>$studentD['success']['career']]);
        }
        
        return view('studentHome');
    }

    public function getAssignedCourses(Request $request){
        Session::put('rows', null);
        Session::put('alert', null);

        $client = new Client();
        

        $response = $client->request('POST', 'http://api-go:8080/studentCourse', [
        $response = $client->request('POST', 'http://api-go:8080/studentCourse', [

            "json" => [
                'carnet' => Session::get('username'),
                'ciclo' => $request->cycle,
                'anio' => $request->year,
            ]

        ]);

        $data = json_decode($response->getBody());
        $data = json_decode(json_encode($data), true);

        if($data['error'] == null){
            Session::put('rows', $data['success']);
            Session::put('selected', $request->career);
            $actual = explode(' - ', $request->career);
            $selectedData = ['cycle'=>$request->cycle, 'career'=>$actual[0]];

            
            $selectedData = ['cycle'=>$request->cycle, 'career'=>$this->searchCareerId($request->career)];
            Session::put('selectedData',$selectedData);

        }else{
            Session::put('alert', $data['error']);
            Session::put('rows', null);
            Session::put('selected', null);
        }
        
        return $this->index();
        //return redirect()->back()->withInput();
        
    }
    

    public function postCourseDeassignment(Request $request){
        Session::put('alert', null);

        $client = new Client();
        $selectedD = Session::get('selectedData');
        $response = $client->request('POST', 'http://api-go:8080/courseUnassignment',[
            "json" => [
                'course_id' => $request->Código,
                'semester'  => $selectedD['cycle'],
                'course_section' => $request->Sección,
                'student_id' => Session::get('username'),
                'career_id' => $selectedD['career'],
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

    public function searchCareerId($career){
        $careersController = new studentGetCurriculum;
        $careers = $careersController->getCareers();
        $careers = $careers['success'];

        
        foreach($careers as $car){
            $car = explode(" - ", $car['carrera']);
            if($car[1] == $career){
                return $car[0];
            }
        }

        return 0;
    }
    

    public function postCourseDeassignment(Request $request){
        Session::put('alert', null);

        $client = new Client();
        $selectedD = Session::get('selectedData');
        $response = $client->request('POST', 'http://api-go:8080/courseUnassignment',[
            "json" => [
                'course_id' => $request->Código,
                'semester'  => $selectedD['cycle'],
                'course_section' => $request->Sección,
                'student_id' => Session::get('username'),
                'career_id' => $selectedD['career'],
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

    // public function searchCareerId($career){
    //     $careersController = new studentGetCurriculum;
    //     $careers = $careersController->getCareers();
    //     $careers = $careers['success'];

        
    //     foreach($careers as $car){
    //         $car = explode(" - ", $car['carrera']);
    //         if($car[1] == $career){
    //             return $car[0];
    //         }
    //     }

    //     return 0;
    // }
}
