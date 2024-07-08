<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class professorConsultReports extends Controller
{
    public function index(){
        $columns=['Código','Seccion', 'Ciclo', 'Año', 'Cantidad de Estudiantes Asignados', 'Fecha y Hora'];
        $courses = ['283'=>'Análisis y Diseño de Sistemas 1', 
                    '775'=>'Sistemas de Bases de Datos 2',
                    '975' =>'Redes de Computadoras 2',
                    '285'=>'Sistemas Operativos 2' ];
        
        // $rows = null;
        $rows = [['283','A','PRIMER SEMESTRE', 2024, 60, '24/05/2024 17:40:20']];
        return view('professorConsultReports',['cols'=>$columns, 'courses'=>$courses, 'rows'=>$rows]);
    }
}
