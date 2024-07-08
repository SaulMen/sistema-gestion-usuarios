<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{ asset('./css/general.css') }}"> 
</head>
<body class="image-background">
    @include('navBarUser')
    <section class="form-container" >
        <form class="form-style" action="@yield('route')" method="@yield('method')">
            @csrf
            <h1 class="form-title">@yield('form-title')</h1>
            @yield('inputData')
        </form>
    </section>
    
</body>
<script>
    var msg = '{{Session::get('alert')}}';
    var exist = '{{Session::has('alert')}}';
    if(exist && msg != null){
        alert(msg);
        '{{Session::put('alert', null)}}'
    }
</script>
</html>
