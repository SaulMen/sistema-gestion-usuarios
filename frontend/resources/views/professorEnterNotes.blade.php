@extends('layouts.tableView')

@section('title', 'Professor Enter Notes')

@section('content')
    <h1 class="form-title">INGRESAR NOTAS</h1>
    <form class="triple-form" action="/professorConsultStudents1" method="GET">
        <x-listSelector class="three-columns-item" :items="$courses" name="course" label="Código del Curso" value="carrera"/>
        <x-listSelector class="" :items="$cycles" name="cycle" label="Ciclo"/>
        <x-listSelector class="" :items="$years" name="year" label="Año"/>
        <x-listSelector class="" :items="$sections" name="section" label="Sección"/>
        <x-buttonSubmit class="btn-submit three-columns-item" value="Consultar"/>
    </form>
    
    <table class="table-style">
        <tr class="table-header">
                @foreach ($cols as $col)
                    <th>{{$col}}</th>
                @endforeach
        </tr>
        @if ($rows)
            @foreach ($rows as $row)
                <tr class="table-row">
                    <form class="table-row" action="{{route('professor.setStudentNote')}}" method="POST">
                        @csrf
                    @php($i = 0)
                    @foreach ($row as $cell)
                        <th><input class="table-cell" type="text" name="{{$cols[$i]}}" value="{{$cell}}" readonly></th>
                        @php($i++)
                    @endforeach
                        <th><input class="table-cell" type="number" name="{{$cols[$i]}}" value="" ></th>
                        <th><input class="table-cell btn-ok" type="submit" value=''></th>
                    </form>
                </tr>
            @endforeach
        @endif
    </table>
@endsection