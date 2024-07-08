@extends('layouts.tableView')

@section('title', 'Professor Consult Approvals')

@section('content')
    <h1 class="form-title">CONSULTAR APROBACIONES</h1>
    <form class="triple-form" >
        <x-listSelector class="three-columns-item" :items="$courses" name="course" label="Código del Curso"/>
        
        <x-listSelector class="" :items="$cycles" name="cycle" label="Ciclo"/>
        <x-inputField name="year" label="Año" type="text" value="" readonly=""></x-inputField>
        <x-inputField name="section" label="Sección" type="text" value="" readonly=""></x-inputField>
        
        <x-buttonSubmit class="btn-submit three-columns-item" value="Consultar"/>
    </form>
    <x-tableData class="table-style" :columns="$cols" :rows="$rows"/>   
@endsection