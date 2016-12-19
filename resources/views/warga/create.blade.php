@extends('template')

@section('main')
    <div id="warga">
        <h2>Tambah warga</h2>

        {!! Form::open(['url' => 'warga', 'files' => true]) !!}
            @include('warga.form', ['submitButtonText' => 'Tambah warga'])
        {!! Form::close() !!}
    </div>
@stop

@section('footer')
    @include('footer')
@stop