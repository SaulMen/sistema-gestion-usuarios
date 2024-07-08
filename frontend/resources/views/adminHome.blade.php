@include('navBarAdmin')

<div class="admin-home">
    <h2 class="admin-title">¡Bienvenido ADMIN!</h2>
    <!-- <h5>{{ $username }} </h5>
    <h5>{{ $rol }} </h5> !-->
    <div class="button-grid">
        <a href="{{ route('adminStudent') }}" class="button">
            <img src="{{ asset('./icons/registerUsuarios.svg') }}" alt="Logo 1">
            <p>Registrar Estudiante</p>
        </a>
        <a href="{{ route('adminDocente') }}" class="button">
            <img src="{{ asset('./icons/addDocente.svg') }}" alt="Logo 2">
            <p>Registrar Docente</p>
        </a>
        <a href="{{ route('adminCarrera') }}" class="button">
            <img src="{{ asset('./icons/createCarrera.svg') }}" alt="Logo 2">
            <p>Crear Carrera</p>
        </a>
        <a href="{{ route('adminCurso') }}" class="button">
            <img src="{{ asset('./icons/createCurso.svg') }}" alt="Logo 2">
            <p>Crear Curso</p>
        </a>
    </div>

    <div class="button-grid">
        <a href="{{ route('adminHabilitar') }}" class="button">
            <img src="{{ asset('./icons/habilitarCurso.svg') }}" alt="Logo 1">
            <p>Habilitar Curso</p>
        </a>
        <a href="{{ route('adminAgregar') }}" class="button">
            <img src="{{ asset('./icons/addHorario.svg') }}" alt="Logo 2">
            <p>Agregar Horario</p>
        </a>
        <a href="{{ route('adminCargar') }}" class="button">
            <img src="{{ asset('./icons/cargarHorario.svg') }}" alt="Logo 2">
            <p>Cargar Horario</p>
        </a>
        <a href="{{ route('adminTasa') }}" class="button">
            <img src="{{ asset('./icons/tasaDesasignacion.svg') }}" alt="Logo 2">
            <p>Consultar Tasa de Desasignación</p>
        </a>
    </div>
    
    <div class="button-grid-only">
        <a href="{{ route('adminPrerrequisito') }}" class="button">
            <img src="{{ asset('./icons/addPrerrequisito.svg') }}" alt="Logo 2">
            <p>Añadir Prerrequisito</p>
        </a>
    </div>
</div>
