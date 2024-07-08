@extends('layouts.tableView')

@section('title', 'Professor Consult Reports')

@section('content')
    <h1 class="form-title">CONSULTAR ACTAS</h1>
    <form class="double-form" >
        <x-listSelector class="" :items="$courses" name="course" label="Código del Curso"/>
        <x-buttonSubmit class="btn-submit" value="Consultar"/>
    </form>
    <x-tableData class="table-style" :columns="$cols" :rows="$rows"/>   
@endsection