<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingenieria USAC</title>
    <link rel="stylesheet" href="{{ asset('./css/login.css') }}">
</head>

<div class="login-container">
    <img src="{{ asset('./images/logoAzul.png') }}" alt="Imagen de inicio de sesión">
    <div class="form-container">
        <h2>Ingresa tu perfil</h2>
        <form action="{{ route('login.authenticate')  }}" method="post" class="login-form">
            @csrf
            <div class="form-group">
                <label for="user">Usuario:</label>
                <input type="text" id="user" name="user" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                    <label for="rol">Perfil:</label>
                    <select id="rol" name="rol">
                        <option value="0">Estudiante</option>
                        <option value="1">Docente</option>
                        <option value="2">Administrador</option>
                    </select>
                </div>
            <button type="submit" class="btn">Iniciar Sesión</button>
        </form>
    </div>
    
</div>

<!--<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('.login-form');

        form.addEventListener('submit', function(event) {
            event.preventDefault();

            // Obtener los valores de usuario y contraseña
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            // Comprobar si las credenciales son correctas
            if (username === 'admin' && password === 'admin') {
                // Redireccionar a la vista adminHome
                window.location.href = '/adminHome';
            } else {
                // Mostrar mensaje de error o tomar otra acción en caso de credenciales incorrectas
                alert('Usuario o contraseña incorrectos. Por favor, inténtalo de nuevo.');
            }
        });
    });
</script> !-->
<!--!-->