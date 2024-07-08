@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Datos del Curso</h1></center>
        
        <form action="{{route('adminHabilitar.create')}}" method="POST">
            @csrf
            <div class="form-group-only">
                <label for="course_id">Código del Curso:</label>
                <input type="text" id="course_id" name="course_id" required>
            </div>
            <div class="form-group-only">
                <label for="semester">Ciclo:</label>
                <input type="text" id="semester" name="semester" required>
            </div>
            <div class="form-group-only">
                <label for="professor_id">Siif Docente:</label>
                <input type="text" id="professor_id" name="professor_id" required>
            </div>
            <div class="form-group-only">
                <label for="enrollment_capacity">Cupo Máximo:</label>
                <input type="text" id="enrollment_capacity" name="enrollment_capacity" required>
            </div>
            <div class="form-group-only">
                <label for="course_section">Sección:</label>
                <input type="text" id="course_section" name="course_section" required>
            </div>

            <center><button type="submit" class="btn">Habilitar Curso</button></center>
        </form>
    </div>
</div>
