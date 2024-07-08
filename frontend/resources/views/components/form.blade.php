<form class="{{ $myclass }}" action="{{isset($action) ? route($action) : ''}}" method="{{isset($method) ? $method : ''}} ">
    @csrf 
    {{$slot}}
</form>