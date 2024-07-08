@extends('layouts.tableView')

@section('title', 'Professor Consult Students')

@section('content')
    <h1 class="form-title">CONSULTAR ESTUDIANTES ASIGNADOS</h1>
    <form class="triple-form" action="/professorConsultStudents1" method="GET">
        <x-listSelector class="three-columns-item" :items="$courses" name="course" label="Código del Curso" value="carrera"/>
        <x-listSelector class="" :items="$cycles" name="cycle" label="Ciclo"/>
        <x-listSelector class="" :items="$years" name="year" label="Año"/>
        <x-listSelector class="" :items="$sections" name="section" label="Sección"/>
        <x-buttonSubmit class="btn-submit three-columns-item" value="Consultar"/>
    </form>
    <x-tableData class="table-style" :columns="$cols" :rows="$rows"/>   
@endsection