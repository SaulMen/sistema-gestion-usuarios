<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{ asset('./css/general.css') }}"> 
</head>
<body class="image-background">
    @include('navBarUser')
    <section class="table-container">
        @yield('content')
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