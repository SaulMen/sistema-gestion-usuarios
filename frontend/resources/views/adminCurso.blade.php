@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Datos del nuevo Curso</h1></center>
        
        <form action="{{route('adminCurso.create')}}" method="POST">
            @csrf
            <div class="form-row">
                <div class="form-group">
                    <label for="id">Código Curso:</label>
                    <input type="text" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <label for="name">Nombre:</label>
                    <input type="text" id="name" name="name" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="required_credits">Créditos Necesarios:</label>
                    <input type="text" id="required_credits" name="required_credits" required>
                </div>
                <div class="form-group">
                    <label for="completed_credits">Créditos que Otorga:</label>
                    <input type="text" id="completed_credits" name="completed_credits" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="career_id">Carrera Perteneciente:</label>
                    <select id="career_id" name="career_id">
                    <option value="-1">Seleccione una opción</option>
                    @foreach($res as $curso)
                        <option value="{{$curso['carrera'][0]}}">{{$curso['carrera']}}</option>
                    @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="is_mandatory">Obligatorio:</label>
                    <select id="is_mandatory" name="is_mandatory">
                    <option value="-1">Seleccione una opción</option>
                        <option value="true">Sí</option>
                        <option value="false">No</option>
                    </select>
                </div>
            </div>

            <center><button type="submit" class="btn">Registrar Curso</button></center>
        </form>
    </div>
</div>
