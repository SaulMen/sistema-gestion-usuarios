@extends('layouts.tableView')

@section('title', 'Student Get Curriculum')

@section('content')
    <h1 class="form-title">CONSULTAR PENSUM</h1>
    <form class="search-form" action="{{route('student.getCurriculum')}}" method='GET'>
        @csrf 
        <x-listSelector :items="$careers" name="career" label="Código de la Carrera" value="carrera"/>
        <x-buttonSubmit class="btn-submit" value="Consultar"/>
    </form>
    <h1 class="form-title">

        @if(session('selected') != null)
            {{session('selected')}}
        @endif 
    </h1>
    <x-tableData class="table-style" :columns="$cols" :rows="$rows"/>   
@endsection

