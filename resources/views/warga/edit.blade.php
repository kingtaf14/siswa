@extends('template')

@section('main')
    <div id="warga">
        <h2>Edit warga</h2>

        {!! Form::model($warga, ['method' => 'PATCH', 'action' => ['wargaController@update', $warga->id], 'files' => true]) !!}
            @include('warga.form', ['submitButtonText' => 'Update warga'])
        {!! Form::close() !!}
    </div>
@stop

@section('footer')
    @include('footer')
@stop