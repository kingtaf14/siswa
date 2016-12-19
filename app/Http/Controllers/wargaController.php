<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests; // path saja, untuk form request (jika ada)
use App\Http\Requests\WargaRequest;
use App\Warga;
use App\Telepon;
use App\No_Rumah;
use App\Pekerjaan;
use Storage;
use Session;

class WargaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth', ['except' => [
            'index',
            'show',
            'cari',
        ]]);
    }


    public function index()
    {
        $Warga_list   = Warga::paginate(5);
        $jumlah_Warga = Warga::count();
        return view('Warga.index', compact('Warga_list', 'jumlah_Warga'));
    }

    public function show(Warga $Warga)
    {
        return view('Warga.show', compact('Warga'));
    }

    public function create()
    {
        return view('Warga.create');
    }

    public function store(WargaRequest $request)
    {
        $input = $request->all();

        // Upload Foto
        if ($request->hasFile('foto')) {
            $input['foto'] = $this->uploadFoto($request);
        }

        // Insert data Warga
        $Warga = Warga::create($input);

        // Insert data telepon
        $telepon = new Telepon;
        $telepon->nomor_telepon = $request->input('nomor_telepon');
        $Warga->telepon()->save($telepon);

        // Insert Pekerjaan
        $Warga->Pekerjaan()->attach($request->input('Pekerjaan_Warga'));

        Session::flash('flash_message', 'Data Warga berhasil disimpan.');

        return redirect('Warga');
    }

    public function edit(Warga $Warga)
    {
        $Warga->nomor_telepon = $Warga->telepon->nomor_telepon;
        return view('Warga.edit', compact('Warga'));
    }

    public function update(Warga $Warga, WargaRequest $request)
    {
        $input = $request->all();

        // Cek apakah ada foto baru di form?
        if ($request->hasFile('foto')) {
            // Hapus foto lama
            $this->hapusFoto($Warga);

            // Upload foto baru
           $input['foto'] = $this->uploadFoto($request);
        }

        // Update Warga di tabel Warga
        $Warga->update($input);

        // Update telepon di tabel telepon
        $telepon = $Warga->telepon;
        $telepon->nomor_telepon = $input['nomor_telepon'];
        $Warga->telepon()->save($telepon);

        // Update Pekerjaan di tabel Pekerjaan_Warga
        if (! is_null($request->input('Pekerjaan_Warga'))) {
            $Warga->Pekerjaan()->sync($request->input('Pekerjaan_Warga'));
        }

        Session::flash('flash_message', 'Data Warga berhasil diupdate.');

        return redirect('Warga');
    }

    public function destroy(Warga $Warga)
    {
        $this->hapusFoto($Warga);
        $Warga->delete();
        Session::flash('flash_message', 'Data Warga berhasil dihapus.');
        Session::flash('penting', true);
        return redirect('Warga');
    }

    public function cari(Request $request)
    {
        $kata_kunci    = trim($request->input('kata_kunci'));

        if (! empty($kata_kunci)) {
            $jenis_kelamin = $request->input('jenis_kelamin');
            $id_No_Rumah      = $request->input('id_No_Rumah');

            // Query
            $query         = Warga::where('nama_Warga', 'LIKE', '%' . $kata_kunci . '%');
            (! empty($jenis_kelamin)) ? $query->JenisKelamin($jenis_kelamin) : '';
            (! empty($id_No_Rumah)) ? $query->No_Rumah($id_No_Rumah) : '';
            $Warga_list = $query->paginate(2);

            // URL Links pagination
            $pagination = (! empty($jenis_kelamin)) ? $Warga_list->appends(['jenis_kelamin' => $jenis_kelamin]) : '';
            $pagination = (! empty($id_No_Rumah)) ? $pagination = $Warga_list->appends(['id_No_Rumah' => $id_No_Rumah]) : '';
            $pagination = $Warga_list->appends(['kata_kunci' => $kata_kunci]);

            $jumlah_Warga = $Warga_list->total();
            return view('Warga.index', compact('Warga_list', 'kata_kunci', 'pagination', 'jumlah_Warga', 'id_No_Rumah', 'jenis_kelamin'));
        }

        return redirect('Warga');
    }

    // ===============================================================
    private function uploadFoto(WargaRequest $request)
    {
        $foto = $request->file('foto');
        $ext  = $foto->getClientOriginalExtension();

        if ($request->file('foto')->isValid()) {
            $foto_name   = date('YmdHis'). ".$ext";
            $upload_path = 'fotoupload';
            $request->file('foto')->move($upload_path, $foto_name);

            // Filename untuk database --> 20160220214738.jpg
            return $foto_name;
        }
        return false;
    }

    private function hapusFoto(Warga $Warga)
    {
        $exist = Storage::disk('foto')->exists($Warga->foto);

        if (isset($Warga->foto) && $exist) {
            $delete = Storage::disk('foto')->delete($Warga->foto);
            if ($delete) {
                return true;
            }
            return false;
        }
    }






    public function tesCollection()
    {
        $orang = ['rasmus lerdorf', 'taylor otwell',
               'brendan eich', 'john Resig'];

        $koleksi = collect($orang)->map(function($nama) {
            return ucwords($nama);
        });

        return $koleksi;
    }

    public function dateMutator()
    {
        $Warga = Warga::findOrFail(1);
        $str = 'Tanggal Lahir: ' .
                $Warga->tanggal_lahir->format('d-m-Y') . '<br>' .
                'Ulang tahun ke-30 akan jatuh pada tanggal: ' .
                '<strong>' .
                $Warga->tanggal_lahir->addYears(30)->format('d-m-Y') .
                '</strong>';
        return $str;
    }
}