@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Datos la Nueva Carrera</h1></center>
        
        <form action="{{route('adminCarrera.create')}}" method="POST">
            @csrf
            <div class="form-group-only">
                <label for="name">Nombre:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <center><button type="submit" class="btn">Registrar Carrera</button></center>
        </form>
    </div>
</div>
