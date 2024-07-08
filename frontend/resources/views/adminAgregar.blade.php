@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Datos del Horario</h1></center>
        
        <form action="">
            
            <div class="form-group-only">
                <label for="codigo">Código del Curso Habilitado:</label>
                <select id="codigo" name="codigo">
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
                <label for="dia">Día:</label>
                <input type="text" id="dia" name="dia" required>
            </div>
            <div class="form-group-only">
                <label for="horario">Horario:</label>
                <input type="text" id="horario" name="hotatio" required>
            </div>

            <center><button type="submit" class="btn">Agregar Horario</button></center>
        </form>
    </div>
</div>
