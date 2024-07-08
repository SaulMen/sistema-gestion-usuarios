<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class consultSchedules extends Controller
{
    public function index(){
        $columns=['Carnet', 'Nombre', 'Sección', 'Catedrático', 'Auxiliar', 'Ubicación', 'Días', 'Horario'];
        $courses = ['283'=>'Análisis y Diseño de Sistemas 1', 
                    '775'=>'Sistemas de Bases de Datos 2',
                    '975' =>'Redes de Computadoras 2',
                    '285'=>'Sistemas Operativos 2' ];
        
        $cycles = ['1S', '2S', 'VJ', 'VD'];
        // $rows = null;
        $rows = [[283, 'Análisis 1', 'B', 'Edgar Rodas','Bryan Páez', 'meet', 'S', '7:10-10:30']];
        return view('consultSchedules',['cols'=>$columns, 'courses'=>$courses, 'rows'=>$rows, 'cycles'=>$cycles]);
    }

}
