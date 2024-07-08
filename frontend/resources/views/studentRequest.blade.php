@extends('layouts.multipleFormsView')

@section('title', 'Student Requests')

@section('forms')
    <x-form myclass="single-form left-form">
        <x-divIcon imageUrl="../icons/changeCareerIcon.svg">Cambio de Carrera</x-divIcon>
        <x-listSelector :items="$actuals" name="actual" label="Código de la Carrera Actual"/>
        <x-listSelector :items="$careers" name="career" label="Código de la Carrera" value="carrera"/>
        <x-buttonSubmit class="btn-submit" value="Solicitar Cambio"/>
    </x-form>
    
    <form class="single-form center-form" action="{{route('student.concurrent')}}" method='POST'>
        @csrf
        <x-divIcon imageUrl="../icons/simultaneousIcon.svg">Carrera Simultánea</x-divIcon>
        <x-listSelector :items="$actuals" name="actual" label="Código de la Carrera Actual" />
        <x-listSelector :items="$careers" name="simultaneous" label="Código de la Carrera Simultánea" value="carrera"/>
        <x-buttonSubmit class="btn-submit" value="Solicitar Simultánea"/>
    </form>

    <x-form myclass="single-form left-form">
        <x-divIcon imageUrl="../icons/equivalencesIcon.svg">Equivalencias</x-divIcon>
        <x-listSelector :items="$approvedCourses" name="approved" label="Código del Curso Aprobado"/>
        <x-listSelector :items="$equivalentCourses" name="equivalent" label="Código del Curso Equivalente"/>
        <x-buttonSubmit class="btn-submit" value="Solicitar Equivalencia"/>
    </x-form>
    
    
@endsection