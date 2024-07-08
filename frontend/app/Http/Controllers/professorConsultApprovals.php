<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class professorConsultApprovals extends Controller
{
    public function index(){
        $columns=['Código','Carnet', 'Nombre Completo', 'Estado'];
        $courses = ['283'=>'Análisis y Diseño de Sistemas 1', 
                    '775'=>'Sistemas de Bases de Datos 2',
                    '975' =>'Redes de Computadoras 2',
                    '285'=>'Sistemas Operativos 2' ];
        
        $cycles = ['1S', '2S', 'VJ', 'VD'];
        // $rows = null;
        $rows = [['283','200000000', 'Nombre Completo', 'APROBADO']];
        return view('professorConsultApprovals',['cols'=>$columns, 'courses'=>$courses, 'rows'=>$rows, 'cycles'=>$cycles]);
    }
}
