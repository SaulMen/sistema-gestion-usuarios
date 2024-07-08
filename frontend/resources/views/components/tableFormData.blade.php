<table class="{{$class}}">
    <tr class="table-header">
            @foreach ($columns as $col)
                <th>{{$col}}</th>
            @endforeach
    </tr>
    @if ($rows)
        @foreach ($rows as $row)
            <tr class="table-row">
                <form class="table-row" action="{{isset($route) ? route($route) : '' }}" method="{{isset($method) ? $method : '' }}">
                    @csrf
                @php($i = 0)
                @foreach ($row as $cell)
                    <th><input class="table-cell" type="text" name="{{$columns[$i]}}" value="{{$cell}}" readonly></th>
                    @php($i++)
                @endforeach
                    <th><input class="{{isset($btnClass) ? $btnClass : ''}}" type="submit" value=''></th>
                </form>
            </tr>
        @endforeach
    @endif
</table>