<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingenieria USAC</title>
    <link rel="stylesheet" href="{{ asset('./css/navBarHome.css') }}">
    <link rel="stylesheet" href="{{ asset('./css/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('./css/admin.css') }}">
</head>
<body>
<header>
    <div class="navbar">
        <div class="brand">
            <div class="brand-text">
                <a href="{{ route('adminHome') }}">
                    <img src="{{ asset('./images/logoNegro.png') }}" alt="Logo" class="brand-logo">
                </a>
            </div>
        </div>
        <div class="nav-links">
            <form action="{{ route('adminHome') }}" method="get">
                @csrf
                <button type="submit" class="login-button-home">Inicio</button>
            </form>
            <form action="{{ route('adminHome.logout') }}" method="post">
                @csrf
                <button type="submit" class="login-button">Cerrar Sesión</button>
            </form>
        </div>
    </div>
</header>
</body>
</html>
