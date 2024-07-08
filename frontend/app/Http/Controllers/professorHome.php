<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class professorHome extends Controller
{
    //
    public function index(){
        /*Datos de prueba */
        //Session::put('username', 1);
        //-------------------------------------------------

        Session::put('alert', null);
        Session::put('siif',Session::get('username'));
        Session::put('rows', null);
        
        return view('professorHome');
    }
}
