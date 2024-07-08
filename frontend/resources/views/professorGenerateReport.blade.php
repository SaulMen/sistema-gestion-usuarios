@extends('layouts.formViewMaster')

@section('title', 'Professor Generate Report')

@section('form-title', 'DATOS DEL CURSO')

@section('route', '/professorGenerateReport')

@section('method', 'POST')

@section('inputData')
    <x-listSelector :items="$courses" name="course" label="Código del curso" value="carrera"></x-listSelector>
    <x-listSelector :items="$cycles" name="cycle" label="Ciclo" ></x-listSelector>
    <x-listSelector :items="$sections" name="section" label="Sección" ></x-listSelector>
    <x-buttonSubmit class="btn-submit" value="Generar Acta"></x-buttonSubmit>
@endsection