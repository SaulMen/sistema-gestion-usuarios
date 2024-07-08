@extends('layouts.multipleFormsView')

@section('title', 'Student Profile')

@section('forms')

    <x-form myclass="double-form-container">
        <h1 class="form-title two-columns-item" >{{session('fullname')}} </h1>
        <x-inputField name="carnet" label="Carnet" type="text" value="{{session('carnet')}}" readonly="readonly"/>
        <x-inputField name="dateNac" label="Fecha de Nacimiento" type="text" value="{{session('date_birth')}}" readonly="readonly"/>
        <x-inputField name="dpi" label="Número de DPI" type="text" value="{{session('dpi')}}" readonly="readonly"/>
        <x-inputField name="email" label="Correo" type="text" value="{{session('email')}}" readonly=""/>
        <x-inputField name="career" label="Carrera" type="text" value="{{session('career')}}" readonly="readonly"/>
        <x-inputField name="tel" label="Teléfono" type="text" value="{{session('phone_number')}}" readonly=""/>
        <x-inputField name="creds" label="Créditos Aprobados" type="text" value="{{session('completed_credits')}}" readonly="readonly"/>
        <x-inputField name="dir" label="Dirección" type="text" value="{{session('address')}}" readonly=""/>
        <x-buttonSubmit class="btn-hidden" value="Darme de baja"/>
    </x-form>
   

@endsection