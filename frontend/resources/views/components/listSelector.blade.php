<div class="input-group {{isset($class) ? $class : '' }}">
    <label for="{{$name}}" class="label-text">{{ $label}}</label>
    <select id="{{$name}}" name="{{$name}}" class="input-field">
        @if (array_key_exists(0, $items) )
            @foreach ($items as $item)
                <option value="{{isset($value) ? $item[$value] : $item}}">{{isset($value) ? $item[$value] : $item}}</option>
            @endforeach
        @else
            @foreach ($items as $key => $item)
                <option value="{{$key}}">{{$key}}-{{$item}}</option>
            @endforeach
        @endif
    </select>
</div>
