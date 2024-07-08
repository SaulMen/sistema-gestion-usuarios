<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\studentGetCurriculum;
use App\Http\Controllers\studentProfile;

class studentRequests extends Controller
{
    //
    public function index(){
       
        $curriculumController = new studentGetCurriculum;
        $profileController = new studentProfile;
        $careers = $curriculumController->getCareers();
        $studentD = $profileController->getStudent();

         /* DATOS DE PRUEBA */
         $approved = ['005'=>'Química General','283' => "Análisis y diseño de sistemas", '781' => "Curso 2"];
         $equivalent = ['015'=>'Química 3', '781' => "Curso 2"];
         //---------------------------------------------------------------------------------------------------------

        if($studentD['error'] == null && $careers['error'] == null){
            return view('studentRequest',['approvedCourses'=>$approved, 'equivalentCourses'=>$equivalent, 'careers'=>$careers['success'], 'actuals'=>$studentD['success']['career']]);
        }

        return view('studentHome');
    
    }

    public function postConcurrentCareer(Request $request){
        Session::put('alert', null);

        $career = explode(" - ", $request->simultaneous);
        
        $client = new Client();
        $response = $client->request('POST', 'http://api-go:8080/assignConcurrentCareer', [
        $response = $client->request('POST', 'http://api-go:8080/assignConcurrentCareer', [
            "json" => [
                'career_id' => $career[0],
                'student_id' => Session::get('username'),
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
