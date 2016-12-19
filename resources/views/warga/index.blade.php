@extends('template')

@section('main')
    <div id="warga">
        <h2>Hallo Warga</h2>

        @include('_partial.flash_message')

        @include('warga.form_pencarian')

        @if (count($warga_list) > 0)
            <table class="table">
                <thead>
                    <tr>
                        <th>NISN</th>
                        <th>Nama</th>
                        <th>Kelas</th>
                        <th>Tgl Lahir</th>
                        <th>JK</th>
                        <th>Telepon</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($warga_list as $warga): ?>
                    <tr>
                        <td>{{ $warga->nisn }}</td>
                        <td>{{ $warga->nama_warga }}</td>
                        <td>{{ $warga->kelas->nama_kelas }}</td>
                        <td>{{ $warga->tanggal_lahir->format('d-m-Y') }}</td>
                        <td>{{ $warga->jenis_kelamin }}</td>
                        <td>{{ !empty($warga->telepon->nomor_telepon) ? $warga->telepon->nomor_telepon : '-' }}</td>
                        <td>
                            <div class="box-button">
                                {{ link_to('warga/' . $warga->id, 'Detail', ['class' => 'btn btn-success btn-sm']) }}
                            </div>
                            @if (Auth::check())
                                <div class="box-button">
                                    {{ link_to('warga/' . $warga->id . '/edit', 'Edit', ['class' => 'btn btn-warning btn-sm']) }}
                                </div>
                                <div class="box-button">
                                    {!! Form::open(['method' => 'DELETE', 'action' => ['wargaController@destroy', $warga->id]]) !!}
                                        {!! Form::submit('Delete', ['class' => 'btn btn-danger btn-sm']) !!}
                                    {!! Form::close() !!}
                                </div>
                            @endif
                        </td>
                    </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        @else
            <p>Tidak ada data warga.</p>
        @endif

        <div class="table-nav">
            <div class="jumlah-data">
                <strong> Jumlah warga: {{ $jumlah_warga }} </strong>
            </div>
            <div class="paging">
                {{ $warga_list->links() }}
            </div>
        </div>

        @if (Auth::check())
            <div class="tombol-nav">
                <a href="warga/create" class="btn btn-primary">Tambah warga</a>
            </div>
        @endif
    </div> <!-- / #warga -->
@stop

@section('footer')
   @include('footer')
@stop