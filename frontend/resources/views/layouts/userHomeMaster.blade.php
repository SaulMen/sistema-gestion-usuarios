<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{ asset('./css/general.css') }}">
    <link rel="stylesheet" href="{{ asset('./css/footer.css') }}">
</head>
<body>
    @include('navBarUser')
    <h1>¡Bienvenido!</h1>
    <section class="menuContainer">
        @yield('content')
    </section>
    
</body>
</html>