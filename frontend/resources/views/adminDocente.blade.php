@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Datos del nuevo Docente</h1></center>
        
        <form action="{{route('adminDocente.create')}}" method="POST">
            @csrf
            <div class="form-row">
                <div class="form-group">
                    <label for="siif">Siif:</label>
                    <input type="text" id="siif" name="siif" required>
                </div>
                <div class="form-group">
                    <label for="date">Fecha de Nacimiento:</label>
                    <input type="date" id="date" name="date" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="name">Nombres:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="lastname">Apellidos:</label>
                    <input type="text" id="lastname" name="lastname" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Correo:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Telefono:</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="direct">Dirección:</label>
                    <input type="text" id="direct" name="direct" required>
                </div>
                <div class="form-group">
                    <label for="dpi">Numero de DPI:</label>
                    <input type="text" id="dpi" name="dpi" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group-only">
                    <label for="passwrod">Contraseña:</label>
                    <input type="password" id="passwrod" name="passwrod" required>
                </div>
            </div>

            <center><button type="submit" class="btn">Registrar Docente</button></center>
        </form>
    </div>
</div>
