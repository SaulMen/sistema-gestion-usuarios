@extends('layouts.userHomeMaster')

@section('title', 'Home Professor')

@section('content')
    <x-buttonMenuOption imageUrl="../icons/insertNoteIcon.svg" routeName="window.location.href = '{{ route('professor.notes') }}';">Ingresar Notas</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/generateReportIcon.svg" routeName="window.location.href = '{{ route('professor.generate.report') }}';">Generar Acta</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/studentsIcon.svg" routeName="window.location.href = '{{ route('professor.students') }}';">Consultar Estudiantes Asignados</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/consultApprovalsIcon.svg" routeName="window.location.href = '{{ route('professor.approvals') }}';">Consultar Aprobaciones</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/getReportsIcon.svg" routeName="window.location.href = '{{ route('professor.reports') }}';">Consultar Actas</x-buttonMenuOption>
    <x-buttonMenuOption imageUrl="../icons/scheduleIcon.svg" routeName="window.location.href = '{{ route('consult.schedule') }}';">Consultar Horarios</x-buttonMenuOption>
@endsection