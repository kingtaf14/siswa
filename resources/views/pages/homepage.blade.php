@extends('template')

@section('main')
    <div class="row">
    	<div class="col-md-6 col-lg-6 col-md-offset-3 text-center">
    		<img src="{{asset('/img/teguh.jpg')}}" class="img-responsive img-thumbnail" alt="Responsive image" style="width: 50%;height: 50%;">
    	</div>
    </div><br>
    <div class="row">
		<div class="col-md-6 col-lg-6 col-md-offset-3">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th>Nama</th>
						<td>:</td>
						<td>Teguh</td>
					</tr>
					<tr>
						<th>Kelas</th>
						<td>:</td>
						<td>E</td>
					</tr>
					<tr>
						<th>NPM</th>
						<td>:</td>
						<td>147006264</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
@stop

@section('footer')
    @include('footer')
@stop