@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Datos del nuevo Estudiante</h1></center>
        
        <form action="{{route('adminStudent.create')}}" method="POST">
            @csrf
            <div class="form-row">
                <div class="form-group">
                    <label for="carnet">Carnet:</label>
                    <input type="text" id="carnet" name="carnet" required>
                </div>
                <div class="form-group">
                    <label for="career">Carrera:</label>
                    <select id="career" name="career">
                    <option value="-1">Seleccione una opción</option>
                    @foreach($res as $curso)
                        <option value="{{$curso['carrera'][0]}}">{{$curso['carrera']}}</option>
                    @endforeach
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="names">Nombres:</label>
                    <input type="text" id="names" name="names" required>
                </div>
                <div class="form-group">
                    <label for="lastname">Apellidos:</label>
                    <input type="text" id="lastname" name="lastname" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="date">Fecha de Nacimiento:</label>
                    <input type="date" id="date" name="date" required>
                </div>
                <div class="form-group">
                    <label for="email">Correo:</label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Telefono:</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="dpi">Numero de DPI:</label>
                    <input type="text" id="dpi" name="dpi" required>
                </div>
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                </div>
            </div>

            <center><button type="submit" class="btn">Registrar Estudiante</button></center>
        </form>
    </div>
</div>
