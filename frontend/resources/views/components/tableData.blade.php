<table class="{{$class}}">
    <tr class="table-header">
            @foreach ($columns as $col)
                <th>{{$col}}</th>
            @endforeach
    </tr>
    @if ($rows)
        @foreach ($rows as $row)
            <tr class="table-row">
                @foreach ($row as $cell)
                    <th>{{$cell}}</th>
                @endforeach
            </tr>
        @endforeach
    @endif
</table>