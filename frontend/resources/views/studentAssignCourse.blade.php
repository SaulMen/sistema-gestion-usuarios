@extends('layouts.formViewMaster')

@section('title', 'Assign Course')

@section('form-title', 'DATOS DEL CURSO')

@section('route', '/studentAssign')

@section('method', 'POST')

@section('inputData')
    <x-listSelector :items="$actuals" name="actual" label="Código de la Carrera Actual"/>
    <x-listSelector :items="$courses" name="course" label="Código del curso" value="carrera"></x-listSelector>
    <x-listSelector :items="$cycles" name="cycle" label="Ciclo" ></x-listSelector>
    <x-listSelector :items="$sections" name="section" label="Sección" ></x-listSelector>
    <x-buttonSubmit class="btn-submit" value="Asignar Curso"></x-buttonSubmit>
@endsection
