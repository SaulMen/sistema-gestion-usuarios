@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Curso para Prerrequisito</h1></center>
        
        <form action="{{ route('adminPrerrequisito.create')}}" method="POST">
            @csrf
            <div class="form-group-only">
                <label for="course_id">Curso a Añadir Prerrequisito:</label>
                <select id="course_id" name="course_id">
                    <option value="-1">Seleccione una opción</option>
                    @foreach($res as $curso)
                        @php
                            $numero = explode(" ", $curso['carrera']);
                        @endphp
                        <option value="{{$numero[0]}}">{{$curso['carrera']}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group-only">
            <label for="prerequisite_id">Curso de Prerrequisito:</label>
                <select id="prerequisite_id" name="prerequisite_id">
                    <option value="-1">Seleccione una opción</option>
                    @foreach($res as $curso)
                        @php
                            $numero = explode(" ", $curso['carrera']);
                        @endphp
                        <option value="{{$numero[0]}}">{{$curso['carrera']}}</option>
                    @endforeach
                </select>
            </div>

            <center><button type="submit" class="btn">Agregar Prerrequisito</button></center>
        </form>
    </div>
</div>
