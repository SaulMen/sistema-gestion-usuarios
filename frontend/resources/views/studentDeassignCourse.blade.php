@extends('layouts.tableView')

@section('title', 'Student Deassign Course')

@section('content')
    <h1 class="form-title">CURSOS ASIGNADOS</h1>
    <form class="search-form" action="{{route('student.assignedCourses')}}" method='GET'>
        <x-listSelector :items="$cycles" name="cycle" label="Ciclo"/>
        <x-listSelector :items="$years" name="year" label="Año"/>
        <x-listSelector :items="$careers" name="career" label="Carrera"/>
        <x-buttonSubmit class="btn-submit" value="Buscar Cursos"></x-buttonSubmit>
    </form>
    <h1 class="form-title">

        @if(session('selected') != null)
            {{session('selected')}}
        @endif 
    </h1>
    <x-tableFormData class="table-style" :columns="$cols" :rows="$rows" route="student.deassignCourse" method='POST' btnClass="table-cell btn-deassign"/>   
@endsection