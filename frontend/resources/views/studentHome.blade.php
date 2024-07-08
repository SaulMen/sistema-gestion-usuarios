@extends('layouts.userHomeMaster')

@section('title', 'Home Student')

@section('content')
    <x-buttonMenuOption imageUrl="../icons/assignCourseIcon.svg" routeName="window.location.href = '{{ route('student.assign') }}';">Asignar Curso</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/deassignCourseIcon.svg" routeName="window.location.href = '{{ route('student.deassign') }}';">Desasignar Curso</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/getCurriculumIcon.svg" routeName="window.location.href = '{{ route('student.curriculum') }}';">Consultar Pensum</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/generateCourseReportIcon.svg" routeName="window.location.href = '{{ route('student.home') }}';">Generar Certificado de Cursos</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/requestIcon.svg" routeName="window.location.href = '{{ route('student.request') }}';">Solicitudes</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/scheduleIcon.svg" routeName="window.location.href = '{{ route('consult.schedule') }}';">Consultar Horarios</x-buttonMenuOption>
@endsection


