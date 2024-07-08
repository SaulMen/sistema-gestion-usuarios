<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estudiante</title>
    <link rel="stylesheet" href="{{ asset('./css/navBarUser.css') }}">
</head>
<header>
    <nav>
        <div id="logo">
        </div>
        <div>
            <ul id = "navbar">
                @php($home = '')
                @php($profile = '')
                @if(session('rol') == "0")
                    @php($home = "studentHome")
                    @php($profile = "studentProfile")
                @else
                    @php($home = "professorHome")
                    @php($profile = "professorProfile")
                @endif
                
                <li><a href="{{url($home)}}" >Inicio</a></li>
                <li><a href="{{url($profile)}}" >Mi Perfil</a></li>
                <li><a href="{{route('adminHome.logout') }}" >Cerrar Sesión</a></li>
            </ul>
        </div>
    </nav>
</header>
