<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class studentHomeController extends Controller
{
    public function index(){
        Session::put('alert', null);
        Session::put('rows', null);
        Session::put('selected', null);
        
        /* DATOS DE PRUEBA */
        //Session::put('username', '202000011');
        //----------------------------------------
        
        Session::put('carnet', Session::get('username'));
        
        return view('studentHome');
    }


}
