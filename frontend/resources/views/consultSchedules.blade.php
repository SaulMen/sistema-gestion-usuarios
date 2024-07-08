@extends('layouts.tableView')

@section('title', 'Professor Consult Schedules')

@section('content')
    <h1 class="form-title">CONSULTAR HORARIOS</h1>
    <form class="double-form" >
        <x-listSelector class="two-columns-fields" :items="$courses" name="course" label="Código del Curso"/>
        <x-listSelector class="" :items="$cycles" name="cycle" label="Ciclo"/>
        <x-buttonSubmit class="btn-submit" value="Consultar"/>
    </form>
    <x-tableData class="table-style" :columns="$cols" :rows="$rows"/>   
@endsection