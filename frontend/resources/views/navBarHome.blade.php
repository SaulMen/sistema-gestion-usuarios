<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingenieria USAC</title>
    <link rel="stylesheet" href="{{ asset('./css/navBarHome.css') }}">
    <link rel="stylesheet" href="{{ asset('./css/bodyHome.css') }}">
    <link rel="stylesheet" href="{{ asset('./css/footer.css') }}">
</head>
<body>
<header>
    <div class="navbar">
        <div class="brand">
            <div class="brand-text">
                <a href="#">
                    <img src="{{ asset('./images/logoNegro.png') }}" alt="Logo" class="brand-logo">
                </a>
            </div>
        </div>
        <div class="nav-links">
            <a href="{{ route('login') }}" class="login-button">Iniciar Sesión</a>
        </div>
    </div>
</header>
</body>
</html>
