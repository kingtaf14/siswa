@extends('template')

@section('main')
    <div id="warga">
        <h2>Detail warga</h2>

        <table class="table table-striped">
            <tr>
                <th>NISN</th>
                <td>{{ $warga->nisn }}</td>
            </tr>
            <tr>
                <th>Nama</th>
                <td>{{ $warga->nama_warga }}</td>
            </tr>
            <tr>
                <th>Kelas</th>
                <td>{{ $warga->kelas->nama_kelas }}</td>
            </tr>
            <tr>
                <th>Tanggal Lahir</th>
                <td>{{ $warga->tanggal_lahir->format('d-m-Y') }}</td>
            </tr>
            <tr>
                <th>Jenis Kelamin</th>
                <td>{{ $warga->jenis_kelamin }}</td>
            </tr>
            <tr>
                <th>Telepon</th>
                <td>{{ ! empty($warga->telepon->nomor_telepon) ? $warga->telepon->nomor_telepon : '-' }}</td>
            </tr>
            <tr>
                <th>Hobi</th>
                <td>
                    @foreach($warga->hobi as $item)
                    <strong><span>{{ $item->nama_hobi }}</span></strong>,
                    @endforeach
                </td>
            </tr>
            <tr>
                <th>Foto</th>
                <td>
                   @if (isset($warga->foto))
                       <img src="{{ asset('fotoupload/' . $warga->foto) }}">
                   @else
                        @if ($warga->jenis_kelamin == 'L')
                            <img src="{{ asset('fotoupload/dummymale.jpg') }}">
                        @else
                            <img src="{{ asset('fotoupload/dummyfemale.jpg') }}">
                        @endif
                   @endif
                </td>
            </tr>
        </table>
    </div>
@stop

@section('footer')
    @include('footer')
@stop